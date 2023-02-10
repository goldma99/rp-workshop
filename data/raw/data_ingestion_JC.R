library(tidyverse)
library(skimr)
setwd("/Users/chenjieyi/Documents/GitHub/rp-workshop/data/raw")
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

# Tidy Data ----
setwd("/Users/chenjieyi/Documents/GitHub/rp-workshop")

mother_survey <- read_csv("data/raw/mother_survey.csv")
child <- read_csv("data/tidy/child.csv")

mother_survey %>% 
  pivot_longer(cols = age_1:age_7, names_to = "child", values_to = "age_child") %>% 
  summarise(mean(age_child, na.rm=TRUE))
  
child %>% 
  summarise(mean(age, na.rm = TRUE))

mother_long <- read_csv("data/raw/mother_long.csv")
mother <- read_csv("data/tidy/mother.csv")
child_an <- read_csv("data/analysis/child.csv")


