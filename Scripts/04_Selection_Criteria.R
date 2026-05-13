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



# ~~~~~~~~~~~~~~~~~~~
# Quick Checks   ####
# ~~~~~~~~~~~~~~~~~~~

# missing_summary <- dat_clean %>%
#   summarise(across(everything(), ~ sum(is.na(.)))) %>%
#   pivot_longer(cols = everything(),
#                names_to = "variable",
#                values_to = "n_missing") %>%
#   mutate(
#     n_total = nrow(dat_clean),
#     pct_missing = 100 * n_missing / n_total
#   ) %>%
#   arrange(desc(pct_missing))
# 
# head(missing_summary, 20)
# 
# print(missing_summary, n=Inf)
# 
# 
# site_ids <- dat_clean %>%
#   filter(is.na(site_adm))
# nrow(site_ids)
# 
# missing_consent <- dat_clean %>% 
#   filter(is.na(consenttype_adm)) %>% 
#   select(studyid_adm, site_adm)
# missing_consent
# 
# missing_consentobtained <- dat_clean %>% 
#   filter(is.na(consentobtained_adm)) %>% 
#   select(studyid_adm, site_adm)
# missing_consentobtained
# 
# View(dat_clean %>% 
#        filter(studyid_adm %in% c("0002-2E-CH-004", "0002-9L-PH-071")))
# 
# missing_sex <- dat_clean %>% 
#   filter(is.na(sex_adm)) %>% 
#   select(studyid_adm, site_adm)
# missing_sex
# 
# missing_referral <- dat_clean %>% 
#   filter(is.na(isreferral_adm)) %>% 
#   select(studyid_adm, site_adm)
# missing_referral
# 
# missing_momalive <- dat_clean %>% 
#   filter(is.na(momalive_adm)) %>% 
#   select(studyid_adm, site_adm)
# missing_momalive
# label(dat_clean$momalive_adm)
# 
# missing_momage <- dat_clean %>% 
#   filter(is.na(momage_adm)) %>% 
#   select(studyid_adm, site_adm)
# missing_momage
# 
# # Check labels
# label(dat_clean$exclbreastfed_adm)


