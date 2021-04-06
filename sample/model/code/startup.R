#################################################################################
# Clear Environment
#################################################################################
gc()
rm(list = ls())
sessionInfo()

processStarted <- date()
print.noquote(paste("### Base Load Started @", processStarted))

#################################################################################
# Load Sources
#################################################################################
lib_path <- "/usr/local/lib/R/site-library"

print.noquote("")
print.noquote(paste("Working Directory path:", getwd()))

print.noquote("")
.libPaths(lib_path)
print.noquote(paste("Current Libraries path:", lib_path))
print.noquote(.libPaths())

source("code/base/constants.R")
source("code/base/settings.R")
source("code/base/environment.R")

source("code/functions/data_preparation.R")
source("code/functions/data_quality.R")
source("code/functions/model_performance.R")
source("code/functions/model_testing.R")
source("code/functions/model_training.R")
source("code/functions/model_tuning.R")

source("code/processes/preprocess.R")
source("code/processes/analysis.R")
source("code/processes/tuning.R")
source("code/processes/testing.R")
source("code/processes/publish.R")

#################################################################################
# Register Packages
#################################################################################
# require(SAMPLE, lib.loc = lib_path)

#################################################################################
# Settings
#################################################################################
if (settings$seed > 0) { set.seed(settings$seed) }

print.noquote(paste("### Base Load Completed @", date(), "<= Started @", processStarted))