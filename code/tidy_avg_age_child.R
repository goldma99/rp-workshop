root <- here::here()

child_tidy_path <- file.path(root, "data/tidy/child.csv")

child_tidy <- 
    read_csv(child_tidy_path)

child_tidy %>%
    summarise(mean_age = mean(age, na.rm = TRUE))
