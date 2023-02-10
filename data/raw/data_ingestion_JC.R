library(tidyverse)
library(skimr)
setwd("/Users/chenjieyi/Desktop/rp-workshop/data/raw")
mother_long <- read_csv("mother_long.csv")
# save RDS
saveRDS(mother_long, file = "mother_long.RDS")
# save(mother_long, file = "mother_long.RDS")
# load RDS
load("mother_long.RDS")
# readRDS("mother_long.RDS")

skim(mother_long)
summary(mother_long)

setwd("/Users/chenjieyi/Desktop/rp-workshop/data/raw")
mother_survey <- read_csv("mother_survey.csv")
# save RDS
saveRDS(mother_survey, file = "mother_survey.RDS")
# load RDS
load("mother_survey.RDS")

skim(mother_survey)
summary(mother_survey)