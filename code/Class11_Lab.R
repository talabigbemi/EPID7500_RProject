### Title: Day 11 - Factors & Statistics
### Author:  Gbemisola Talabi 
### Purpose: Day 11 Exercises
### Date: 25 October 2022


## Prepare Workspace ####

# Today we do not want the previous days environment. Therefore we will clear it. This is not always the case.
# clean the environment
rm(list=ls(all=T)) 

# Load all the libraries we will use in this lab. 
library(tidyverse)
library(readr)
library(ggplot2)
library(dplyr)

## Class 11 - Part 1 Factors ####

# 1. Load the Youth Tobacco Survey data ("Youth_Tobacco_Survey_YTS_Data.csv")
# Then, `select` "Sample_Size",  "Education", and "LocationAbbr". Name this data "yts". 
yts <- read.csv("data/Youth_Tobacco_Survey_YTS_Data.csv")
yts <- select(yts, "Sample_Size", "Education", "LocationAbbr")
glimpse(yts)



# 2. Create a boxplot showing the difference in "Sample_Size" between Middle School and High School "Education". 
# **Hint**: Education is the x variable and Sample_Size is the y axis.
yts %>% 
  ggplot(mapping = aes(x = Education, y = Sample_Size)) +
  geom_boxplot()


# 3. Use `count` to count up the number of observations of data for each "Education" group.


yts %>% count(Education)

# 4. Make "Education" a factor using the `mutate` and `factor` functions.  Use the `levels` argument inside `factor` to reorder "Education". Reorder this variable so that "Middle School" comes before "High School". Assign the output the name "yts_fct".

yts_fact <- yts %>% 
  mutate(Education = factor(Education, levels=c("Middle School")))
         levels(yts_fact$Education)

# 5. Repeat #2 and #3 using the "yts_fct" data. You should see different ordering in the plot and `count` table.



# 6. Convert "LocationAbbr" (state) in "yts_fct" into a factor using the `mutate` and `factor` functions. Do not add a `levels =` argument.



# 7. Create a new column in "yts_fct" that contains the group-level median sample size. 
# - Using the "yts_fct" data, `group_by` "LocationAbbr". 
# - Then, use `mutate` to create a new column "med_sample_size" that is the median "Sample_Size". 
# - **Hint**: Use the `median` function with `na.rm = TRUE`.



# 8. Let's plot the "LocationAbbr" (state) by the "med_sample_size" column we created above. Using the `forcats` package, create a plot that:
# - Has "LocationAbbr" on the x-axis
# - Uses the `mapping` argument and the `fct_reorder` function to order the x-axis by "med_sample_size"
# - Has "Sample_Size" on the y-axis
# - Is a boxplot (`geom_boxplot`)
# - Has the x axis label of `State`
# - Don't worry if you get a warning about not being able to plot `NA` values.
# - Save your plot using `ggsave()` with a width of 10 and height of 3 into your figure directory.
# Which state has the largest median sample size?





## Class 11 - Part 2 Statistics ####

# 1. Import "mortality_data.rds" from eLC. Assign it to the "mort" variable. Take a look at mort. Change its first column name from `...1` into `country`.
mort <- read_rds("data/mortality_data.rds")
colnames(mort)
mort <- rename(mort, country = ...1)
colnames(mort)

# 2. Compute the correlation between the `2006` and `2007` mortality variables. (No need to save this in an object. Just display the result to the screen.) 
# Use the `pull()` function to first extract these columns. To use a column name in `pull()` that starts with a number, surround it with backticks (\`). Then, use the `cor` function.
x <- mort %>% pull('2006')
y <- mort %>% pull('2007')
cor(x,y)

# 3. Compute the correlation between the `1980`, `1990`, `2000`, and `2010` mortality variables. (No need to save this in an object. Just display the result to the screen.) 
# Use `select()` function to first subset the data frame to keep the four columns only. To use a column name in `select()` that starts with a number, surround it with backticks (\`). 
# How does this change when we use the `use = "complete.obs"` argument? 
mort4 <- select(mort, '1980', '1990', '2000', '2007')
cor(mort4)
cor(mort4, use = "complete.obs")


# 4. Perform a t-test to determine if there is evidence of a difference between child mortality in `1987` versus `2007`. 
# Use the `pull()` function to extract these columns. Print the results using the `tidy` function from the `broom` package. 
childmor_1987 <- mort %>% pull('1987')
childmor_2007 <- mort %>% pull('2007')
t.test(childmor_1987, childmor_2007)
library(broom)
result <- t.test(childmor_1987, childmor_2007)
result_tidy <- tidy(result)
result_tidy

# 5. Perform a t-test to determine if there is evidence of a difference between child mortality in `2006` versus `2007`.
# Use the `pull()` function to extract these columns. Print the results using the `tidy` function. How do these results compare to those in #4?
childmor_2006 <- mort %>% pull('2006')
childmor_2007 <- mort %>% pull('2007')
t.test(childmor_2006, childmor_2007)
library(broom)
result <- t.test(childmor_2006, childmor_2007)
result_tidy <- tidy(result)
result_tidy


# 6. Import "cars_auction.rds" dataset from eLC.  Assign it to the "cars" variable.
cars <- read_rds("data/cars_auction.rds")
install.packages("faraway")
library(faraway)

# 7. Fit a linear regression model with vehicle cost ("VehBCost") as the outcome and whether it's an online sale ("IsOnlineSale") as the predictor. 
# Save the model fit in an object called "lmfit_cars" and display the summary table.
lmfit_cars <- glm(VehBCost ~ IsOnlineSale + VehicleAge + IsOnlineSale, data= cars)
summary(lmfit_cars)


# 8. Fit a linear regression model with vehicle cost ("VehBCost") as the outcome and vehicle age ("VehicleAge") and whether it's an online sale ("IsOnlineSale") as predictors.  
# Save the model fit in an object called "lmfit_cars_2" and display the summary table.



# 9. Fit a linear regression model with vehicle cost ("VehBCost") as the outcome with predictors: (1) vehicle age ("VehicleAge"), (2) whether it's an online sale ("IsOnlineSale"), and interaction between "VehicleAge" and "IsOnlineSale".
# - To include the interaction, use `VehicleAge * IsOnlineSale` in the formula. 
# - Save the model fit in an object called "lmfit_cars_3" and display the summary table.



# 10. Fit a logistic regression model where the outcome is "bad buy" ("IsBadBuy") status and predictors are the cost ("VehBCost") and vehicle age ("VehicleAge").
# - Save the model fit in an object called "logfit_cars" and display the summary table.



