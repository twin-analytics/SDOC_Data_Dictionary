# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 04_SELECTION CRITERIA   ############
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Apply selection criteria for analysis
# This script will not run on its own - it only exists 
#  to be sourced in other scripts

# For data manipulations
library(tidyverse)
library(Hmisc)
library(summarytools)
library(broom)
library(openxlsx)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ELIGIBILITY CRITERIA      #########
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Remove under 5 years in Tanzania: 9654 children
dat_tz <- subset(dat_clean, country_adm == "Tanzania")
n_distinct(dat_tz$studyid_adm)
n_distinct(dat_clean$studyid_adm)
dat_clean <- subset(dat_clean,
                    !(country_adm == "Tanzania" & studygroup_adm %in% c("< 6 months", "6 months to < 5 years")))
n_distinct(dat_clean$studyid_adm) 
table(dat_clean$studygroup_adm)

# Drop unused factor levels
dat_clean$studygroup_adm <- droplevels(dat_clean$studygroup_adm)
table(dat_clean$studygroup_adm)

# Admitted to the hospital with a proven or suspected infection: n = 5607
infection_exclude <- subset(dat_clean, infection_adm == "No")
infection_exclude %>% 
  select(studyid_adm, redcap_event_name, infection_adm) %>% 
  print(n=Inf)
dat_clean <- subset(dat_clean, infection_adm != "No"|is.na(infection_adm))
n_distinct(dat_clean$studyid_adm)

# Eligible age: n = 5566
any(is.na(dat_clean$ageadmit_adm))
sum(is.na(dat_clean$ageadmit_adm))
age_exclude <- subset(dat_clean, ageadmit_adm == "No")
dat_clean <- subset(dat_clean, ageadmit_adm != "No" | is.na(ageadmit_adm))
n_distinct(dat_clean$studyid_adm)

# Pilot data: n = 5480
any(is.na(dat_clean$is_pilot_adm))
sum(is.na(dat_clean$is_pilot_adm))

pilot_exclude <-subset(dat_clean, is_pilot_adm == "Yes")
dat_clean <- subset(dat_clean, is_pilot_adm != "Yes"|is.na(is_pilot_adm))
n_distinct(dat_clean$is_pilot_adm); table(dat_clean$is_pilot_adm)
n_distinct(dat_clean$studyid_adm)

# Testing data: n = 5480
table(dat_clean$site_adm)
sum(is.na(dat_clean$site_adm))

site_exclude <- subset(dat_clean, site_adm == "Testing")
dat_clean <- subset(dat_clean, site_adm != "Testing"|is.na(site_adm))
dat_clean$site_adm <- droplevels(dat_clean$site_adm)
unique(dat_clean$site_adm)
n_distinct(dat_clean$studyid_adm)

# Consent form obtained: n = 3069
table(dat_clean$consentobtained_adm)
consent_exclude <- subset(dat_clean, consentobtained_adm == "No")
dat_clean <- subset(dat_clean, consentobtained_adm == "Yes"|is.na(consentobtained_adm))
n_distinct(dat_clean$studyid_adm)
dim(dat_clean)

# Check other exclusion: n = 2822
table(dat_clean$exclusionother_adm)
other_exclusion <- table(dat_clean %>% 
  group_by(studyid_adm) %>% 
  slice(1) %>% 
  pull(exclusionother_adm))
dat_clean <- subset(dat_clean, exclusionother_adm == "None apply"|is.na(exclusionother_adm))
n_distinct(dat_clean$studyid_adm)


