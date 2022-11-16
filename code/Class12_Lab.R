### Title: Day 12 - Functions
### Author:  
### Purpose: Day 12 Exercises
### Date: 2 November 2022

## Prepare Workspace ####

# Today we do not want the previous days environment. Therefore we will clear it. This is not always the case.
# clean the environment
rm(list=ls(all=T)) 

# Load all the libraries we will use in this lab. 
library(tidyverse)

# 1. Create a function that takes one argument, a vector, and returns the sum of the vector squared. Call it "sum_squared". Test your function on the vector `c(2,7,21,30,90)` - you should get the answer 22500.
# General format: NEW_FUNCTION <- function(x, y) x + y ..

x <- c(2, 7, 21, 30, 90)
sum_squared <- function(x){
  (sum(X))^2
}

# 2. Create a function that takes two arguments, (1) a vector and (2) a numeric value. This function tests whether the number (2) is contained within the vector (1). Call it "has_n". Test your function on the vector `c(2,7,21,30,90)` and number `21` - you should get the answer TRUE.

x <- c(2, 7, 21, 30, 90)
n <- 21

has_n <- function(x, n=21){
  n %in% x 
}
has_n(x=a, n=b)


# 3. Amend the function "has_n" from #2 so that it takes a default value of `21` for the numeric argument.

x <- c(2, 7, 21, 30, 90)
n <- 21



# 4. Read in the SARS-CoV-2 Vaccination data from http://jhudatascience.org/intro_to_r/data/USA_covid19_vaccinations.csv. Assign the data the name "vacc".


# 5. We want to get some summary statistics on the Moderna vaccines. Use `across` inside `summarize` to get the sum total number vaccine doses for any variable containing the word "Moderna" or starting with "Total". **Hint**: use `matches()` AND `starts_with()` to select the right columns inside `across`. Keep in mind that this includes the United States as a whole and so is not totally accurate!



# 6. Use `across` and `mutate` to convert all columns containing the word "Percent" into proportions (i.e., divide that value by 100). **Hint**: use `matches()` to select the right columns. Use a "function on the fly" to divide by 100. It will also be easier to check your work if you `select()` columns that match "Percent".



# 7. Use `across` and `mutate` to convert all columns starting with the word "Total" into a binary variable: TRUE if the value is greater than 10,000,000 and FALSE if less than or equal to 10,000,000. **Hint**: use `starts_with()` to select the columns starting with "Total". Use a "function on the fly" to do a logical test if the value is greater than 10,000,000.



# 8. Take your code from #7 and assign it to the variable `vacc_dat`. 
#- use `filter()` to drop any rows where "United States" appears in `State/Territory/Federal Entity`. Make sure to reassign this to `vacc_dat`.
#- Create a ggplot boxplot (`geom_boxplot()`) where (1) the x-axis is `Total Doses Delivered` and (2) the y-axis is `Percent of fully vaccinated people with booster doses`.
#- You change the `labs()` layer so that the x-axis is "Total Doses Delivered: Greater than 10,000,000"

