### Title: Day 1 - Introduction to R
### Author: Gbemisola Talabi 
### Purpose: Lab - developing first R script
### Date: 17th August 2022

## Prepare Workspace ##

# clean the environment 
rm(list=ls(all=T))

# Install and load packages 
install.packages("dplyr")
install.packages("ggplot2")

library(dplyr)
library(ggplot2)

# check out current working directory
getwd()

## Load ##
df <- read.csv("data/circulator_ridership.csv")
ls()
df
str(df)

## Data Manipulation
avg <- df %>%
  filter(type== "Average") %>%
  filter(day %in% c("Monday", "Friday", "Sunday"))

## Lets plot
palette <- c(banner = "aquamarine",green = "darkgreen",orange = "orange",
             purple= "purple")
ggplot(aes(x = date, y=number, group=line, color=line),
       data = avg) +
  geom_line() +
  facet_wrap(~day) +
  scale_colour_manual(values = palette)
