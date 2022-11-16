### Title: Day 8 - Data Reshape and Merging
### Author:  Gbemisola Talabi
### Purpose: Day 6 Exercises
### Date: 5 October 2022


## Prepare Workspace ####

# Today we do not want the previous days environment. Therefore we will clear it. This is not always the case.
# clean the environment
rm(list=ls(all=T)) 

# Load any packages you might need
library(tidyverse)
library(readr)
library(dplyr)

## Day 8 Lab, Part 1 - Data Reshape ####

# 1. Import SARS-CoV-2 Vaccination data "USA_covid19_vaccinations.csv" from eLC and assign the data the name "vacc0". 
# Data in this lab comes from the CDC (https://covid.cdc.gov/covid-data-tracker/#vaccinations_vacc-total-admin-rate-total - snapshot from January 12, 2022)
# and the Bureau of Economic Analysis (https://www.bea.gov/data/income-saving/personal-income-by-state).
vacc0 <- read_csv("data/USA_covid19_vaccinations.csv")


# 2. Look at the column names using `colnames` - do you notice any patterns?
colnames(vacc0)


# 3. Let's rename the column "State/Territory/Federal Entity" in "vacc0" to "Entity" using `rename`. Assign to `vacc`
vacc <- rename(vacc0, Entity = "State/Territory/Federal Entity")
colnames(vacc)


# 4. Select only the columns "Entity", and those that start with "Percent" (i.e., `starts_with("Percent")`). Assign the object to `vacc_sub`
vacc_sub <- select(vacc, "Entity", starts_with("Percent"))

# 5. Create a new dataset "vacc_long" that does `pivot_longer()` on all columns except "Entity". 
vacc_long <- vacc_sub %>% 
  pivot_longer(!Entity)
vacc_long

# 6. Filter the "Entity" column so it only includes values in the following list: "Maryland","Virginia","Florida","Massachusetts", "United States". 
vacc_long <- vacc_long %>%
  filter(Entity %in% c("Maryland", "Virginia", "Florida", "Massachusetts", "United States")) 


# 7. Use `pivot_wider` to reshape "vacc_long". Use "Entity" for the `names_from` argument. Use "value" for the `values_from` argument. Call this new data `vacc_wide`. Look at the data. How do these states compare to one another.
vacc_wide <- vacc_long %>% pivot_wider(names_from = "Entity",
                                       values_from = "value")
vacc_wide


#8. Combine questions 3-7 by chaining everything together using the pipe ` %>% `. Call your data `vacc_compare`.
vacc_compare <- vacc0 %>%
  rename(vacc0, Entity = "State/Territory/Federal Entity") %>%
  select(vacc, "Entity", starts_with("Percent")) %>%
  pivot_longer(!"Entity") %>%
  filter(Entity %in% c("Maryland", "Virginia", "Florida", "Massachusetts", "United States")) %>%
  pivot_wider(names_from = "Entity", values_from = "value") 
  


# 9. Create the data frame displayed on the screen - also found in "dataset_desired.jpg" on eLC. Assign this dataset to `vacc_long2`
tmp <- vacc %>% select(Entity, contains("Fully Vaccinated")) %>%
  select(Entity, contains("Percent of")) %>%
  select(Entity, contains("Residence")) 

vacc_long2 <- vacc %>%
  select('Entity',
         'Percent of Total pop Fully Vaccinaed by State of Residence',
         'Percent of 18+ pop Fully Vaccinaed by State of Residence',
         'Percent of 65+ pop Fully Vaccinaed by State of Residence',
         'Percent of 12+ pop Fully Vaccinaed by State of Residence',
         'Percent of 5+  pop Fully Vaccinaed by State of Residence')


#9a. Run the following line of code to produce a plot
library(ggplot2)
ggplot(data=vacc_long2, mapping = aes(x=Entity, y=`Percent Fully Vaccinated`, group=`Age Group`, color=`Age Group`)) +
  geom_line()

#9b. Clean the figure by revising the variable `Age Group` to be values "Total_Pop", "18+_Pop", "65+_Pop", "12+_Pop", and "5+_Pop". Then plot again.





## Day 8 Lab, Part 2 - Data Merging ####

# 10. Read in the GDP and Personal Income Data and assign it to "gdp". 
gdp <- read_csv("data/gdp_personal_income.csv")


# 11. Use `pivot_wider` to reshape "gdp". Use "Description" for the `names_from` argument. Use "`2020`" for the `values_from` argument. Reassign this data to "gdp".
gdp <- gdp %>% pivot_wider(names_from = "Description",
                                       values_from = "2020")


# 12. Join the data so that you only retain data in both "vacc" and "gdp". 
# - Call the output "merged". How many observations are there?
merged <- c("vacc", "gdp")


# 13. Join the data using a `full_join.` Call the output "full". How many observations are there?
full <- full_join()


# 14. Do a left join of "vacc" and "gdp". How many observations are there?



# 15. Repeat above with a `right_join` with the same order of the arguments. How many observations are there?



# 16. Repeat above with a `semi_join` with the same order of the arguments. How many observations are there? How many columns are there?



# 17. Repeat above with a `anti_join` with the same order of the arguments. How many observations are there? How many columns are there?



# 18. Perform a `setdiff` on "vacc" and "gdp" to determine what Entities are missing from the GDP data and which are missing from the vaccine data. Remember you need to `pull()` the columns you want to compare because `setdiff()` only takes vectors.



# 19. Recode the `GeoName` from `gdp` to match `Entity` from `vacc` when appropriate.

