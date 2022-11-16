### Title: Day 3 - Exporting Data and Subsetting Data
### Author: Amy Winter 
### Purpose: Day 3 Exercises
### Date: 31 August 2022


## Prepare Workspace ####

# Today we do not want the previous days environment. Therefore we will clear it. This is not always the case.
# clean the environment
 rm(list=ls(all=T)) 


## Day 3 Lab, Part 1 - Export Data ####

# 1. Download `DTP_Coverage_WHO.xlsx` from eLC and put it is the data subdirectory. 

# Objective 2a-2c: We want to use the `read_excel()` function in the `readxl` package to read in the `DTP_Coverage_WHO.xlsx` file and assign the object `dtp`

# 2a. The data is surveillance data from the WHO. It includes vaccination coverage of the DTP vaccine over time and by country. 
# Open the file in excel. You will find there are multiple sheets in the workbook. Comment below the name of the Worksheet we want to import.
#Data

# 2b. Use the read_excel help documentation to evaluate how you read in a particular Worksheet from the Worbook (HINT: you need to load the package first and then use ?function_name)

library(readxl)

read_excel("Data/DTP_Coverage_WHO.xlsx")

# 2c. Read in the correct Worksheet from `DTP_Coverage_WHO.xlsx` file and assign the output `dtp` 
dtp <- read_excel(path="data/DTP_Coverage_WHO.xlsx", sheet="Data")

# 3. Write out the `dtp` object as a CSV file calling it "dtp.csv" into the data subdirectory, using `write_csv()`:
library(readr)
write_csv(x=dtp, file= "data/dtp.csv")


# 4. Write out the `dtp` object as a tab delimited file calling it "monuments.csv", using `write_delim()`:
write_delim(x=dtp, file= "data/dtp.tab", delim= "/t")

# Objective 5a-5c: Create new vectors and save them to an extraneous folder.
# 5a. Create two new vectors, one with character strings and one with numeric values. 
num.var <- 20:23
char.var <- c("summer", "fall", "spring")

# 5b. Write the variables in `RData` format to a new subdirectory called 'extra' located in your data directory. Call the file `my_variable.RData`.
save(num.var, char.var, file="data/extra")

# 5c. clean the environment using rm(list=ls(all=T)) and reload "my.variable.rda"
rm(list=ls(all=T))
load(file="data/extra/my.variable.rda")



## Day 3 Lab, Part 2 - Subsetting Data ####

install.packages("tidyverse")
library("tidyverse")

# First check to see if you have the `mtcars` dataset by running 'mtcars`.  
mtcars


# 2. How many observations (rows) and variables (columns) are in the `mtcars` dataset - try the `dim()` function?
dim(mtcars)

# 3. Copy mtcars into an object called `cars_mt_copy.` Next, rename the column `mpg` in `cars_mt_copy` to `MPG` (hint - use `rename()`). Then check it out.
cars_mt_copy <- mtcars 

cars_mt_copy <- rename(cars_mt_copy, MPG = mpg)

head(cars_mt_copy)

# 4. Convert the column names of `cars_mt_copy` to all upper case. Use `rename_with()`, and the `toupper` command. Then check it out.
cars_mt_copy_upper <- rename_with(cars_mt_copy, toupper)
head(cars_mt_copy)


# 5. How can you print the first 3 rows and the last 3 rows of `cars_mt_copy` (in two lines of code)?
head(cars_mt_copy, n = 3)
tail(cars_mt_copy, n = 3)
cars_mt_copy[1:3, ]
cars_mt_copy[29:32, ]


# 6. Using `cars_mt_copy` create a column called `CAR` using the `rownames_to_column()` function. Create a tibble from the data called `cars_mt_copy`.  Take a look at your data to check it. How many dimensions does it have?
cars_mt_copy <- tibble(rownames_to_column(cars_mt_copy, "CAR"))
head(cars_mt_copy)
glimpse(cars_mt_copy)

# 7. Subset both the column `CAR` that you just created and the columns from `cars_mt_copy` that end in `"P"` and call it `pvars`. Hint: use `ends_with()` and `select()`. Again take a look at the data.
pvars <- select(cars_mt_copy, CAR, ends_with("P"))
pvars <- select(cars_mt_copy, CAR, ends_with("P"))
glimpse(pvars)

# 8. Create a subset of the `cars_mt_copy` that only contains the columns: `CAR`, `WT`, `QSEC`, and `HP` and assign this object to `carsSub` - what are the dimensions of this dataset?
carsSub <- select(cars_mt_copy, CAR, WT, QSEC, HP)
carsSub <- select(cars_mt_copy, CAR / WT / QSEC / HP)
dim(carsSub)
glimpse(carsSub)

# 9. Convert the column names of `carsSub` to all lower case. Take a look at the data.
carsSub <- rename_with(carsSub, tolower)
glimpse(carsSub)

# 10. Pull the variable `car` from `carsSub`. How does this differ form selecting it?
pull(carsSub, car)
select(carsSub,car)

# 11. Select the variables that contain the letter a from `cars_mt_copy`.
carsA <- select(cars_mt_copy, contains("a"))
glimpse(carsA)



## Day 3 Lab, Part 3 - Subsetting Data ####

# 1. Create a new object `cars_mpg` that is a subset the rows of `cars_mt_copy` that get **more** than 20 miles per gallon (`MPG`) of fuel efficiency - how many are there? Use `filter()`.


# 2. Subset the rows of `cars_mt_copy` that get **less** than 16 miles per gallon (`MPG`) of fuel efficiency and **more** than 150 horsepower (`HP`) - how many are there?


# 3. Subset the rows of `cars_mt_copy` that get **less** than 16 miles per gallon (`MPG`) of fuel efficiency **and** **greater than or equal** to 150 horsepower (`HP`) - how many are there?


# 4. Why do the answers for 2 and 3 differ?
  #They differ because there are two cars with HP values that are exactly 150.
  
# 5. Subset the rows of `cars_mt_copy` for cars that have 4 `CYL`,  **or** **less** than 1.9 WT. How many cars have both?


# 6. Create a subset called `carsSub` from the `cars_mt_copy` data that only contains the columns:
#`CAR`,	`WT`, `QSEC`, and `HP` for only the cars with 8 cylinders (`CYL`).
# What are the dimensions of this dataset? Don't use pipes (`%>%`).


# 7. Try the same thing again with pipes `%>%`. What happens if you do the steps in a different order? Why?




## Day 3 Lab, Part 4 - Subsetting Data ####
  
# 1. Re-order the rows of `carsSub` by weight (`WT`) in increasing order. Use `arrange()`. What is the heaviest car?


# 2. Create a new variable in `carsSub` called `WT2`, which  is equal to `WT^2`, using `mutate()`(don't forget to reassign `carsSub`). Use pipes `%>%`:


# 3. Move the `WT2` column to be first. Use `relocate()`.


# 4. How can you find the value of `WT2` for the Cadillac Fleetwood without just looking at the data manually and instead use functions we learned today?


