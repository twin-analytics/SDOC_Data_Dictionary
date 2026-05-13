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
library(zscorer) # WHO child growth z-scores
library(lubridate)
library(officer)
library(flextable)

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

redcap_date <- "2026-05-06"

dat_UG <- local({
  source("Scripts/01_Redcap_Labelsv0.02.R", local = TRUE)
 data
})

dat_RT <- local({
  source("Scripts/02_RedCap_Labelsv0.02.R", local = TRUE)
data}) %>% 
  filter(country_adm != "uganda")

# Quick checks
unique(dat_UG$redcap_event_name)
unique(dat_RT$redcap_event_name)
dim(dat_UG)
dim(dat_RT)

# Identify variables that differ between datasets
setdiff(colnames(dat_UG), colnames(dat_RT))
setdiff(colnames(dat_RT)[!grepl("\\.factor$", colnames(dat_RT))], colnames(dat_UG))

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# HANDLE LABELLED VARIABLES BEFORE MERGING #####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Count labelled variables
sum(sapply(dat_UG, is.labelled))
sum(sapply(dat_RT, is.labelled))

# Save variable labels before merging
label_vars_uganda <- get_label(dat_UG)
label_vars_rwanda <- get_label(dat_RT)

# Temporarily remove labels (to avoid bind_rows() errors)
dat_UG_clean <- remove_all_labels(dat_UG)
dat_rwanda_clean <- remove_all_labels(dat_RT)

# Merge datasets safely
dat_raw <- bind_rows(dat_UG_clean, dat_rwanda_clean)

# Reapply labels
label(dat_raw) <- as.list(c(label_vars_uganda, label_vars_rwanda))[names(dat_raw)]


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
                  "certavail_pda",
                  "prioryearwheeze_adm",
                  "prioryearcough_adm",
                  "diarrheaoften_adm",
                  "tbcontact_adm",
                  "feedingstatus_adm",
                  "feedingstatus_onliq_adm",
                  "feedingstatus_onsolids_adm",
                  "tradhealer_adm",
                  "momedu_adm",
                  "maternalsubstance_adm_97",
                  "symptoms_adm_97",
                  "momhivtx_adm",
                  "diffhome_adm",
                  "food_adm",
                  "birthdetail_adm_97",
                  "internetuse_illness_adm",
                  "damareason_dis_97",
                  "damareason_dama_97",
                  "comorbidity_adm_97",
                  "pddcaresource_fol",
                  "pdrehospsource1_fol",
                  "birthresuscitation_adm_97",
                  "pdrehospsource2_fol",
                  "internetuse_fol",
                  "accidenttype_pda",
                  "jaundice_adm",
                  "accidenttype_pda_97",
                  "priorhosp_adm",
                  "priorhosp2_adm")

dont_know_3 <- c("transfusion_dis",
                 "concern_dis",
                 "concernrecov_dis",
                 "concernsick_dis",
                 "concerncare_dis",
                 "concernresourc_dis",
                 "priorweekabx_adm",
                 "priorweekantimal_adm",
                 "pddcaresource_fol",
                 "pdrehospsource1_fol",
                 "pdrehospsource2_fol",
                 "internetuse_fol",
                 "urinesymp_adm",
                 "urine_adm",
                 "icu_dis",
                 "resp_dis",
                 "dialysis_dis",
                 "teareptepi_adm",
                 "steroids_dis",
                 "urinepain_adm",
                 "bloodtransfuse_adm",
                 "kidneydis_adm",
                 "swelling_adm",
                 "pallorcojunc_adm",
                 "jaundice_adm",
                 "dehydration_adm",
                 "prioryearwheeze_adm",
                 "diarrheaoften_adm",
                 "tbcontact_adm",
                 "tradhealer_dis")

dont_know_4 <- c("feedingstatus_dis",
                 "swellinglocation_adm")

dont_know_5 <- c("pddloc_fol",
                 "urinepaintime_adm",
                 "transfustimes_adm",
                 "swellingtime_adm",
                 "teaprobtime_adm")

dont_know_7 <- c("priorhosp_adm",
                 "priorhosp2_adm")

# Define columns where 97 = Unsure
unsure_97 <- c("oxygenavail_adm")

# Combine them into one vector
not_sure <- c(Unknown_97, Dont_know_97, unsure_97, dont_know_3, dont_know_4,
              dont_know_5, dont_know_7)

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


dat_clean <- dat_clean %>%
  mutate(
    
    #############################################################
    # ADMISSION VARIABLES
    #############################################################
    
    # Prior hospitalization
    priorhosp_adm_new = case_when(
      !is.na(priorhosp_adm)  ~ as.character(priorhosp_adm),
      !is.na(priorhosp2_adm) ~ as.character(priorhosp2_adm),
      TRUE ~ NA_character_
    ),
    
    priorhosp_adm_new = factor(
      case_when(
        priorhosp_adm_new == "Never" ~ "None",
        priorhosp_adm_new %in% c("< 7 days","7 days to < 1 month") ~ "<1 month",
        priorhosp_adm_new %in% c("1 month to < 6 months","6 months to < 1 year") ~ "1 month to 1 year",
        priorhosp_adm_new == "1 year or more" ~ ">1 year",
        TRUE ~ NA_character_
      ),
      levels = c("None","<1 month","1 month to 1 year",">1 year")
    ),
    
    # Travel distance
    traveldist_adm_new = factor(
      case_when(
        traveldist_adm %in% c("< 30 minutes","30 minutes to < 1 hour") ~ "<1 hour",
        traveldist_adm %in% c("1 hour to < 2 hours","2 hours to < 3 hours") ~ "1-3 hours",
        traveldist_adm %in% c("3 hours to < 4 hours","4 hours to < 8 hours","8 hours or more") ~ ">3 hours",
        TRUE ~ NA_character_
      ),
      levels = c("<1 hour","1-3 hours",">3 hours")
    ),
    
    #############################################################
    # TRAVEL METHOD
    #############################################################
    
    travelmethodother_adm_new = factor(
      case_when(
      as.character(travelmethodother_adm) %in% c("biycle","bicycle") ~ "bicycle",
      as.character(travelmethodother_adm) == "haice" ~ "taxi",
      as.character(travelmethodother_adm) %in% c("bus ( kisire luxury)","bus") ~ "bus",
      as.character(travelmethodother_adm) %in% c("boat and taxi","boat and tax") ~ "boat + taxi",
      TRUE ~ as.character(travelmethodother_adm)
    )),
    
    travelmethod_adm_new = factor(
      case_when(
        travelmethod_adm %in% c("Private vehicle","Taxi/special hire","Motorcycle") |
          travelmethodother_adm_new %in% c("public transport","bus","taxi","boat + taxi") ~
          "Motorized transport",
        
        travelmethod_adm == "Ambulance" |
          travelmethodother_adm_new == "ambulance boat" ~ "Ambulance",
        
        travelmethod_adm %in% c("Walking","Other") ~ "Non-Motorized",
        
        TRUE ~ NA_character_
      ),
      levels = c("Motorized transport","Ambulance","Non-Motorized")
    ),
    
    #############################################################
    # HIV
    #############################################################
    
    hiv_status_new = factor(
      case_when(
        hivstatus_adm == "HIV positive" ~ "Yes",
        hivstatus_adm == "HIV negative" ~ "No",
        hivstatus_adm == "Refused Test" ~ NA_character_,
        TRUE ~ NA_character_
      ),
      levels = c("No","Yes")
    ),
    
    # Maternal HIV
    momhiv_adm_new = factor(
      case_when(
        momhiv_adm == "Positive" ~ "Yes",
        momhiv_adm == "Negative" ~ "No",
        TRUE ~ NA_character_
      ),
      levels = c("No","Yes")
  ),
    #############################################################
    # TEMPERATURE
    #############################################################
    
    temp_c_adm_cat = factor(
      case_when(
        is.na(temp_c_adm) ~ NA_character_,
        temp_c_adm < 36.5 ~ "<36.5",
        temp_c_adm <= 37.5 ~ "36.5–37.5",
        temp_c_adm <= 39 ~ "37.6–39",
        temp_c_adm > 39 ~ ">39"
      ),
      levels = c("<36.5","36.5–37.5","37.6–39",">39")
    ),
    
    #############################################################
    # HAEMOGLOBIN
    #############################################################
    
    anemia = factor(
      case_when(
        is.na(hemoglobin_gpdl_adm) ~ NA_character_,
        hemoglobin_gpdl_adm < 7 ~ "Severe anemia (<7)",
        hemoglobin_gpdl_adm < 11 ~ "Moderate anemia (7–<11)",
        TRUE ~ "Not anaemic (>=11)"
      ),
      levels = c("Not anaemic (>=11)","Moderate anemia (7–<11)","Severe anemia (<7)")
    ),
    
    #############################################################
    # GLUCOSE
    #############################################################
    
    glucose_mmolpl_adm_new = factor(
      case_when(
        is.na(glucose_mmolpl_adm) ~ NA_character_,
        glucose_mmolpl_adm < 2.5 ~ "Hypoglycemia (<2.5)",
        glucose_mmolpl_adm > 11 ~ "Hyperglycemia (>11)",
        TRUE ~ "Normal (2.5–11)"
      ),
      levels = c("Normal (2.5–11)","Hypoglycemia (<2.5)","Hyperglycemia (>11)")
    ),
    
    #############################################################
    # SpO2 ADMISSION
    #############################################################
    
    spo2_adm = rowMeans(
      cbind(spo2site1_pc_oxi_adm,
            spo2site2_pc_oxi_adm),
      na.rm = TRUE),
  spo2_adm_cat = factor(
    case_when(
    spo2_adm < 90 ~ "90%",
    spo2_adm <= 95 ~ "90%-95%",
    spo2_adm > 95 ~ "95%")
  ),
  
    # MUAC 
    muac_mm_adm_new = factor(
      case_when(
        muac_mm_adm < 115 ~ "Severe",
        muac_mm_adm < 125 ~ "Moderate",
        TRUE ~ "Normal"
        )
    ),
    
    #############################################################
    # DATE VARIABLES
    #############################################################
    
    admit_datetime = ymd_hm(paste(admitdate_adm, admittime_adm)),
    disch_datetime = ymd_hm(paste(dischdate_dis, dischtime_dis)),
    
    los_hours = as.numeric(disch_datetime - admit_datetime, units = "hours"),
    
    los_days = as.numeric(as.Date(dischdate_dis) - as.Date(admitdate_adm)),
    
    agecalc_adm_new = agecalc_adm/12
  )

#############################################################
# DISCHARGE VARIABLES
#############################################################

dat_clean <- dat_clean %>% 
  mutate(

# Discharge status
dischstatus_dis_new = factor(
  case_when(
    dischstatus_dis %in% c("Discharged against medical advice","Fled/escaped") ~ "Unplanned discharge",
    dischstatus_dis == "Routine discharge" ~ "Routine discharge",
    dischstatus_dis == "Referred to higher level of care" ~ "Referred",
    TRUE ~ NA_character_
  ),
  levels = c("Routine discharge","Unplanned discharge","Referred")
),

# Combine SpO2 discharge
spo2_dis = rowMeans(
  cbind(
    spo2site1_pc_oxi_dis,
    spo2site2_pc_oxi_dis),
  na.rm = TRUE
),
spo2_dis_cat = case_when(
  spo2_dis < 90 ~ "90%",
  spo2_dis <= 95 ~ "90%-95%",
  spo2_dis > 95 ~ "95%"
),

# Hypoxemia
hypoxemia_dis = factor(
  case_when(
    is.na(spo2_dis) ~ NA_character_,
    spo2_dis < 90 ~ "Checked",
    TRUE ~ "Unchecked"
  ),
  levels = c("Unchecked","Checked")
),

# Hypoxia
hypoxia = factor(
  case_when(
    is.na(spo2_dis) ~ NA_character_,
    spo2_dis < 95 ~ "Checked",
    TRUE ~ "Unchecked"
  ),
  levels = c("Unchecked","Checked")
),

#############################################################
# DAMA REASONS
#############################################################

damareason_new_1 = factor(
  case_when(
    damareason_dama_1 == "Checked" | damareason_dis_1 == "Checked" ~ "Checked",
    is.na(damareason_dama_1) & is.na(damareason_dis_1) ~ NA_character_,
    TRUE ~ "Unchecked"
  ),
  levels = c("Unchecked","Checked")
),

damareason_new_2 = factor(
  case_when(
    damareason_dama_2 == "Checked" | damareason_dis_2 == "Checked" ~ "Checked",
    is.na(damareason_dama_2) & is.na(damareason_dis_2) ~ NA_character_,
    TRUE ~ "Unchecked"
  ),
  levels = c("Unchecked","Checked")
),
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
damareason_new_98 = factor(damareason_new_98, levels = c("Unchecked", "Checked"))

)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# OTHER DERIVED VARIABLES       #####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Named vector of expected ages per grade
# expected_age_ug <- c(
#   # Pre-school
#   "pre_primary" = 5,
#   
#   # Primary
#   "P1" = 6, "P2" = 7, "P3" = 8, "P4" = 9,
#   "P5" = 10, "P6" = 11, "P7" = 12,
#   
#   # Secondary
#   "S1" = 13, "S2" = 14, "S3" = 15,
#   "S4" = 16, "S5" = 17, "S6" = 18
# )
# dat_clean$expected_age_ug <- expected_age_ug[dat_clean$childedulevel_adm]
# 
# # Reference dates
# # Ensure proper date formats
# # School start date (Feb 1 of admission year)
# dat_clean$school_start <- as.Date(paste0(year(dat_clean$admitdate_adm), "-02-01"))
# 
# # Educational age at school start
# dat_clean$actual_age <- year(dat_clean$school_start) - year(dat_clean$dob_adm)
# 
# # Age difference
# # Age difference: positive = enrolled early, negative = enrolled late/off track
# dat_clean$age_diff_school_start <- dat_clean$expected_age_ug - dat_clean$actual_age
# 
# # Categorise
# dat_clean$childedulevel_adm_new <- case_when(
#   dat_clean$age_diff_school_start == 0  ~ "On track",
#   dat_clean$age_diff_school_start >  0  ~ "Early",
#   dat_clean$age_diff_school_start <  0  ~ "Off track",
#   TRUE ~ NA_character_
# )

# Named vector of expected ages per grade
expected_age_ug <- c(
  "pre_primary" = 5,
  "P1" = 6, "P2" = 7, "P3" = 8, "P4" = 9,
  "P5" = 10, "P6" = 11, "P7" = 12,
  "S1" = 13, "S2" = 14, "S3" = 15,
  "S4" = 16, "S5" = 17, "S6" = 18
)

# Expected age based on grade
dat_clean$expected_age_ug <- expected_age_ug[dat_clean$childedulevel_adm]

# School start date (Feb 1 of admission year)
dat_clean$admitdate_adm <- as.Date(dat_clean$admitdate_adm)
# dat_clean$school_start <- as.Date(paste0(year(dat_clean$admitdate_adm), "-02-01"))
dat_clean$school_start <- as.Date(
  ifelse(
    !is.na(dat_clean$admitdate_adm),
    paste0(year(dat_clean$admitdate_adm), "-02-01"),
    NA
  )
)

# Actual age at school start (in years)
dat_clean$actual_age_at_school_start <- year(dat_clean$school_start) - year(dat_clean$dob_adm)

# Age difference: positive = enrolled early, negative = enrolled late/off track
dat_clean$age_diff_school_start <- dat_clean$expected_age_ug - dat_clean$actual_age_at_school_start

# Categorise
# dat_clean$childedulevel_adm_new <- case_when(
#   dat_clean$age_diff_school_start == 0 ~ "On track",
#   dat_clean$age_diff_school_start >  0 ~ "Early",
#   dat_clean$age_diff_school_start <  0 ~ "Off track",
#   TRUE ~ NA_character_
# )
dat_clean$childedulevel_adm_new <- factor(
  case_when(
  dat_clean$age_diff_school_start >= 0 ~ "On track",
  dat_clean$age_diff_school_start <  0 ~ "Off track",
  TRUE ~ NA_character_
))
table(dat_clean$childedulevel_adm_new)


# ~~~~~~~~~~~~~~~~~~~~~
# Anthropometry Derived #####
# ~~~~~~~~~~~~~~~~~~~~~

# Recode sex to numeric (1 = male, 2 = female)
dat_clean$sex_adm_new <- factor(
  ifelse(dat_clean$sex_adm == "Male", "Male",
         ifelse(dat_clean$sex_adm == "Female", "Female", NA)),
  levels = c("Female", "Male")  # Female is reference group
)
table(dat_clean$sex_adm_new)

# Convert MUAC to cm 
dat_clean$muac_cm <- dat_clean$muac_mm_adm / 10

# Convert age to days FIRST
dat_clean$agecalc_days <- dat_clean$agecalc_adm * (365.25 / 12)

dat_clean$sex_adm_wgsr <- ifelse(dat_clean$sex_adm == "Male", 1,
                                 ifelse(dat_clean$sex_adm == "Female", 2, NA))

dat_clean <- addWGSR(
  data       = dat_clean,
  sex        = "sex_adm_wgsr",
  firstPart  = "weight_kg_adm",
  secondPart = "agecalc_days",
  index      = "wfa",
  output     = "weight_for_age"
)

dat_clean <- addWGSR(
  data       = dat_clean,
  sex        = "sex_adm_wgsr",
  firstPart  = "height_cm_adm",
  secondPart = "agecalc_days",
  index      = "hfa",
  output     = "height_for_age"
)

dat_clean <- addWGSR(
  data       = dat_clean,
  sex        = "sex_adm_wgsr",
  firstPart  = "weight_kg_adm",
  secondPart = "height_cm_adm",
  thirdPart = "agecalc_adm",
  index      = "bfa",
  output     = "bmi_for_age"
)

# Verify they are now numeric vectors
class(dat_clean$weight_for_age)
class(dat_clean$height_for_age)
class(dat_clean$bmi_for_age)
summary(dat_clean$agecalc_adm)
sum(!is.na(dat_clean$height_for_age))
sum(!is.na(dat_clean$bmi_for_age))
sum(!is.na(dat_clean$weight_for_age))

head(dat_clean$height_for_age[!is.na(dat_clean$height_for_age)])
head(dat_clean$bmi_for_age[!is.na(dat_clean$bmi_for_age)])
head(dat_clean$weight_for_age[!is.na(dat_clean$weight_for_age)])

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Z-score classifications                              #######
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# Weight-for-age Z score
dat_clean$weight_for_age_cat <- factor(
  case_when(
  dat_clean$weight_for_age < -3              ~ "<-3",
  dat_clean$weight_for_age >= -3 &
    dat_clean$weight_for_age < -2            ~ "-3 to -2",
  dat_clean$weight_for_age >= -2             ~ ">-2",
  TRUE                             ~ NA_character_
 ),
 levels = c(">-2", "-3 to -2", "<-3") # >-2 is reference group (healthy)
)

# Length/Height-for-age Z score
dat_clean$height_for_age_cat <- factor(
  case_when(
  dat_clean$height_for_age < -3              ~ "<-3",
  dat_clean$height_for_age >= -3 &
    dat_clean$height_for_age < -2            ~ "-3 to -2",
  dat_clean$height_for_age >= -2             ~ ">-2",
  TRUE                             ~ NA_character_
),
levels = c(">-2", "-3 to -2", "<-3") # >-2 is reference group (healthy)
)

# BMI Z score
dat_clean$bmi_for_age_cat <- factor(
  case_when(
  dat_clean$bmi_for_age < -3              ~ "<-3",
  dat_clean$bmi_for_age >= -3 &
    dat_clean$bmi_for_age < -2            ~ "-3 to -2",
  dat_clean$bmi_for_age >= -2             ~ ">-2",
  TRUE                             ~ NA_character_
),
levels = c(">-2", "-3 to -2", "<-3") # >-2 is reference group (healthy)
)


# Quick check
table(dat_clean$height_for_age_cat,  useNA = "always")
table(dat_clean$height_for_age_cat,  useNA = "always")
table(dat_clean$bmi_for_age_cat,  useNA = "always")
summary(dat_clean[, c("bmi_for_age","weight_for_age","height_for_age")])

summary(dat_clean$spo2site1_pc_oxi_dis)
summary(dat_clean$spo2site2_pc_oxi_dis)
summary(dat_clean$spo2other_dis)
summary(dat_clean$spo2_adm)
summary(dat_clean$spo2_dis)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# SAVE WORKSPACE             ########
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Only keep final datasets
to_keep <- c("dat_UG", "dat_RT", "dat_raw", "dat_subset", "dat_clean", "redcap_date")
rm(list = setdiff(ls(), to_keep))

save.image(paste0("Workspace/Create_Cleaned_Data (", redcap_date, ").RData"))
