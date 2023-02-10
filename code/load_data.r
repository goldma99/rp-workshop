home_dir <- "C:/Users/rchen4/Dropbox/Projects/rp-workshop"
child_analysis <- read.csv(paste0(home_dir,"/data/analysis/child.csv"))
saveRDS(child_analysis,file=paste0(home_dir,"/data/analysis/child.rds"))

mother_tidy <- read.csv(paste0(home_dir,"/data/tidy/mother.csv"))

avg_age_child <- mean(child_analysis$age)
avg_age_mother <- mean(mother_tidy$age)