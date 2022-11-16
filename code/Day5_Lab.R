### Title: Day 5 - Data Summarization
### Author:  
### Purpose: Day 4 Exercises
### Date: 14 Sept 2022


## Prepare Workspace ####

# Today we do not want the previous days environment. Therefore we will clear it. This is not always the case.
# clean the environment
rm(list=ls(all=T)) 

## Load tidyverse
library(tidyverse)

## Day 5 Lab, Part 1 - Data Summarization ####

## 1. Import the Bike_Lanes.csv dataset from eLC and take a look. The dataset comes from BikeBaltimore, the Department of Transportation's bike program. 
# See http://data.baltimorecity.gov/Transportation/Bike-Lanes/xzfj-gyms for more info. 
BikeBaltimore <- read_csv("data/Bike_Lanes.csv")

## 2. How many bike "lanes" are currently in Baltimore?  You can assume 
# each observation/row is a different bike "lane". 
nrow(BikeBaltimore)


## 3. How many feet of bike "lanes" are currently in Baltimore, based on the `length` column? 
sum(BikeBaltimore$length)


## 4. Summarize the `bike` data to get the mean of `length` and `dateInstalled`. 
# Do this three ways: 1) with `summarize`, 2) with `summarize` and `across`, and 3) with `colMeans()`.
BikeBaltimore %>% summarize(mean_length = mean(length, na.rm=T),
                   mean_date = mean(dateInstalled, na.rm=T))

## 5. Hypothesize why the average date installed is a year from before bike lanes were being built in Baltimore then explore with `summary`.
# Data issues.
BikeBaltimore %>% pull(dateInstalled) %>% summary()
summary(BikeBaltimore$dateInstalled)


## 6. Filter any zeros out of `dateInstalled`. Assign this "cleaned" dataset object the name `bike2`.
bike2 <- bike %>% filter(dateInstalled !=0)
bike2 %>% pull(dateInstalled) %>% summary()


## 7. Sometimes it's not a good idea to drop data completely! Change any zeros in the original `bike` dataset `dateInstalled` to `NA` using `mutate` and `ifelse()`. Remember to reassign to `bike`

BikeBaltimore <- BikeBaltimore %>% mutate(dateInstalled = ifelse(dateInstalled==0, NA, dateInstalled))

## 8. Which indices of `dateInstalled` are NA values and how many are there?

which(is.na(bike$dateInstalled))
bike %>% pull(dateInstalled)

## Day 5 Lab  - Part 2 Data Summarization
rm(list=ls(all=T)) 

## Load tidyverse
library(tidyverse)
BikeBaltimore <- read_csv("data/Bike_Lanes.csv")
## 9. How many types of bike lanes are there? (use column named `type`)
range(type)


## 10. How many bike lanes are there per lane `type` and what is the average bike lane length per lane `type`?
# Use group_by and summarize, name the new variables, and assign the object to the name 'biketype'
biketype <- group_by(sum(BikeBaltimore$type))


## 11. Take your code from question 10, add another pipe (`%>%`), and then use`arrange()` to sort the output by the summarized column "mean".
BikeBaltimore %>% arrange (mean)


## 12. Which bike lane`type` has (a) the most number of and (b) longest average bike lane length?



## 13. Make a new column using `mutate` called `year_total`. This new column should be different for each year (`dateInstalled`), and indicate the total sum number of lanes (`numLanes`) built in that year. 
# Make sure to reassign the dataset to `bike` and hint use `group_by` first



## 14. How does your data from above change if you also group by `type`? Ungroup your data when you are done.



## 15. Using `bike` dataset, what was the average bike lane length grouped by `dateInstalled`? Remove `NA`s with `na.rm = TRUE`.



## 16. Create a histogram for the `length` column in the `bike` dataset. Try playing with the `breaks =` argument.



## 17. Create a scatterplot with `dateInstalled` on the x axis and `length` on the y axis.



## 18. What kind of plot would be better for showing the length by each year group? Make this plot.




