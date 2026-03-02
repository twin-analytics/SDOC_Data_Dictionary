# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  PROJECT: REDCap Multi-country Pediatric Sepsis Dataset
#  SCRIPT: 03_Create_Cleaned_Data.R
#  PURPOSE: Combine, clean, and prepare harmonized datasets 
#           from Uganda, Rwanda and Tanzania for further analysis.

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~
# LOAD LIBRARIES    #######
# ~~~~~~~~~~~~~~~~~~~~~~~~~

# Core set of libraries for data manipulation
library(tidyverse) # Data wrangling and transformation
library(expss)     # Manage and preserve variable labels
library(janitor)   # Clean variable names
library(here)      # Simplify relative file paths
library(dplyr)     # Data manipulation (part of tidyverse)
library(sjlabelled)# Label handling for survey data
library(Hmisc)     # Label management, summary stats
library(labelled)

# For Exploratory Data Analysis
library(DataExplorer)# Automated data exploration
library(SmartEDA)    # Data profiling
library(dlookr)      # Data diagnosis and visualization

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# LOAD DATA  AND PREPARE DATASETS #####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Load country-specific REDCap label scripts
# Rename the loaded data and remove the original 'data' object.
# This is done to prevent potential overwriting when loading the next dataset.

redcap_date <- "2025-10-27"

source("Scripts/01_Redcap_Labels.r")
dat_uganda <- data
rm(data)   
  
source("Scripts/02_RedCap_Labels.R")
dat_rwanda_tz <- data %>% 
  filter(country_adm != "uganda")
# dat_rwanda_tz <- subset(dat_rwanda_tz,
#  !(country_adm == "Tanzania" & studygroup_adm %in% c("< 6 months", "6 months to < 5 years")))
rm(data)

# Quick checks
table(dat_rwanda_tz$studygroup_adm)
table(data$studygroup_adm[data$country_adm == "Tanzania"])
table(dat_rwanda_tz$studygroup_adm[dat_rwanda_tz$country_adm == "Tanzania"])

unique(dat_uganda$redcap_event_name)
unique(dat_rwanda_tz$redcap_event_name)
dim(dat_uganda)
dim(dat_rwanda_tz)
glimpse(dat_uganda)
glimpse(dat_rwanda_tz)

# Identify variables that differ between datasets
setdiff(colnames(dat_uganda), colnames(dat_rwanda_tz))
setdiff(colnames(dat_rwanda_tz)[!grepl("\\.factor$", colnames(dat_rwanda_tz))], colnames(dat_uganda))

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# HANDLE LABELLED VARIABLES BEFORE MERGING #####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Count labelled variables
sum(sapply(dat_uganda, is.labelled))
sum(sapply(dat_rwanda_tz, is.labelled))

# Save variable labels before merging
label_vars_uganda <- get_label(dat_uganda)
label_vars_rwanda <- get_label(dat_rwanda_tz)

# Temporarily remove labels (to avoid bind_rows() errors)
dat_uganda_clean <- remove_all_labels(dat_uganda)
dat_rwanda_clean <- remove_all_labels(dat_rwanda_tz)

# Merge datasets safely
dat_raw <- bind_rows(dat_uganda_clean, dat_rwanda_clean)

# Reapply labels
label(dat_raw) <- as.list(c(label_vars_uganda, label_vars_rwanda))[names(dat_raw)]

str(dat_raw)
glimpse(dat_raw)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# GLOBAL DATA MANIPULATIONS  ####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## ~~~~~~~~~~~~~~~~~~~~~~~~~
## Replace Factors Cols ####
## ~~~~~~~~~~~~~~~~~~~~~~~~~

# REDCap automatically creates duplicate factor  versions of each variable
# Replace the original version of variables with the factor versions

# Note that some of the levels are not consistent (levels are sometimes 1,0 or 0,1)
#  This is how it's coded in REDCap though so just need to be careful...

factor_vars <- grep("\\.factor", colnames(dat_raw), value = TRUE)
nonfactor_equivalent <- gsub("\\.factor", "", factor_vars)

# Replace the non-factor version with the factor version of variables
# Make sure to preserve the labels before overwriting
#  Note: Factor version of columns do not have labels
label_vars <- sapply(dat_raw %>% 
                       select(-all_of(factor_vars)), label)

dat_raw[, nonfactor_equivalent] <- dat_raw[, factor_vars]

dat_raw <- dat_raw %>% 
  select(-all_of(factor_vars))

# Add the labels back
label(dat_raw) <- as.list(label_vars)

# Clean the data
dat_clean <- dat_raw %>% 
  clean_names()


## ~~~~~~~~~~~~~~~~~~~~~~~~~
## Remove Consent and QOL (FSS/PedsQL) Sections ####
## ~~~~~~~~~~~~~~~~~~~~~~~~~

# Identify which row each form starts/ends
# Store form index and and colnames into a data frame
form_index <- data.frame(
  EndIndex = grep("complete", colnames(dat_clean)),
  ColName = grep("complete", colnames(dat_clean), value = TRUE)) %>% 
  mutate(StartIndex = c(0, EndIndex[-length(EndIndex)]) + 1)
  
fss_pedsql <- form_index$StartIndex[form_index$ColName == "fss_and_pedsql_patient_details_complete"] :
  form_index$EndIndex[form_index$ColName == "fss_and_pedsql_complete"]
colnames(dat_clean)[fss_pedsql]

grep("consent", form_index$ColName, value = TRUE)
unique(form_index$ColName)

consent_cols <- form_index$StartIndex[form_index$ColName == "consent_form_storage_complete"] : 
  form_index$EndIndex[form_index$ColName == "consent_form_storage_complete"]
colnames(dat_clean)[consent_cols]

dat_clean <- dat_clean %>% 
  select(-all_of(c(fss_pedsql, consent_cols)))


## ~~~~~~~~~~~~~~~~~~~~~~~~~
## Remove Empty Columns ####
## ~~~~~~~~~~~~~~~~~~~~~~~~~

# empty_cols <- names(dat_clean)[
#   sapply(dat_clean, function(x) all(is.na(x) | x == ""))
# ]
# 
#  constant_cols <- names(dat_clean)[
#   sapply(dat_clean, function(x) length(unique(na.omit(x))) <= 1)
# ]
#  
# constant_cols
# 
# unique(dat_clean$otherstudy_checkbox_adm_6); unique(dat_clean$admitabx_adm_11)
# unique(dat_clean$hivquestions_adm_4); unique(dat_clean$respinterv_dis_3)
# 
# dat_clean <- dat_clean %>% 
#   select(-all_of(c(empty_cols, constant_cols)))


## ~~~~~~~~~~~~~~~~~~~~~~~~~
## Preserve Data Labels ####
## ~~~~~~~~~~~~~~~~~~~~~~~~~

# Subsequent data manipulations may remove labels since tidyverse
#  functions are not compatible with labels and will get overwritten
# Need to make sure to store the labels so we can re-apply them again later
label_vars <- sapply(dat_clean, label)


## ~~~~~~~~~~~~~~~~~~~~~~~~~
## NA If Unknown        ####
## ~~~~~~~~~~~~~~~~~~~~~~~~~

# Replace unknown, don't know, doesn't know with NA
# Define columns where 97 = Unknown
Unknown_97 <- c("vaccmeasles_adm",
                "vaccpneumoc_adm",
                "vaccdpt_adm",
                "deliverytype_adm",
                "exclbreastfed_adm",
                "totalbreastfed_adm",
                "priorhealth_adm",
                "momhiv_adm",
                "pddcaregiverpresent_fol",
                "accident_pda",
                "accidentintent_pda")

# Define columns where 97 = Don’t know
Dont_know_97 <- c("illnessduration_pda",
                  "fever_pda",
                  "feverdays_pda",
                  "feveruntildeath_pda",
                  "feverseverity_pda",
                  "stools_pda",
                  "stoolsfreq_pda",
                  "stooluntildeath_pda",
                  "cough_pda",
                  "coughdays_pda",
                  "coughseverity_pda",
                  "breathdiff_pda",
                  "breathdiffdays_pda",
                  "breathfast_pda",
                  "breathfastdays_pda",
                  "indraw_pda",
                  "grunt_pda",
                  "convulsion_pda",
                  "unconscious_pda",
                  "unconshours_pda",
                  "stiffneck_pda",
                  "fontanelle_pda",
                  "skinrash_pda",
                  "skinrashdays_pda",
                  "skinflake_pda",
                  "haircolor_pda",
                  "belly_pda",
                  "anemia_pda",
                  "armpitswell_pda",
                  "bleeding_pda",
                  "skinblack_pda",
                  "causeknown_pda",
                  "certissued_pda",
                  "certavail_pda")

# Define columns where 97 = Unsure
unsure_97 <- c("oxygenavail_adm")

# Combine them into one vector
not_sure <- c(Unknown_97, Dont_know_97, unsure_97)

# Replace 97 or text equivalents ("Dont know", "Unsure", etc.) with NA
dat_clean <- dat_clean %>%
  mutate(across(any_of(not_sure), 
                ~ factor(case_when(
                  . %in% c(97, "97", "Dont know", "Don't know", 
                           "Not sure", "Unsure", "Unknown") ~ NA,
                  TRUE ~ .)
                )))


## ~~~~~~~~~~~~~~~~~~~~~~~~~
## Re-level Yes/No Variables ####
## ~~~~~~~~~~~~~~~~~~~~~~~~~

# Currently, for yes/no variables, yes is the reference group
# We need to make it so no is the reference

levels(dat_clean$infection_adm) # Yes is the reference group
factor_vars <- lapply(dat_clean, levels)
factor_vars$infection_adm

yesno_vars <- sapply(factor_vars, identical, c("Yes", "No"))
yesno_vars <- names(yesno_vars[yesno_vars])  # keeps only the TRUE elements (columns that are Yes/No)
dat_clean <- dat_clean %>% 
  mutate(across(all_of(yesno_vars), ~relevel(., ref = "No")))

## ~~~~~~~~~~~~~~~~~~~
## Replace Blanks ####
## ~~~~~~~~~~~~~~~~~~~

# Replace blank values with NA
dat_clean <- dat_clean %>% 
  # Apply function na_if across all character columns
  mutate(across(where(is.character), ~na_if(., "")))

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# FILL DOWN NON-FOLLOWUP VARIABLES ####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

followup_cols <- grep("_fol", colnames(dat_clean), value = TRUE)

# view(subset(dat_clean, studyid_adm == "0002-1A-CH-004"))

dat_clean <- dat_clean %>%
  group_by(studyid_adm) %>%
  fill(-all_of(followup_cols), .direction = "down") %>%
  ungroup()

levels(dat_clean$redcap_event_name)
autopsy_rows <- dat_clean %>% 
  filter(redcap_event_name == "Autopsy")

autopsy_rows %>% 
  select(studyid_adm, ageadmit_adm, studygroup_adm, infection_adm, excludeadmit_adm,
         consenttype_adm, consentobtained_adm, admitdate_adm, attendant_adm, attendantsex_adm) %>% 
  glimpse()
View(autopsy_rows)

adm_rows <- dat_clean %>% 
  filter(redcap_event_name == c("hospitalization and discharge"))
glimpse(adm_rows)

event_rows <- dat_clean %>% 
  filter(redcap_event_name %in% c("2 month discharge", "4 month discharge", "6 month discharge", "12 month discharge", "Autopsy"))

autopsy_rows %>% 
  select(studyid_adm, redcap_event_name, infection_adm, malariastatuspos_adm, death_dis) %>% 
  print(n=Inf)

table(dat_clean$infection_adm); table(autopsy_rows$malariastatuspos_adm)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# FILL DOWN AUTOPSY ROWS   ####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
followup_cols <- grep("_fol", colnames(dat_clean), value = TRUE)

dat_clean <- dat_clean %>%
  group_by(studyid_adm) %>%
  fill(-all_of(followup_cols), .direction = "up") %>%
  ungroup()


# Then apply the filter
dat_clean <- dat_clean %>% 
  filter(redcap_event_name != "Autopsy")



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ONLY FINAL VISIT         ####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Quick checks
dat_subset <- dat_clean %>%
  arrange(redcap_event_name) %>% 
  group_by(studyid_adm) %>% 
  slice_tail(n=1) %>% 
  ungroup()

dat_clean <- dat_subset



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CHILDREN DATA GLOBAL MANIPULATION ######
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
table(dat_clean$studygroup_adm)
range(dat_clean$agecalc_adm, na.rm = TRUE)
sum(is.na(dat_clean$agecalc_adm))


dat_clean2 <- dat_clean %>%
  mutate(
    # Combine time to hospital categories
    
    # Combine modes of transport
    
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # Combine DAMA reason variables    #####     
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    damareason_new_1 = case_when(
      damareason_dama_1 == "Checked" | damareason_dis_1 == "Checked" ~ "Checked",
      is.na(damareason_dama_1) & is.na(damareason_dis_1) ~ NA_character_,
      TRUE ~ "Unchecked"
    ),
    damareason_new_1 = factor(damareason_new_1, levels = c("Unchecked", "Checked")),
    
    damareason_new_2 = case_when(
      damareason_dama_2 == "Checked" | damareason_dis_2 == "Checked" ~ "Checked",
      is.na(damareason_dama_2) & is.na(damareason_dis_2) ~ NA_character_,
      TRUE ~ "Unchecked"
    ),
    damareason_new_2 = factor(damareason_new_2, levels = c("Unchecked", "Checked")),
    
    damareason_new_3 = case_when(
      damareason_dama_3 == "Checked" | damareason_dis_3 == "Checked" ~ "Checked",
      is.na(damareason_dama_3) & is.na(damareason_dis_3) ~ NA_character_,
      TRUE ~ "Unchecked"
    ),
    damareason_new_3 = factor(damareason_new_3, levels = c("Unchecked", "Checked")),
    
    damareason_new_4 = case_when(
      damareason_dama_4 == "Checked" | damareason_dis_4 == "Checked" ~ "Checked",
      is.na(damareason_dama_4) & is.na(damareason_dis_4) ~ NA_character_,
      TRUE ~ "Unchecked"
    ),
    damareason_new_4 = factor(damareason_new_4, levels = c("Unchecked", "Checked")),
    
    damareason_new_5 = case_when(
      damareason_dama_5 == "Checked" | damareason_dis_5 == "Checked" ~ "Checked",
      is.na(damareason_dama_5) & is.na(damareason_dis_5) ~ NA_character_,
      TRUE ~ "Unchecked"
    ),
    damareason_new_5 = factor(damareason_new_5, levels = c("Unchecked", "Checked")),
    
    damareason_new_6 = case_when(
      damareason_dama_6 == "Checked" | damareason_dis_6 == "Checked" ~ "Checked",
      is.na(damareason_dama_6) & is.na(damareason_dis_6) ~ NA_character_,
      TRUE ~ "Unchecked"
    ),
    damareason_new_6 = factor(damareason_new_6, levels = c("Unchecked", "Checked")),
    
    damareason_new_7 = case_when(
      damareason_dama_7 == "Checked" | damareason_dis_7 == "Checked" ~ "Checked",
      is.na(damareason_dama_7) & is.na(damareason_dis_7) ~ NA_character_,
      TRUE ~ "Unchecked"
    ),
    damareason_new_7 = factor(damareason_new_7, levels = c("Unchecked", "Checked")),
    
    damareason_new_8 = case_when(
      damareason_dama_8 == "Checked" | damareason_dis_8 == "Checked" ~ "Checked",
      is.na(damareason_dama_8) & is.na(damareason_dis_8) ~ NA_character_,
      TRUE ~ "Unchecked"
    ),
    damareason_new_8 = factor(damareason_new_8, levels = c("Unchecked", "Checked")),
    
    damareason_new_97 = case_when(
      damareason_dama_97 == "Checked" | damareason_dis_97 == "Checked" ~ "Checked",
      is.na(damareason_dama_97) & is.na(damareason_dis_97) ~ NA_character_,
      TRUE ~ "Unchecked"
    ),
    damareason_new_97 = factor(damareason_new_97, levels = c("Unchecked", "Checked")),
    
    damareason_new_98 = case_when(
      damareason_dama_98 == "Checked" | damareason_dis_98 == "Checked" ~ "Checked",
      is.na(damareason_dama_98) & is.na(damareason_dis_98) ~ NA_character_,
      TRUE ~ "Unchecked"
    ),
    damareason_new_98 = factor(damareason_new_98, levels = c("Unchecked", "Checked")),
    
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # Prior hospitalization (Dont know -> NA) ####
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    priorhosp_adm_new = case_when(
      as.character(priorhosp_adm) == "Dont know" ~ NA_character_,
      TRUE ~ as.character(priorhosp_adm)
    ),
    priorhosp2_adm_new = case_when(
      as.character(priorhosp2_adm) == "Dont know" ~ NA_character_,
      TRUE ~ as.character(priorhosp2_adm)
    ),
    
    # Combine
    priorhosp_comb = case_when(
      !is.na(priorhosp_adm_new)  ~ priorhosp_adm_new,
      !is.na(priorhosp2_adm_new) ~ priorhosp2_adm_new,
      TRUE ~ NA_character_
    ),
    
    # Re-apply factor levels (no "Dont know")
    priorhosp_comb = factor(
      priorhosp_comb,
      levels = c(
        "< 7 days",
        "7 days to < 1 month",
        "1 month to < 6 months",
        "6 months to < 1 year",
        "1 year or more",
        "Never"
      )
    ),
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # Dates, LOS, and Age Derivations        ####
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    disch_date = as.Date(dischdate_dis),
    admit_date = as.Date(admitdate_adm),
    dob_date   = as.Date(dob_adm),
    
    los_days = as.numeric(disch_date - admit_date),
    
    age_days = case_when(
      !is.na(dob_date) & !is.na(admit_date) ~ as.numeric(admit_date - dob_date),
      !is.na(agecalc_adm) ~ as.numeric(agecalc_adm) * 30.4375,
      TRUE ~ NA_real_
    ),
    
    age_months = age_days / 30.4375,
    age_years  = floor(age_days / 365.25),
    
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # Unplanned discharge: DAMA or Fled      ####
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    dischstatus_unplanned = factor(
      case_when(
        dischstatus_dis %in% c("Discharged against medical advice", "Fled/escaped") ~ "Unplanned discharge",
        dischstatus_dis == "Routine discharge" ~ "Routine discharge",
        dischstatus_dis == "Referred to higher level of care" ~ "Referred",
        TRUE ~ NA_character_
      ),
      levels = c("Routine discharge", "Unplanned discharge", "Referred")
    ),
    
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # Combine SpO2 at discharge             ####
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    spo2_1 = suppressWarnings(as.numeric(as.character(spo2site1_pc_oxi_dis))),
    spo2_2 = suppressWarnings(as.numeric(as.character(spo2site2_pc_oxi_dis))),
    spo2_3 = suppressWarnings(as.numeric(as.character(spo2other_dis))),
    
    spo2_dis = case_when(
      !is.na(spo2_1) | !is.na(spo2_2) | !is.na(spo2_3) ~ pmin(spo2_1, spo2_2, spo2_3, na.rm = TRUE),
      TRUE ~ NA_real_
    ),
    
    hypoxemia_dis = factor(
      case_when(
        is.na(spo2_dis) ~ NA_character_,
        spo2_dis < 90   ~ "Checked",
        TRUE            ~ "Unchecked"
      ),
      levels = c("Unchecked", "Checked")
    ),
    
    hypoxia = factor(
      case_when(
        is.na(spo2_dis) ~ NA_character_,
        spo2_dis < 95   ~ "Checked",
        TRUE            ~ "Unchecked"
      ),
      levels = c("Unchecked", "Checked")
    ),
    
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # Discharge status                       ####
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    dischstatus_dis_new = factor(
      case_when(
        dischstatus_dis == "Routine discharge" ~ "Routine discharge",
        dischstatus_dis == "Discharged against medical advice" ~ "DAMA",
        dischstatus_dis == "Referred to higher level of care" ~ "Referred",
        dischstatus_dis == "Fled/escaped" ~ "Fled",
        TRUE ~ NA_character_
      ),
      levels = c("Routine discharge", "DAMA", "Referred", "Fled")
    ),
    
    # HIV
    hiv_status_new = factor(
      case_when(
        hivstatus_adm == "HIV positive" ~ "Yes",
        hivstatus_adm == "HIV negative" ~ "No",
        hivstatus_adm == "Refused Test" ~ NA_character_,
        TRUE ~ NA_character_
      ),
      levels = c("No", "Yes")
    ),
    
    # Axillary temperature
    axillary_temp_cat = factor(
      case_when(
        is.na(temp_c_adm) ~ NA_character_,
        temp_c_adm < 36.5 ~ "<36.5",
        temp_c_adm >= 36.5 & temp_c_adm <= 37.5 ~ "36.5–37.5",
        temp_c_adm > 37.5 & temp_c_adm <= 39 ~ "37.6–39",
        temp_c_adm > 39 ~ ">39"
      ),
      levels = c("<36.5", "36.5–37.5", "37.6–39", ">39")
    ),
    
    # Haemoglobin (fix labels/levels mismatch)
    hb_status = factor(
      case_when(
        is.na(hemoglobin_gpdl_adm) ~ NA_character_,
        hemoglobin_gpdl_adm < 7 ~ "Severe anemia (<7)",
        hemoglobin_gpdl_adm >= 7 & hemoglobin_gpdl_adm < 11 ~ "Moderate anemia (7–<11)",
        hemoglobin_gpdl_adm >= 11 ~ "Not anaemic (>=11)"
      ),
      levels = c("Not anaemic (>=11)", "Moderate anemia (7–<11)", "Severe anemia (<7)")
    ),
    
    glucose_status = factor(
      case_when(
        is.na(glucose_mmolpl_adm) ~ NA_character_,
        glucose_mmolpl_adm < 2.5  ~ "Hypoglycemia (<2.5)",
        glucose_mmolpl_adm > 11   ~ "Hyperglycemia (>11)",
        TRUE                      ~ "Normal (2.5–11)"
      ),
      levels = c("Normal (2.5–11)", "Hypoglycemia (<2.5)", "Hyperglycemia (>11)")
    ),
    
    jaundice_adm_new = factor(
      case_when(
        jaundice_adm == "Yes" ~ "Yes",
        jaundice_adm == "No" ~ "No",
        TRUE ~ NA_character_
      ),
      levels = c("No", "Yes")
    ),
    
    feedingstatus_dis_new = factor(
      case_when(
        feedingstatus_dis == "Dont know" ~ NA_character_,
        TRUE ~ as.character(feedingstatus_dis)
      ),
      levels = c("Feeding well", "Feeding poorly", "Not feeding at all")
    )
  ) %>%
  select(-spo2_1, -spo2_2, -spo2_3)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# SAVE WORKSPACE             ########
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Only keep final datasets
to_keep <- c("dat_uganda", "dat_rwanda_tz", "dat_raw", "dat_subset", "dat_clean", "redcap_date")
rm(list = setdiff(ls(), to_keep))

save.image(paste0("Workspace/03_Create_Cleaned_Data (", redcap_date, ").RData"))

