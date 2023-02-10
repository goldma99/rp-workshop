#' This script loads raw data and look into it

library(readr)
library(dplyr)
library(tidyr)

# read data
df <- read_csv("./data/raw/mother_long.csv")


# data preview: long data
# unique identifiers
df %>% colnames()
df %>% pull(mother_id) %>% unique() %>% length()

# there are 4 types of names
df %>% pull(name) %>% unique()

# values should be numeric
df %>% pull(value)

#' save in a more user friendly format
df.result <- df %>% 
  # convert to numeric
  mutate(value = as.numeric(value)) %>% 
  # transform from long to wide
  spread(name, value) %>% 
  # order in ID
  arrange(mother_id)

# save the data
df.result %>% 
  saveRDS("./data/tidy/mother.RDS")


# Find the average ages of mothers
df.result %>% 
  pull(age) %>% 
  mean()


