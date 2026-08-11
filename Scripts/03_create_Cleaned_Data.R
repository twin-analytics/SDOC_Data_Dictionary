# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  PROJECT: REDCap Multi-country Pediatric Sepsis Dataset
#  SCRIPT: 03_Create_Cleaned_Data.R
#  PURPOSE: Combine, clean, and prepare harmonized datasets 
#           from Uganda, Rwanda and Tanzania for further analysis.

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
library(zscorer)   # WHO child growth z-scores
library(lubridate)
library(officer)
library(flextable)
library(patchwork)
library(ggplot2)
library(collapse)
library(mice)        # for multiple imputation


# For Exploratory Data Analysis
library(DataExplorer)# Automated data exploration
library(SmartEDA)    # Data profiling
library(dlookr)      # Data diagnosis and visualization

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# LOAD DATA  AND PREPARE DATASETS ####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Load country-specific REDCap label scripts
# Rename the loaded data and remove the original 'data' object.
# This is done to prevent potential overwriting when loading the next dataset.

redcap_date <- "2026-07-22"

dat_UG <- local({
  source("Scripts/01_Redcap_Labelsv0.02.R", local = TRUE)
 data
})

dat_RT <- local({
  source("Scripts/02_RedCap_Labelsv0.03.R", local = TRUE)
  data})

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# HELPER FUNCTIONS          #########
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Apply helper function to reapply variable labels
apply_labels <- function(data,
                         labels){
  
  common_vars <- intersect(names(data), names(labels))
  
  for(i in common_vars)
    if(!is.null(labels[[i]]) && 
       !is.na(labels[[i]])) {
      labelled::var_label(data[[i]]) <- labels[[i]]
    }
  
  data
}

# Filter patients 
RT_Patients <- dat_RT %>% 
  filter(country_adm != "uganda")

dat_RT <- dat_RT %>% 
  filter(studyid_adm %in% RT_Patients$studyid_adm)

# Quick checks
unique(dat_UG$redcap_event_name)
unique(dat_RT$redcap_event_name)

# Identify variables that differ between datasets
setdiff(colnames(dat_UG), colnames(dat_RT))
setdiff(colnames(dat_RT)[!grepl("\\.factor$", colnames(dat_RT))], colnames(dat_UG))


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# GLOBAL DATA MANIPULATIONS  ####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Extract labels from both datasets
labels_UG <- var_label(dat_UG)
labels_RT <- var_label(dat_RT)

# Combine datasets
dat_raw <- bind_rows(
  dat_UG, dat_RT
)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Combine variable labels
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# var_labels <- labelled::var_label(dat_raw)

all_labels <- labels_RT

all_labels[names(labels_UG)] <- labels_UG


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Remove labels
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# dat_raw <- bind_rows(
#   remove_all_labels(dat_UG),
#   remove_all_labels(dat_RT)
# )

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Restore labels
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

labelled::var_label(dat_raw) <- all_labels


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

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Remove Consent and QOL (FSS/PedsQL) Sections ####
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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


## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Re-level Yes/No Variables ####
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

## ~~~~~~~~~~~~~~~~~~~~
## Re-apply labels ####
## ~~~~~~~~~~~~~~~~~~~~

label(dat_clean) <- as.list(label_vars)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# FILL DOWN NON-FOLLOWUP VARIABLES ####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# followup_cols <- grep("_fol", colnames(dat_clean), value = TRUE)
# 
# dat_clean <- dat_clean %>%
#   group_by(studyid_adm) %>%
#   fill(-all_of(followup_cols), .direction = "down") %>%
#   ungroup()

levels(dat_clean$redcap_event_name)
autopsy_rows <- dat_clean %>% 
  filter(redcap_event_name == "Autopsy")

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# FILL DOWN AUTOPSY ROWS   ####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# followup_cols <- grep("_fol", colnames(dat_clean), value = TRUE)
# 
# dat_clean <- dat_clean %>%
#   group_by(studyid_adm) %>%
#   fill(-all_of(followup_cols), .direction = "up") %>%
#   ungroup()
system.time({
  followup_cols <- grep("_fol", colnames(dat_clean), value = TRUE)
  fill_vars <- colnames(dat_clean)[!(colnames(dat_clean) %in% followup_cols)]
  
  
  dat_clean[, fill_vars] <- dat_clean[, fill_vars] %>%
    TRA(
      STATS = ffirst(dat_clean[, fill_vars], g = dat_clean$studyid_adm, na.rm = TRUE),
      FUN = "replace_na",
      g = dat_clean$studyid_adm
    )
  
  
  dat_clean[, fill_vars] <- dat_clean[, fill_vars] %>%
    TRA(
      STATS = flast(dat_clean[, fill_vars], g = dat_clean$studyid_adm, na.rm = TRUE),
      FUN = "replace_na",
      g = dat_clean$studyid_adm
    )
  
})

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


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CHILDREN DATA GLOBAL MANIPULATION                                         ####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

table(dat_clean$studygroup_adm)
range(dat_clean$agecalc_adm, na.rm = TRUE)
sum(is.na(dat_clean$agecalc_adm))

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ADMISSION VARIABLES                                                     #####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
dat_clean <- dat_clean %>%
  mutate(
    
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
    
    # ~~~~~~~~~~~~~~~~~
    # TRAVEL METHOD                                        
    # ~~~~~~~~~~~~~~~~~
    
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
    
    # ~~~~~~~
    # HIV                                                   
    # ~~~~~~~
    
    hiv_status_new = factor(
      case_when(
        hivstatus_adm == "HIV positive" ~ "Yes",
        hivstatus_adm == "HIV negative" ~ "No",
        hivstatus_adm == "Refused Test" ~ NA_character_,
        TRUE ~ NA_character_
      ),
      levels = c("No","Yes")
    ),
    
    # ~~~~~~~~~~~~~
    # Maternal HIV
    # ~~~~~~~~~~~~~
    
    momhiv_adm_new = factor(
      case_when(
        momhiv_adm == "Positive" ~ "Yes",
        momhiv_adm == "Negative" ~ "No",
        TRUE ~ NA_character_
      ),
      levels = c("No","Yes")
  ),
    # ~~~~~~~~~~~~~~~
    # TEMPERATURE
    # ~~~~~~~~~~~~~~~
    
    temp_c_adm_cat = factor(
      case_when(
        is.na(temp_c_adm) ~ NA_character_,
        temp_c_adm < 36.5 ~ "<36.5",
        temp_c_adm <= 37.5 ~ "36.5–37.5",
        temp_c_adm <= 39 ~ "37.6–39",
        temp_c_adm > 39 ~ ">39"
      ),
      levels = c("36.5–37.5", "<36.5", "37.6–39", ">39")
    ),
    
    # ~~~~~~~~~~~~~~
    # HAEMOGLOBIN
    # ~~~~~~~~~~~~~~
    
    anemia = factor(
      case_when(
        is.na(hemoglobin_gpdl_adm) ~ NA_character_,
        hemoglobin_gpdl_adm < 7 ~ "Severe anemia (<7)",
        hemoglobin_gpdl_adm < 11 ~ "Moderate anemia (7–<11)",
        TRUE ~ "Not anaemic (>=11)"
      ),
      levels = c("Not anaemic (>=11)","Moderate anemia (7–<11)","Severe anemia (<7)")
    ),
    
    # ~~~~~~~~~~
    # GLUCOSE
    # ~~~~~~~~~~
    
    glucose_mmolpl_adm_new = factor(
      case_when(
        is.na(glucose_mmolpl_adm) ~ NA_character_,
        glucose_mmolpl_adm < 2.5 ~ "Hypoglycemia (<2.5)",
        glucose_mmolpl_adm > 11 ~ "Hyperglycemia (>11)",
        TRUE ~ "Normal (2.5–11)"
      ),
      levels = c("Normal (2.5–11)","Hypoglycemia (<2.5)","Hyperglycemia (>11)")
    ),
  
  # ~~~~~~~~~~~~~~~~~
  # LACTATE   
  # ~~~~~~~~~~~~~~~~~
  lactate_mmolpl_adm_new = factor(
    case_when(
      is.na(lactate_mmolpl_adm) ~ NA_character_,
      lactate_mmolpl_adm < 2 ~ "Normal (<2)",
      lactate_mmolpl_adm <= 5  ~ "Moderate (2-5)",
      lactate_mmolpl_adm > 5 ~ "Severe (>5)"
    ),
    levels = c("Normal", "Moderate", "Severe")
  ),
  
    # ~~~~~~~~~~~~~~~~~
    # SPO2 ADMISSION
    # ~~~~~~~~~~~~~~~~~
    
    spo2_adm = rowMeans(
      cbind(spo2site1_pc_oxi_adm,
            spo2site2_pc_oxi_adm),
      na.rm = TRUE),
  spo2_adm_cat = factor(
    case_when(
    spo2_adm < 90 ~ "<90%",
    spo2_adm <= 95 ~ "90%-95%",
    spo2_adm > 95 ~ ">95%")
  ),
  spo2_adm_cat <- factor(
    spo2_adm_cat,
    levels = c("95%", "90%-95%", "90%")
    ),
                         
    # MUAC 
    muac_mm_adm_new = factor(
      case_when(
        muac_mm_adm < 115 ~ "Severe",
        muac_mm_adm < 125 ~ "Moderate",
        TRUE ~ "Normal"
        )
    ),
    
    # ~~~~~~~~~~~~~~~~~~~~~~~~
    # DATE VARIABLES     #####
    # ~~~~~~~~~~~~~~~~~~~~~~~~
    
    admit_datetime = ymd_hm(paste(admitdate_adm, admittime_adm)),
    disch_datetime = ymd_hm(paste(dischdate_dis, dischtime_dis)),
    
    los_hours = as.numeric(disch_datetime - admit_datetime, units = "hours"),
    
    los_days = as.numeric(as.Date(dischdate_dis) - as.Date(admitdate_adm)),
    
    agecalc_adm_new = agecalc_adm/12
  )

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DISCHARGE VARIABLES                                                       ####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
  spo2_dis < 90 ~ "<90%",
  spo2_dis <= 95 ~ "90%-95%",
  spo2_dis > 95 ~ ">95%",
  TRUE ~ NA_character_
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

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DAMA REASON VARIABLES                                                  #######
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

# OXYGEN SATURATION AT ADMISSION
dat_clean <- dat_clean |>
  mutate(
    spo2_adm = rowMeans(
      pick(
        spo2site1_pc_oxi_adm,
        spo2site2_pc_oxi_adm
      ),
      na.rm = TRUE
    ),
    spo2_adm_cat = case_when(
      is.na(spo2_adm) ~ NA_character_,
      spo2_dis < 90 ~ "<90%",
      between(spo2_adm, 90, 95) ~ "90%-95%",
      spo2_adm > 95 ~ ">95%"
    ),
    spo2_adm_cat = factor(
      spo2_adm_cat,
      levels = c("<90%", "90%-95%", ">95%")
    )
  )

table(dat_clean$spo2_adm_cat)

# OXYGEN SATURATION AT DISRCHARGE
dat_clean <- dat_clean |>
  mutate(
    spo2_dis = rowMeans(
      pick(
        spo2site1_pc_oxi_dis,
        spo2site2_pc_oxi_dis
      ),
      na.rm = TRUE
    ),
    spo2_dis_cat = case_when(
      is.na(spo2_dis) ~ NA_character_,
      spo2_dis < 90 ~ "<90%",
      between(spo2_dis, 90, 95) ~ "90%-95%",
      spo2_dis > 95 ~ ">95%"
    ),
    spo2_dis_cat = factor(
      spo2_dis_cat,
      levels = c("<90%", "90%-95%", ">95%")
    )
  )


# Refactor
dat_clean$spo2_adm_cat <- factor(
  dat_clean$spo2_adm_cat,
  levels = c(">95%", "90%-95%", "<90%")
  )

dat_clean$spo2_dis_cat <- factor(
  dat_clean$spo2_dis_cat,
  levels = c(">95%", "90%-95%", "<90%")
)

levels(dat_clean$spo2_adm_cat)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# OTHER DERIVED VARIABLES       #####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Age categories mapped to school grade

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
dat_clean$childedulevel_adm_new <- factor(
  case_when(
  dat_clean$age_diff_school_start >= 0 ~ "On track",
  dat_clean$age_diff_school_start <  0 ~ "Off track",
  TRUE ~ NA_character_
))
table(dat_clean$childedulevel_adm_new)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~
# Anthropometry Derived ####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~

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


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# SES INDEX SCORE                                               #####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Each item contributes 1 point if the "better" condition is present
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

dat_clean <- dat_clean %>%
  mutate(
    ses_flooring = (flooring_adm_3 == "Checked"),
    ses_toilet = as.integer(toilettype_adm == "Flush toilet system (sitting or squatting)"),
    ses_cooking = (cookfuel_adm_5 == "Checked" | cookfuel_adm_4 == "Checked"),
    #  SAFE DRINKING WATER 
    # Excludes: open/unprotected (4), slow/fast running (5,6), river/lake (9)
    ses_water = as.integer(watersource_adm %in% c(
      "Municipal water / tap water / piped water",
      "Bore hole",
      "Protected spring",
      "Bottled water",
      "Rain water"
    )),
    ses_electricity = as.integer(appliances_adm_1 == "Checked"),
    ses_tv = (appliances_adm_2 == "Checked"),
    ses_fridge = (appliances_adm_4 == "Checked"),
    ses_smartphone = (possessions_adm_1 == "Checked"),
    ses_motorcycle = (possessions_adm_4 == "Checked"),
    ses_car = (possessions_adm_5 == "Checked"),
    
    # NA propagation: if watersource_adm is NA the whole score becomes NA,
    # matching the reference code's sesindex_safewater NA check.
    sesindex_sum = ses_flooring +
      ses_toilet   +
      ses_cooking  +
      ses_water    +
      ses_electricity +
      ses_tv +
      ses_fridge +
      ses_smartphone +
      ses_motorcycle +
      ses_car,
    sesindex_sum = ifelse(is.na(watersource_adm), NA_real_, sesindex_sum),
    
    #  CATEGORICAL SES ####
    # Tertile-based cutpoints derived from the observed score distribution
    # (n = 3,461; scores 0–10). With discrete integer scores, equal thirds
    # are not achievable exactly; these cutpoints minimise the maximum
    # deviation from 33% across groups:
    #   Low  ≤ 1 → ~27%  |  Mod  2–4 → ~42%  |  High  ≥ 5 → ~31%
    # Previous reference-code thresholds (≤2 / 3–4 / ≥5) were designed for
    # an older 3-item index and produced unbalanced groups (44% / 24% / 31%)
    # after the index was expanded to 10 items.
    sesindex_cat = factor(
      case_when(
        sesindex_sum <= 1              ~ "Low SES",
        sesindex_sum >= 2 & sesindex_sum <= 4 ~ "Mod SES",
        sesindex_sum >= 5              ~ "High SES",
        TRUE                           ~ NA_character_
      ),
      levels = c("Low SES", "Mod SES", "High SES")
    )
    
  ) %>%
  select(
    studyid_adm,
    country_adm,
    # component scores
    ses_flooring,
    ses_toilet,
    ses_cooking,
    ses_water,
    ses_electricity,
    ses_tv, ses_fridge, ses_smartphone, ses_motorcycle, ses_car,
    # summary indices
    sesindex_sum,
    sesindex_cat, 
    everything()
  )


# COMA SCORE COMPUTATION
dat_clean <- dat_clean %>%
  mutate(
    eye_score = case_when(
      bcseye_adm == "Watches or follows" ~ 1,
      bcseye_adm == "Fails to watch or follow" ~ 0,
      TRUE ~ NA_real_
    ),
    motor_score = case_when(
      bcsmotor_adm == "Localizes painful stimulus" ~ 2,
      bcsmotor_adm == "Withdraws limb from painful stimulus" ~ 1,
      bcsmotor_adm == "No response or inappropriate response" ~ 0,
      TRUE ~ NA_real_
    ),
    verbal_score = case_when(
      bcsverbal_adm == "Cries appropriately with pain, or, if verbal, speaks" ~ 2,
      bcsverbal_adm == "Moan or abnormal cry with pain" ~ 1,
      bcsverbal_adm == "No vocal response to pain" ~ 0,
      TRUE ~ NA_real_
    ),
    coma_score = eye_score + motor_score + verbal_score
  )


dat_clean <- dat_clean %>%
  mutate(
    coma_score_cat = case_when(
      coma_score == 5 ~ "Normal",
      coma_score < 5  ~ "Abnormal",
      TRUE ~ NA_character_
    ),
    coma_score_cat = factor(
      coma_score_cat,
      levels = c("Normal", "Abnormal")
    )
  )

table(dat_clean$coma_score_cat)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# QUICK DISTRIBUTION CHECK             ######
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Score distribution
table(dat_clean$sesindex_sum, useNA = "always")

# Category distribution
table(dat_clean$sesindex_cat, useNA = "always")

# Cross-tab: score by country
with(dat_clean, table(country_adm, sesindex_cat, useNA = "always"))

# ~~~~~~~~~~~~~
# PLOTS    ####
# ~~~~~~~~~~~~~

# dat_clean %>% 
#   filter(!is.na(country_adm)) %>% 
#   select(country_adm, sesindex_sum,
#          ses_flooring, ses_toilet, ses_cooking, ses_water,
#          ses_electricity, ses_tv, ses_fridge, ses_smartphone,
#          ses_motorcycle, ses_car) %>% 
#   pivot_longer(
#     starts_with("ses_"),
#     names_to = "item",
#     values_to = "has_asset"
#   ) %>% 
#   filter(!is.na(sesindex_sum), !is.na(has_asset)) %>% 
#   mutate(
#     item = str_to_title(str_remove(item, "ses_")),
#     has_asset = factor(has_asset,
#                        levels = c(0, 1),
#                        labels = c("No", "Yes"))
#   ) %>% 
#   ggplot(aes(x = has_asset, y = sesindex_sum, fill = country_adm)) +
#   geom_boxplot(outlier.size = 0.4, linewidth = 0.4) +
#   facet_wrap(~item, nrow = 2) +
#   scale_fill_brewer(palette = "Set2") +
#   labs(
#     x = "Owns Asset",
#     y = "SES Index Score (0–10)",
#     fill = "Country",
#     title = "SES Score Distribution by Asset Ownership and Country"
#   ) +
#   theme(
#     legend.position = "bottom",
#     strip.text = element_text(face = "bold")
#   )
# 
# # HISTOGRAM ####
# # Overall SES score distribution with category shading 
# ggplot(
#   dat_clean %>%  filter(!is.na(sesindex_sum)),
#   aes(x = sesindex_sum, fill = country_adm)
# ) +
#   geom_bar(position = "dodge") +
#   scale_x_continuous(breaks = 0:10) +
#   scale_fill_brewer(palette = "Set2", na.value = "grey70") +
#   labs(
#     title = "Overall SES Score Distribution",
#     x = "SES Index Score (0–10)", y = "Count", fill = "Country"
#   ) +
#   theme(legend.position = "bottom")
# 
# # HEATMAP ####
# dat_clean %>%
#   select(
#     country_adm,
#     ses_flooring,
#     ses_toilet,
#     ses_cooking,
#     ses_water,
#     ses_electricity,
#     ses_tv,
#     ses_fridge,
#     ses_smartphone,
#     ses_motorcycle,
#     ses_car
#   ) %>%
#   pivot_longer(
#     -country_adm,
#     names_to = "item",
#     values_to = "value"
#   ) %>%
#   group_by(country_adm, item) %>%
#   summarise(
#     pct_yes = mean(value == 1, na.rm = TRUE) * 100,
#     .groups = "drop"
#   ) %>%
#   ggplot(
#     aes(
#       x = country_adm,
#       y = item,
#       fill = pct_yes
#     )
#   ) +
#   geom_tile() +
#   geom_text(
#     aes(label = round(pct_yes, 0)),
#     size = 3
#   ) +
#   labs(
#     title = "SES Asset Ownership (%) by Country",
#     x = "Country",
#     y = ""
#   ) +
#   theme_minimal()
# 
# 
# # BOXPLOT ####
# ggplot(
#   dat_clean %>%  filter(!is.na(sesindex_sum), !is.na(country_adm)),
#   aes(x = country_adm, y = sesindex_sum, fill = country_adm)) +
#   geom_boxplot() +
#   scale_fill_brewer(palette = "Set2") +
#   labs(
#     title = "SES Score Distribution by Country",
#     x = NULL, y = "SES Index Score (0–10)"
#   ) +
#   theme(legend.position = "none")
# 
# # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# # SCATTER PLOT SES DISTRIBUTION IN TANZANIA ####
# # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# # SES Distribution Among Deaths Only
# 
# dat_clean %>%
#   filter(country_adm == "Tanzania",
#          healthstatus_fol_new == "Died",
#          !is.na(sesindex_sum)) %>%
#   ggplot(aes(x = sesindex_sum)) +
#   geom_bar() +
#   scale_x_continuous(limits = c(0, 9), breaks = 0:10) +
#   labs(
#     title = "SES Distribution Among Deaths in Tanzania",
#     x = "SES Index Score",
#     y = "Number of Deaths"
#   ) +
#   theme_minimal()
# 
# # DENSITY PLOT ####
# dat_clean %>%
#   mutate(PD_death = as.factor(healthstatus_fol_new)) %>%
#   filter(country_adm == "Tanzania",
#          !is.na(sesindex_sum),
#          !is.na(PD_death)) %>% 
#   ggplot(aes(x = sesindex_sum, fill = PD_death)) +
#   geom_density(alpha = 0.5) +
#   scale_x_continuous(limits = c(0, 9), breaks = 0:9) +
#   labs(
#     title = "SES Distribution Among Deaths in Tanzania",
#     x = "SES Index Score",
#     y = "Density"
#   ) +
#   theme_minimal()


# ~~~~~~~~~~~~~~~~~~~~~~~~~~
# POST DICHARGE OUTCOME ####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~
dat_clean <- dat_clean %>% 
  mutate(healthstatus_fol_new = case_when(
    healthstatus_fol == "Child died" ~ 1,
    healthstatus_fol %in% c("Appears normal",
                            "Recovering (not yet back to normal)",
                            "Appears worse") ~ 0,
    TRUE ~ NA_integer_
  ),
  healthstatus_fol_new = factor(healthstatus_fol_new,
                                levels = c(0, 1),
                                labels = c("Survived", "Died")
  )
)

table(dat_clean$healthstatus_fol_new, useNA = "ifany")
table(dat_clean$healthstatus_fol, useNA = "ifany")

# Post Discharge Death 
dat_clean <- dat_clean %>%
  mutate(
    deathcause_pda = str_squish(as.character(deathcause_pda)),
    
    deathcause_pda_new = case_when(
      deathcause_pda %in% c("Anaemia", "Anemia") ~ "Anaemia",
      
      deathcause_pda == "Cardiac arest" ~ "Cardiac Arrest",
      
      deathcause_pda == "Downs syndrome." ~ "Genetic Disorder",
      
      deathcause_pda == "Meningitis." ~ "Meningitis",
      
      deathcause_pda %in% c(
        "Cardiac Disease",
        "Cardiac diseases",
        "Cardiac diseases.",
        "Heart Disease",
        "Heart diseases",
        "Rheumatic heart disease."
      ) ~ "Heart Disease",
      
      deathcause_pda %in% c(
        "Brain Tumor",
        "CA of Blood",
        "Lung CA",
        "Neoplastic disorder",
        "A Tumor close to liver,spleen and kidney with resultant Hepatitis.",
        "Child was diagnosed with brain tumor and died while in ICU following on set of seizures."
      ) ~ "Malignancy",
      
      deathcause_pda %in% c(
        "Kidney disease",
        "Kidney disease.",
        "Kidney failure",
        "Renal failure",
        "Ascitis following kidney failure."
      ) ~ "Kidney Disease",
      
      deathcause_pda %in% c(
        "Pneumonia",
        "Severe pneumonia"
      ) ~ "Pneumonia",
      
      deathcause_pda %in% c(
        "Sepsis",
        "Severe sepsis",
        "Respiratory failure secondary to septicemia",
        "Respiratory failure secondary to severe sepsis"
      ) ~ "Sepsis",
      
      deathcause_pda %in% c(
        "SCD",
        "SCD with crisis",
        "SCD with Crisis",
        "SCD and Malaria"
      ) ~ "Sickle Cell Disease",
      
      TRUE ~ deathcause_pda
    ),
    
    pddcaresought_fol_new = factor(
      dplyr::recode(
      as.character(pddcaresought_fol),
      "Yes - once" = "Once",
      "Yes - more than once" = "More than Once",
      "No - child died before care was sought" = "Child died before care was sought"
      ),
      levels = c(
        "Once",
        "More than Once",
        "Child died before care was sought"
        )
    )
  )


# VARIABLES TO ADD IN THE DATA DICTIONARY
additional_vars <- c(
  "urine_adm",
  "urinesymp_adm",
  "urinecolor_adm",
  "teaprobtime_adm",
  "kidneydis_adm",
  "swelling_adm",
  "dehydrationappearance_adm",
  "dehydrationeyes_adm",
  "dehydrationthirst_adm",
  "dehydrationturgor_adm",
  "creatininemgdl_adm",
  "creatinine_significant_adm",
  "creatinineumoll_adm",
  "creatinineoutside_adm",
  "urinalysisdate_adm",
  "urinalysistime_adm",
  "urinalysisampm_adm")

               
# Combine Changes in urine color and urine color into a single variable.
dat_clean <- dat_clean %>% 
  mutate(
    urine_color_cat = case_when(
      urinesymp_adm == "No" ~ "No Changes",
      urinesymp_adm == "Yes" & urinecolor_adm == "Deep yellow (concentrated)" ~ "Deep Yellow",
      urinesymp_adm == "Yes" & urinecolor_adm == "Bloody" ~ "Bloody",
      urinesymp_adm == "Yes" & urinecolor_adm == "Tea colored" ~ "Tea Colored",
      TRUE ~ NA_character_
    ),
    urine_color_cat = factor(
      urine_color_cat,
      levels = c("No Changes",
                 "Bloody",
                 "Deep Yellow",
                 "Tea Colored")
    )
  )

table(dat_clean$urine_color_cat)

# Harmonize creatinine into a single variable
creatininemgdl_adm = as.numeric(unclass(zap_labels(dat_clean$creatininemgdl_adm)))
creatinineumoll_adm = as.numeric(unclass(zap_labels(dat_clean$creatinineumoll_adm)))

# Implausible mg/dL values (<0.2 or >10)
bad_mgdl <- dat_clean %>%
  filter(creatininemgdl_adm < 0.2 | creatininemgdl_adm > 10)

# Implausible µmol/L values (<20 or >2000)
bad_umol <- dat_clean %>%
  filter(creatinineumoll_adm < 20 | creatinineumoll_adm > 2000)

nrow(bad_mgdl)
nrow(bad_umol)

Q1 <- quantile(dat_clean$creatinineumoll_adm, 0.25, na.rm = TRUE)
Q3 <- quantile(dat_clean$creatinineumoll_adm, 0.75, na.rm = TRUE)
IQR_val <- IQR(dat_clean$creatinineumoll_adm, na.rm = TRUE)

upper_limit <- Q3 + 1.5 * IQR_val

extreme_rows <- dat_clean %>%
  filter(creatinineumoll_adm > upper_limit) %>% 
  select(studyid_adm, country_adm, creatinineumoll_adm, creatininemgdl_adm)

nrow(extreme_rows)

summary(dat_clean$creatininemgdl_adm)
summary(dat_clean$creatinineumoll_adm)
summary(bad_mgdl$creatininemgdl_adm)
summary(bad_umol$creatinineumoll_adm)

bad_umol %>%
  count(country_adm)

boxplot(
  dat_clean$creatinineumoll_adm,
  main = "Creatinine µmol/L"
  )

hist(
  dat_clean$creatinineumoll_adm,
  breaks = 50,
  main = "Creatinine µmol/L Distribution"
  )

dat_clean <- dat_clean %>%
  mutate(
    # Clean implausible values first
    creatininemgdl_clean = ifelse(
      creatininemgdl_adm < 0.2 | creatininemgdl_adm > 10,
      NA_real_,
      creatininemgdl_adm
    ),
    
    creatinineumoll_clean = ifelse(
      creatinineumoll_adm < 20 | creatinineumoll_adm > 2000,
      NA_real_,
      creatinineumoll_adm
    ),
    
    # Harmonize into mg/dL
    creatinine_mgdl_new = case_when(
      !is.na(creatininemgdl_clean)  ~ creatininemgdl_clean,
      !is.na(creatinineumoll_clean) ~ creatinineumoll_clean / 88.4,
      TRUE ~ NA_real_
    ),
    
    # Height numeric
    height_cm_adm = as.numeric(height_cm_adm),
    
    # Calculate eGFR (Schwartz formula)
    egfr_adm = ifelse(
      !is.na(height_cm_adm) &
        !is.na(creatinine_mgdl_new) &
        creatinine_mgdl_new > 0,
      0.413 * height_cm_adm / creatinine_mgdl_new,
      NA_real_
    )
  )

dat_clean <- dat_clean |>
  mutate(
    egfr_adm_cat = factor(
      case_when(
        is.na(egfr_adm) ~ NA_character_,
        egfr_adm >= 90  ~ "Normal (≥90)",
        egfr_adm >= 30  ~ "Reduced kidney function (30–89)",
        TRUE            ~ "Severe kidney dysfunction (<30)"
      ),
      levels = c(
        "Normal (≥90)",
        "Reduced kidney function (30–89)",
        "Severe kidney dysfunction (<30)"
      )
    )
  )

table(dat_clean$egfr_adm_cat)

View(subset(dat_clean, studyid_adm == "0002-8P-HM-335"))

extreme_rows %>%
  filter(grepl("0002-8P-HM-335", studyid_adm))

summary(dat_clean$egfr_adm)
summary(dat_clean$creatinineumoll_adm)

write.csv(extreme_rows, "Results/Extreme_rows.csv")

# DEHYDRATION VARIABLES
table(dat_clean$dehydrationappearance_adm, useNA = "ifany")

table(dat_clean$dehydrationeyes_adm, useNA = "ifany")

table(dat_clean$dehydrationthirst_adm, useNA = "ifany")

table(dat_clean$dehydrationturgor_adm, useNA = "ifany")


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# WHO IMCI DEHYDRATION CLASSIFICATION                     #####      
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

dat_clean <- dat_clean |>
  mutate(

    # Severe dehydration signs
    severe_general =
      dehydrationappearance_adm == "Lethargic or unconscious",
    
    severe_eye =
      dehydrationeyes_adm == "Sunken",
    
    severe_thirst =
      dehydrationthirst_adm == "Drinks poorly, or not able to drink",
    
    severe_turgor =
      dehydrationturgor_adm == "Goes back very slowly",
    
    
    # Some dehydration signs
    some_general =
      dehydrationappearance_adm %in%
      c(
        "Restless, irritable",
        "Lethargic or unconscious"
      ),
    
    some_eye =
      dehydrationeyes_adm == "Sunken",
    
    some_thirst =
      dehydrationthirst_adm %in%
      c(
        "Thirsty, drinks eagerly",
        "Drinks poorly, or not able to drink"
      ),
    
    some_turgor =
      dehydrationturgor_adm %in%
      c(
        "Goes back slowly",
        "Goes back very slowly"
      )
    
  ) |>
  
# Count dehydration signs
rowwise() |>
  mutate(
    severe_dehydration_signs =
      sum(
        c(
          severe_general,
          severe_eye,
          severe_thirst,
          severe_turgor
        ),
        na.rm = TRUE
      ),
    
    dehydration_signs =
      sum(
        c(
          some_general,
          some_eye,
          some_thirst,
          some_turgor
        ),
        na.rm = TRUE
      )
    
  ) |>
  ungroup() |>
  
# Assessment status and IMCI classification
mutate(
  dehydration_assessed =
    if_any(
      c(
        dehydrationappearance_adm,
        dehydrationeyes_adm,
        dehydrationthirst_adm,
        dehydrationturgor_adm
      ),
      ~ !is.na(.)
    ),
  
  
  dehydration_imci = case_when(
    
    !dehydration_assessed ~
      "Not assessed",
    
    severe_dehydration_signs >= 2 ~
      "Severe dehydration",
    
    dehydration_signs >= 2 ~
      "Some dehydration",
    
    TRUE ~
      "No dehydration"
    
  ),
  
  dehydration_imci =
    factor(
      dehydration_imci,
      levels = c(
        "Not assessed",
        "No dehydration",
        "Some dehydration",
        "Severe dehydration"
      )
    )
)


table(
  dat_clean$dehydration_adm,
  dat_clean$dehydration_imci,
  useNA = "ifany"
)

dat_clean |>
  filter(
    dehydration_adm == "No",
    dehydration_imci == "Not assessed"
  ) |>
  count()

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# REAPPLY VARIABLE LABELS BACK                            #####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

derived_labels  <- tibble::tribble(
  ~Variable, ~Label,
  
  # ADMISSION / DEMOGRAPHICS
  "site_adm", "Hospital site",
  "Hospital_admission", "Hospital admission",
  
  "ageadmit_adm", "Eligible age at admission",
  "agecalc_adm_new", "Age at admission (years)",
  "studygroup_adm", "Study age group",
  "sex_adm_wgsr", "Child sex for WHO growth standards",
  "height_cm_adm", "Height in (cm)",
  
  "infection_adm", "Suspected or confirmed infection at admission",
  "priorcare_adm", "Care sought before hospital admission",
  "isreferral_adm", "Referral at admission",
  "priorhosp_adm_new", "Previous hospitalization",
  
  "traveldist_adm_new", "Travel time to hospital",
  "travelmethod_adm_new", "Mode of transport to hospital",
  "travelmethodother_adm_new", "Other mode of transport",
  
  "bcgscar_adm", "BCG vaccination scar present",
  "vaccpneumoc_adm", "Pneumococcal vaccination status",
  "vaccdpt_adm", "DPT/Pentavalent vaccination status",
  
  "momalive_adm", "Biological mother alive",
  "momageknown_adm", "Maternal age known",
  "momhiv_adm_new", "Maternal HIV status",
  "hiv_status_new", "Child HIV status",
  "isprimarycaregiver_adm", "Is the person who brought the child to the hospital the childs primary caregiver?",
  
  # DATES
  "admitdate_adm", "Date of Admission",
  "admit_datetime", "Admission date and time",
  "disch_datetime", "Discharge date and time",
  "los_hours", "Length of hospital stay (hours)",
  "los_days", "Length of hospital stay (days)",
  
  # VITAL SIGNS
  "temp_c_adm_cat", "Axillary temperature (Celsius)",
  "spo2_adm_cat", "Admission oxygen saturation (%)",
  "spo2_adm", "Admission oxygen saturation (%)",
  "spo2_dis", "Discharge oxygen saturation (%)",
  "spo2_dis_cat", "Discharge oxygen saturation (%)",
  "hypoxia", "Hypoxia (SpO₂ <95%)",
  "hypoxemia_dis", "Discharge hypoxaemia (SpO₂ <90%)",
  
  # LABORATORY
  "glucose_mmolpl_adm_new", "Blood glucose (mmol/L)",
  "lactate_mmolpl_adm_new", "Lactate level (mmol/L)",
  "anemia", "Anaemia category",
  
  # KIDNEY FUNCTION
  "creatininemgdl_clean", "Serum creatinine (mg/dL)",
  "creatinineumoll_clean", "Serum creatinine (µmol/L)",
  "creatinine_mgdl_new", "Standardized serum creatinine (mg/dL)",
  "egfr_adm", "Estimated glomerular filtration rate at admission",
  "egfr_adm_cat", "Kidney function stage at admission",
  
  # URINE
  "urine_adm", "Urine production in last 24 hours",
  "urinesymp_adm", "Has the child had changes in urine color?",
  "urine_color_cat", "Urine color",
  "teaprobtime_adm", "Duration of tea-coloured urine",
  "teareptepi_adm", "Previous episodes of tea-coloured urine",
  "urinepain_adm", "Pain during urination",
  "urinepaintime_adm", "Duration of painful urination",
  
  # DEHYDRATION
  "dehydration_general_score", "Dehydration score: General appearance",
  "dehydration_eye_score", "Dehydration score: Sunken eyes",
  "dehydration_thirst_score", "Dehydration score: Thirst",
  "dehydration_turgor_score", "Dehydration score: Skin turgor",
  "severe_dehydration_signs", "Presence of severe dehydration signs",
  "dehydration_signs", "Presence of dehydration signs",
  "dehydration_imci", "IMCI dehydration classification",
  "dehydration_imci_new", "IMCI dehydration classification",
  
  # NUTRITION / ANTHROPOMETRY
  "muac_mm_adm_new", "Nutritional status (MUAC)",
  "weight_for_age", "Weight-for-age Z-score (WAZ)",
  "height_for_age", "Height-for-age Z-score (HAZ)",
  "bmi_for_age", "BMI-for-age Z-score (BAZ)",
  
  "weight_for_age_cat", "Weight-for-age",
  "height_for_age_cat", "Height-for-age",
  "bmi_for_age_cat", "BMI-for-age",
  
  # COMA
  "eye_score", "Blantyre Coma Scale: Eye score",
  "motor_score", "Blantyre Coma Scale: Motor score",
  "verbal_score", "Blantyre Coma Scale: Verbal score",
  "coma_score", "Blantyre Coma Scale total score",
  "coma_score_cat", "Blantyre Coma Scale category",
  
  # EDUCATION
  "school_start", "Official school year start date",
  "expected_age_ug", "Expected age at school level",
  "actual_age_at_school_start", "Age at school year start",
  "age_diff_school_start", "Difference from expected school age",
  "childedulevel_adm_new", "School progression relative to age",
  
  # SOCIOECONOMIC STATUS
  "ses_flooring", "Household flooring material",
  "ses_toilet", "Household toilet facility",
  "ses_cooking", "Primary cooking fuel",
  "ses_water", "Primary household water source",
  "ses_electricity", "Household electricity access",
  "ses_tv", "Household ownership of a television",
  "ses_fridge", "Household ownership of a refrigerator",
  "ses_motorcycle", "Household ownership of a motorcycle",
  "ses_car", "Household ownership of a car",
  "sesindex_sum", "Socioeconomic status index score",
  "sesindex_cat", "Socioeconomic status category",
  
  # DISCHARGE / FOLLOW-UP
  "dischstatus_dis_new", "Discharge status",
  "healthstatus_fol_new", "Health status at follow-up",
  "deathcause_pda", "What was the cause of death?",
  "deathcause_pda_new", "Standardized primary cause of death",
  "pddcaresought_fol_new", "Post-discharge care sought",
  
  # DISCHARGE AGAINST MEDICAL ADVICE
  "damareason_new_1", "Financial constraints",
  "damareason_new_2", "Drug stock-outs",
  "damareason_new_3", "Cultural beliefs",
  "damareason_new_4", "The caregiver presumes the child is well",
  "damareason_new_5", "General hospital environment",
  "damareason_new_6", "Few/No health workers to provide care to their children",
  "damareason_new_7", "No hope for improvement",
  "damareason_new_8", "Poor/non-respectful care",
  "damareason_new_97", "Dont know",
  "damareason_new_98", "Other"
)

# Save variable labels 
derived_labels <- setNames(
  derived_labels$Label,
  derived_labels$Variable
)

# Restore labels using the helper function
dat_clean <- apply_labels(
   dat_clean,
   derived_labels)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# SAVE WORKSPACE             ########
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Only keep final datasets

to_keep <- c("dat_UG",
             "dat_RT",
             "dat_raw",
             "dat_subset",
             "dat_clean",
             "redcap_date")

rm(list = setdiff(ls(), to_keep))

save.image(paste0("Workspace/Create_Cleaned_Data002 (", redcap_date, ").RData"))


