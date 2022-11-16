### Title: Day 9 - Data Visualization
### Author:  Gbemisola Talabi
### Purpose: Day 9 Exercises
### Date: 12 October 2022


## Prepare Workspace ####

# Today we do not want the previous days environment. Therefore we will clear it. This is not always the case.
# clean the environment
rm(list=ls(all=T)) 

# Load ggplot2  (first make sure you have already installed it)
library(ggplot2)


# 1. Import dataset from the filename "Bike_Lanes.csv". Assign it to `bike` variable.  
# Check out the data, how many rows, how many columns, what are the data types of the variables?
bike <- read.csv("data/Bike_Lanes.csv")
nrow(bike)
ncol(bike)
class(bike)


# 2. Clean the data by removing rows in which `dateInstalled` is equal to 0. This data point is unusable. Reassign the data to `bike`
bike %>% drop_na()

# 3. Create a table showing the number of routes per route '`type` and then plot a bar plot using `geom_bar()` of the same information.



# 4. Rotating the x-axis text will make it easier to read in the plot from #3.  Google rotate axis text labels in ggplot, and add a layer to rotate the x axis text.



# 5. Add a fill color to the `bar_type` plot - first by adding color as an aesthetic and then as a attribute.



# 6. Create a new tibble called `bike_agg` to calculate is the average length of lanes (`length') for each year (`dateInstalled`). 
# Call the new variable `lane_avg_length`. You will need to use `group_by()` and `summarize()`



# 7. Use `ggplot2` package make plot of average length of lanes (`lane_avg_length`; y-axis) for each year (`dateInstalled`; x-axis). 
# You can use lines layer (`+ geom_line()`) or points layer (`+ geom_point()`), or both!
# Assign the plot to object `my_plot`. Then, type `my_plot` in the console to have it displayed 



# 8. "Update" your plot (i.e., from `my_plot`) by adding a title and changing the x and y axis titles.
# Then, type `my_plot` in the console to have it displayed 



# 9. Use the `scale_x_continuous()` function to plot the x axis with the following breaks `c(2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013)`. 


# 10. Observe several different versions of the plot by displaying `my_plot` while adding a different "theme" to it. 
my_plot + theme_bw()
my_plot + theme_classic()
my_plot + theme_dark()
my_plot + theme_gray()
my_plot + theme_void()

# 11. Create a new tibble called `bike_agg_2` from `bike` which is the number of lanes separately for each year (`dateInstalled`) and for each lane type (`type`). 
# Call the new variable `lane_count`



# 12. Use `ggplot2` package to make a plot showing trajectories of number of lanes (`lane_count`; y-axis) over year (`dateInstalled`; x-axis), where each bike line type has a different line with a different color (hint: use `color = type` in mapping). 



# 13. Change the color in the aesthetic mapping above to one of the viridis color palettes. 
# Keep in mind these are discrete that the variable `type` are discrete data points.
# Also, keep in mind we are changing the line and point color (not a fill color) - meaning use the `scale_color_viridis()` function
library(viridis)



# 14. Change the color in the aesthetic mapping above to one of the RColorBrewer qualitative color palettes. 
# Use this website to explore https://colorbrewer2.org/#type=qualitative&scheme=Accent&n=3
# Use `scale_color_brewer()` function
library(RColorBrewer)



# 15. Changing the color in the aesthetic mapping above to the Wes Anderson color palette called `BottleRocket1`. 
# use `scale_color_manual()` and specify the values argument using the `wes_palette()` function.
# Note there are 6 discrete values for`type` (i.e., `n=6`)
library(wesanderson)



# 16. Try changing the color in the aesthetic mapping above to a different Wes Anderson color palette. Why doesnt it work? 



# 17. Create you own custom pallette of six colors and apply it to the plot above. 


