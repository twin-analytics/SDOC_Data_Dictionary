# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Install and load the required packages               ####
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if(!require(haven)){
  install.packages("haven", dependencies = TRUE)
  library(haven)
}

if(!require(tidyverse)){
  install.packages("tidyverse", dependencies = TRUE)
  library(tidyverse)
}

if(!require(summarytools)){
  install.packages("summarytools", dependencies = TRUE)
  library(summarytools)
}


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Import Datasets               ##### 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Source the cleaned script and the minimal selection criteria
# load("Workspace/Create_Cleaned_Data (2025-10-27).RData")
load("Workspace/Create_Cleaned_Data (2026-05-06).RData")

# Apply the selection criteria
source("Scripts/04_Selection_Criteria.R")

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DATA DICTIONARY         ######
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Identify variables that are not relevant to exclude from the data dictionary e.g
# redundant, administrative, identifying information, exclusion criteria variables

# consent_vars <- grep("consent_", colnames(dat_clean), value = TRUE)

# comment_vars <- dat_clean %>%
#   select(grep("_complete", colnames(dat_clean), value = TRUE))

exclude <- c("studyid_adm",
             "studyid_ref",
             "studyidcheck_ref",
             "studyid_dama",
             "studyidcheck_dama",
             "studyid_fol",
             "studyidcheck_fol",
             "studyid_pda",
             "studyidcheck_pda",
             "creationdate_adm",
             "uploaddate_adm",
             "appversion_adm",
             "is_pilot_adm",
             "username_adm",
             "nursename_adm",
             "noteligible_adm",
             "nursenameother_adm",
             "nursenameother_dis",
             "nursename_dis",
              grep("phone", colnames(dat_clean), value = TRUE),
              grep("comment", colnames(dat_clean), value = TRUE),
              grep("_complete", colnames(dat_clean), value = TRUE),
             "ageadmit_adm",
             "infection_adm",
             "exclusionother_adm",
             "consenttype_adm",
             "username_fol",
             "consentobtained_adm"
)

# Variables to keep regardless
always_keep <- c("studyid_adm", "ageadmit_adm", "infection_adm")
exclude <- setdiff(exclude, always_keep)
print(exclude, cat("Columns that will be removed:\n"))

always_keep %in% names(dat_clean)

dat_clean <- dat_clean %>% 
  select(-any_of(exclude))

dat_dict <- dat_clean %>% 
  select(everything(), -studyid_adm)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
# Create Data Dictionary       ######
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Data dictionary for mom dataset
cat("Creating data dictionary ...\n")
dat_codebook <- dfSummary(dat_dict, graph.magnif = 0.5)

# HTML Report
# Create a temporary file path to save the HTML report
output_file <- "Results/Data_Dictionary.html"
print(dat_codebook, method = "browser", file = output_file)
cat("Data dictionary saved to:", output_file, "\n")

# PDF Report
# output_file_pdf <- "Results/Data_Dictionary.pdf"
# pagedown::chrome_print(
#   input  = output_file_html,
#   output = output_file_pdf
# )
# cat("PDF data dictionary saved to:", output_file_pdf, "\n")

# ~~~~~~~~~~~~~~~~~~~~~
# SAVE WORKSPACE ######
# ~~~~~~~~~~~~~~~~~~~~~

to_keep <- c("dat_raw", "dat_subset", "dat_dict", "dat_clean", "redcap_date")
rm(list = setdiff(ls(),to_keep))

save.image("Cleaned Data/SDOC_Cleaned_Data.RData")

# Also export the csv file
write.csv("Cleaned Data/SDOC_Cleaned_Data.csv")

