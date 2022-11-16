### Title: Day 2 - Basic R & Data Import
### Author: Amy Winter 
### Purpose: Day 2 Exercises
### Date: 24 August 2022


## Prepare Workspace ####

# clean the environment
rm(list=ls(all=T)) 


## Day 2 Lab, Part 1 - Basic R ####

#1. Create a new object called `my.num` that contains 6 numbers. (hint: my.num <- ___ )

my.num <- c(1, 2, 3, 4, 5, 6)
my.num

#2. Multiply `my.num` by 4.
my.num * 4


#3. Create a second object called `my.char` that contains 5 character strings.
my.char <- c("head", "tail", "song", "table", "song")
my.char



#4. Combine the two objects `my.num` and `my.char` into an object called `both`.
both <- c("my.num", "my.char")


#5. What is the length of `both`?
length(both)


#6. What class is `both`?
class(both)



#7. Divide `both` by 3, what happens?
both / 3



#8. Create a vector with elements 1 2 3 4 5 6 and call it `x`.
x <- c(1, 2, 3, 4, 5, 6)


#9. Create another vector with elements 10 20 30 40 50 and call it `y`.
y <- c(10, 20, 30, 40, 50)


#10. What happens when you add `x` and `y` together?
x+y 



#11. Append the value 60 onto the vector `y` (hint: you can use the c() function).

y <- c(10, 20, 30, 40, 50, 60)
y <- c(y,60)

#12. Add `x` and `y` together.
x+y


#Bonus: Multiply `x` and `y` together. How is this similar to the way R performs addition in #12 ?
x*y


#Bonus: Create a vector that contains 4 sets of the numbers 1, 2, 3, and 4.
z <- c(1, 2, 3, 4)
z2 <- c(z, z, z, z)


## Day 2 Lab, Part 2 - Data Importation ####

# 1.  Install and load the `readr` package with the `install.packages()` command and the `library()` command. 

install.packages("readr")
library("readr")


# 2. Download the datasets `Youth_Tobacco_Survey_YTS_Data.csv` and `Monuments.xlsx` from eLC and put them in EPID7500_RProject/data directory



# 3. Read in the Youth Tobacco study and assign it to an object named `youth`. Remember it is in the "data" directory.
youth <- read_csv("data/Youth_Tobacco_Survey_YTS_Data.csv")
youth


# 4. Use `head()` to display the first few rows of the data frame. 
head(youth)


# 5. Use `spec()` to display the list of column names and their type specification. 

spec(youth)

# 6. Install and load the `readxl` package.
install.packages("readxl")
library("readxl")



# 7. Use the `read_excel()` function in the `readxl` package to read in the `Monuments.xlsx` file and call the output `mon`

mon <- read_excel("data/Monuments.xlsx")

# 8. Bonus: Run the following code - is there a problem? How do you know?
read_delim(file = "data/Youth_Tobacco_Survey_YTS_Data.csv", delim = "\t")



# 9. Bonus: Install and load the `haven` package. Look at the help page for `read_dta()` function, and scroll to the very bottom of the page. Try running some of the examples provided.
install.packages("haven")
library("haven")

path <- system.file("examples", "iris.dta", package = "haven")
read_dta(path)
