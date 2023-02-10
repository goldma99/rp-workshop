library(readr)

root <- here::here()

mother_long_path <- 
    file.path(
        root, "data/raw/mother_survey.csv"
    )

mother_survey <- 
    readr::read_csv(mother_long_path)

mother_survey[sort(names(mother_survey))] %>% glimpse()

# ========================================================================
# Unit of observation: mother within village
# mother_id: unique mother identifier (first two digits = village ID)
# village_id.x/.y: unique village identifier (10 villages)
# age: mother's age
# educ: years of mother's education
# n_children: number of children of mother
# in_school_i: whether child i is in school
# age_i: age of child i
# sex_i: sex of child i
# =========================================================================

# Clean sex into F, M, or NA
mother_survey <-
    mother_survey %>%
    mutate(
        across(
            starts_with("sex_"),
            ~ toupper(str_sub(.x, 1, 1))
        )
    ) 

# Remove duplicate village_id
mother_survey <-
    mother_survey %>%
    select(-village_id.y) %>%
    rename(village_id = village_id.x)

# Some child are fractional :\\


# Calculate average age of children
mother_survey %>% 
    select(mother_id, starts_with("age_")) %>%
    pivot_longer(
        cols = starts_with("age_"),
        names_to = "child",
        values_to = "age"
    ) %>%
    mutate(child = str_remove_all(child, "age_")) %>%
    summarise(
        mean_age = mean(age, na.rm = TRUE)
    )

