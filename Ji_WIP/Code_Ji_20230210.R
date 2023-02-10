library(data.table)
library(readr)
ml <- fread("/Users/jieonki0/Documents/GitHub/rp-workshop/data/raw/mother_long.csv")
write_rds(ml,"/Users/jieonki0/Documents/GitHub/rp-workshop/Ji_WIP/mother_long.rds")

ms <- fread("/Users/jieonki0/Documents/GitHub/rp-workshop/data/raw/mother_survey.csv")
write_rds(ms,"/Users/jieonki0/Documents/GitHub/rp-workshop/Ji_WIP/mother_survey.rds")

str(ml) # mother_id, name, value
str(ms) #village_id, mother_id, age, educ, n_children, age of these children, sex of these children, in_school of these children

# Exercise1.
## a) Write code to calculate the average age of children in the data 
child <- fread("/Users/jieonki0/Documents/GitHub/rp-workshop/data/tidy/child.csv")
mean(child$age) #8.312073

## b) Write code to calculate the average age of mothers in the data 
child_analyis <- fread("/Users/jieonki0/Documents/GitHub/rp-workshop/data/analysis/child.csv")
mother <- fread("/Users/jieonki0/Documents/GitHub/rp-workshop/data/tidy/mother.csv")
ml
mean(mother$age) #33.31864

#===============================================================================
# How to turn mother_long into tidy one: By reshaping it so that variables are represented in columns, not rows
# How can we turn mother_survey.csv into a tidy data set?: 
# 1. Create two separate data tables, one where the unit of observation is the mother, and one where it is the child
# 2. Reshape the child-level data so that each observation is represented in a row, not in different columns 

# use pivot() to reshape the data 
#===============================================================================

# Exercise2.
## What variable?, What type?
str(child) # sex: categorical, in_school: binary
str(mother)

unique(child$sex) # 4 different categories in sex, which we don't want

install.packages(c("skimr","dataReporter"))
library(skimr)
library(dataReporter)
skimchild <- skim(child)

install.packages(c("dataMeta","datadictionary"))


# Exercise3. Using new_data
## 1) Convert each variable to the format that is most appropriate for it in the software you are using
## 2) Save the new data set in the data/clean folder
## 3) Save a data dictionary or data summary and in the same folder

child <- read_rds("/Users/jieonki0/Documents/GitHub/rp-workshop/data/new_data/tidy/child.rds")
child$village_id <- as.numeric(child$village_id)
child$mother_id <- as.numeric(child$mother_id)
child$child_id <- as.numeric(child$child_id)
child$sex <- ifelse(child$sex %in% c("F","female","Female"),"F","M")

write_rds(child,"/Users/jieonki0/Documents/GitHub/rp-workshop/Ji_WIP/data/clean/child.rds")
makeDataReport(child,replace=T)

mother <- read_rds("/Users/jieonki0/Documents/GitHub/rp-workshop/data/new_data/tidy/mother.rds")
skim(mother)



# Exercise4. Making corrections
## a) Is the data set uniquely and fully identified?
n_distinct(child$child_id)==nrow(child)
n_distinct(mother$mother_id)==nrow(mother)

## b) Are there any issues with completeness?
skim(child) #88 missing in grade
skim(mother) #no missing 

## c) Are there any inconsistencies in the data?
library(validate)
rules <- validator(child$yob <= 2023
                   ,!is.na(child$grade) && child$in_school==1
                  )
out   <- confront(child, rules)
summary(out)

rules2 <- validator(mother$age %%1 ==0,
                    mother$n_children %% 1 ==0
                    
                    )
out2 <- confront(mother, rules2)
summary(out2)

## d) Are the potentially problematic outliers?







