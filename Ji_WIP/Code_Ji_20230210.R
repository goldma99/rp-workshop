library(data.table)
library(readr)
ml <- fread("/Users/jieonki0/Documents/GitHub/rp-workshop/data/raw/mother_long.csv")
write_rds(ml,"/Users/jieonki0/Documents/GitHub/rp-workshop/Ji_WIP/mother_long.rds")
