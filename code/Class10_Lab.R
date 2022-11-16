### Title: Day 10 - Data Visualization Part 2 & Factors
### Author:  Gbemisola Talabi
### Purpose: Day 10 Exercises
### Date: 19 October 2022


## Prepare Workspace ####

# Today we do not want the previous days environment. Therefore we will clear it. This is not always the case.
# clean the environment
rm(list=ls(all=T)) 

# Load all the libraries we will use in this lab. 
library(tidyverse)
library(ggplot2)
library(dplyr)
library(readr)

## Class 10 - Part 1 Data Visualization 2 ####

# 1. We will use the built in dataset `mtcars` - have a look at the dataset using `glimpse()`
glimpse(mtcars)

# 2. Create a histogram of `mpg` using `stat_bin()`.

ggplot(mtcars, aes(x=mpg)) +
  stat_bin()

# 3. Create a histogram of `wt` using `stat_bin()`.
ggplot(mtcars, aes(x=wt)) +
  stat_bin()

# 4. Using mtcars, create a scatter plot of mpg (x axis) and wt (y axis) and then add fit a line using LOESS method with `stat_smooth()`
ggplot(mtcars, aes(mpg, wt)) +
 geom_point() + stat_smooth()


# 5. Using mtcars, create a scatter plot of mpg (x axis) and wt (y axis) and then add fit a line using linear model method with `stat_smooth()`

ggplot(mtcars, aes(mpg, wt)) +
  geom_point() + stat_smooth(method = "glm")

# 6. Draw the same plot again but using `geom_smooth()` instead of `stat_smooth()`

ggplot(mtcars, aes(mpg, wt)) +
  geom_point() + geom_smooth(method = "glm")

# 7. Using mtcars, create a scatter plot of mpg (x axis) and wt (y axis) and then add fit a line using GAM method with `stat_smooth()`
# - use `formula = y ~ s(x, bs="cr")` 
# - change the color of the fit line and the area of the ribbon to hex code "#2ca25f"
ggplot(mtcars, aes(mpg, wt)) +
  geom_point() + stat_smooth(method= "gam", formula = y ~ s(x, bs="cr"), color = "#2ca25f", fill = "#2ca25f")


# 8. Create a new factor variable names 'fcyl' from `cyl`
mtcars <- mtcars %>% 
  mutate(fcyl = factor(cyl))

# 9. Using mtcars, create a scatter plot of mpg (x axis) and wt (y axis), colored by `fcyl`.
# - Add fit a line using linear model method with `stat_smooth()`
# - Remove the 95% confidence interval ribbon

ggplot(mtcars, aes(mpg, wt, color = fcyl)) +
  geom_point() + geom_smooth(method = "lm", se = FALSE)

# 10. Zoom in on the plot from question #9 for mpg 15 to 20 using `coord_cartesian()`
ggplot(mtcars, aes(mpg, wt, color = fcyl)) +
  geom_point() + geom_smooth(method = "lm", se = FALSE) +
  coord_cartesian(xlim=c(15,20))


# 11. Use facet_grid to break the plot from  question #9 for each `fcyl` factor value
# create one plot where is fcyl factor value plot is a different row
ggplot(mtcars, aes(mpg, wt, color = fcyl)) +
  geom_point() + geom_smooth(method = "lm", se = FALSE) +
  facet_grid(fcyl ~ .)

ggplot(mtcars, aes(mpg, wt, color = fcyl)) +
  geom_point() + geom_smooth(method = "lm", se = FALSE) +
  facet_grid(. ~ fcyl)


# 12. Using mtcars plot the mean `mpg` (y axis) as points and 2 standard deviations from the mean `mpg` as vertical lines
# for each cylinder 'fcyl' (x axis) using `stat_summary(fun.data = mean_sdl) 
library(Hmisc)

ggplot(mtcars, aes(x= fcyl, y = mpg)) +
  stat_summary(fun.data = mean_sdl, fun.args = list(mult=2))



## Class 10 - Part 2 Factors ####

# 1. Load the Youth Tobacco Survey data ("Youth_Tobacco_Survey_YTS_Data.csv")
# Then, `select` "Sample_Size",  "Education", and "LocationAbbr". Name this data "yts". 



# 2. Create a boxplot showing the difference in "Sample_Size" between Middle School and High School "Education". 
# **Hint**: Education is the x variable and Sample_Size is the y axis.



# 3. Use `count` to count up the number of observations of data for each "Education" group.



# 4. Make "Education" a factor using the `mutate` and `factor` functions.  Use the `levels` argument inside `factor` to reorder "Education". Reorder this variable so that "Middle School" comes before "High School". Assign the output the name "yts_fct".



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
library(forcats)



