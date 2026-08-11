#==============================================================
# MASTER SCRIPT
#==============================================================

rm(list = ls())

gc()

options(stringsAsFactors = FALSE)

library(tidyverse)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Run project scripts
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

scripts <- c(
  "Scripts/01_Redcap_Labelsv0.02.R",
  "Scripts/02_RedCap_Labelsv0.03.R",
  "Scripts/03_create_Cleaned_Data.R",
  "Scripts/04_Selection_Criteria.R",
  "Scripts/05_Data_Dictionary.R"
)

for (script in scripts) {
  
  cat("Running:", basename(script), "\n")

  source(script)
  
}

cat("All scripts completed successfully.\n")
