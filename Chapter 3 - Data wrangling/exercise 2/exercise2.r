library(dplyr)
library(tidyr)


setwd("~/Coding/Springboard/Chapter 3 - Data wrangling/exercise 2/")
data <- read.csv('titanic3.csv')
df <- data.frame(data)

# cleaning missing values in embarked
df$embarked <- sub("^(\\s)*$", "S", df$embarked)

# calculate mean of age
df$age[is.na(df$age)] <- mean(df$age[!is.na(df$age)])

## Some other possibilities
## - Median age - this way you would not 'skew' the distribution
## - Use more specific estimators, eg. the mean or median for that gender, or the port of departure, or the survival, etc. This will likely be more accurate


# set people with no value in lifeboat to NA
df$boat[df$boat == ""] <- NA

# Cabin nr - doesnt make sense to fill in given that there is no real way to 'guess' which cabin the majority of people were in, based on the other cabins.
df$has_cabin_number <- as.numeric(df$cabin == "")
