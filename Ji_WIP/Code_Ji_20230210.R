library(data.table)
library(readr)
ml <- fread("/Users/jieonki0/Documents/GitHub/rp-workshop/data/raw/mother_long.csv")
write_rds(ml,"/Users/jieonki0/Documents/GitHub/rp-workshop/Ji_WIP/mother_long.rds")


ms <- fread("/Users/jieonki0/Documents/GitHub/rp-workshop/data/raw/mother_survey.csv")
write_rds(ml,"/Users/jieonki0/Documents/GitHub/rp-workshop/Ji_WIP/mother_survey.rds")

str(ml) # mother_id, name, value

str(ms) #village_id, mother_id, age, educ, n_children, age of these children, sex of these children, in_school of these children
# 2 different units of obs in single table

# Exercise1.
## Write code to calculate the average age of children in the data 
child <- fread("/Users/jieonki0/Documents/GitHub/rp-workshop/data/tidy/child.csv")
mean(child$age) #8.312073

## Write code to calculate the average age of mothers in the data 
child_analyis <- fread("/Users/jieonki0/Documents/GitHub/rp-workshop/data/analysis/child.csv")
mother <- fread("/Users/jieonki0/Documents/GitHub/rp-workshop/data/tidy/mother.csv")
ml
mean(mother$age) #33.31864

