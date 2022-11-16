### Title: Day 13 - Simulations
### Author:  Gbemisola Talabi
### Purpose: Day 13 Exercises
### Date: 8 November 2022

## Prepare Workspace ####

# Today we do not want the previous days environment. Therefore we will clear it. This is not always the case.
# clean the environment
rm(list=ls(all=T)) 

# Load all the libraries we will use in this lab. 


## Part 1 - Sampling ####

# 1. Let's start with a simple random sample. Sample from a sequence of 10 integers, 5 times, with replacement.
sample(1:10, size = 5, replace = TRUE)

# 2. Draw 100 values from a normal distribution with a mean of 0 and a sd of 1.
rnorm(100)
rnorm(100, mean = 0, sd = 1)

# 3. Draw 50 values from a normal distribution with a mean of 10 and sd of 5.
rnorm(50, mean = 10, sd = 5)

# 4. Draw 1000 values from a poisson distribution with a lambda of 50.
rpois(n = 1000, lambda = 50)

# 5. Draw 30 values from a uniform distribution between 0 and 10.

runif(n = 30, min = 0, max = 10)


## Part 2 - Sampling simulations ####

# 1. Let’s conduct some binomial simulations. Draw once from a sample of 10 with a probability of 0.4. 
rbinom(1, 10, 0.4)

# 2. Each run is a ”simulation”. Do 300 simulations of the same ”experiment” above using vectorized operations
# hint: You just need to change one number in the code.
rbinom(300, 10, 0.4)

# 3. Now, run 3,000 simulations. Assign them to a variable called ”sims” and use set.seed(377)
# What is the mean and median of this series of simulations? Plot the frequency table or histogram of the object ”sims”.
set.seed(377)
sims <- rbinom(3000, 10, 0.4)
mean(sims)
median(sims)
plot(table(sims))
hist(sims)



# 4. Re-run the simulations setting the probability to 0.8. use set.seed(485)
set.seed(485)
sims <- rbinom(3000, 10, 0.8)
mean(sims)
median(sims)
plot(table(sims))
hist(sims)

## Part 3 - Simulations for alpha check ####

# 1. Use the function simT with nrep=1000 and n=10. How many type 1 error do you expect?  Plot a histogram and count the number of type 1 errors.
simT(10, 1000)

# 2. Plot the output of the function simT with nrep=1000 and n=100. How many type 1 error do you expect?  Plot a histogram and count the number of type 1 errors.









## Part 4 - Simulations to estimate sample size ####

# If we sample values from two normal distributions with different means (e.g. N(0,1) and N(0.5,1)),
# what is the minimum sample size we need to detect a significant difference in means with a t.test, 80% of the time?
# 1. Draws n values from a random normal distribution with mean1=0, and another n values from a normal distribution with mean2=0.05
# 2. Compares the means of these two samples with a t-test and extracts the p.value
# 3. Replicate the function 1000 times using the parameters used in the power calculation in the lecture (that used the power.t.test function)
# 4. Calculate the proportion of p-values that are <0.05

rnorm(0:1, mean = 0)



## Part 5 - Simulations to bootstrap confidence intervals ####

# 1. Survey of 1000 people, 500 men and 500 women. 75% men and 65% of women support the death penalty. 
# Compute a standard error of proportion supporting the death penalty for men and women (i.e., se = sqrt(p*(1-p)/n)),


# 2. The risk ratio is 0.75/0.65 = 1.15. 
# Estimate bootstrap confidence intervals of the risk ratio, run 10,000 normal simulations for each gender 





## Part 6 -  Simulations to prepare an analysis plan ####

# 1. Add gender to the dataset we prepared in the lecture.

# 2. Run a multivariate logistic regression on your data with lung cancer as the outcome. 

