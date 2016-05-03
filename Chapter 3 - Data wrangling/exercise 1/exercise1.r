library(dplyr)
library(tidyr)


setwd("~/Coding/Springboard/Chapter 3 - Data wrangling/exercise 1")
data <- read.csv('refine.csv')
df <- data.frame(data)

# Clean up brand names w factors
df <- mutate(df, company = tolower(company))

df$company <- factor(df$company)
levels(df$company) <- c(rep("akzo",3),rep("philips",6), rep("unilever",2), rep("van houten",1))


# split product code and number
df <- separate(df,'Product.code...number', c('product_code', 'product_nr'),sep="-")

# add category
p <- factor(df$product_code)
levels(p) <- c("smartphone", "tablet", "TV", "laptop")

df$product_type = p

# combine address
df <- unite(df, 'full_address', address, city, country, sep=", ")

# define a function to add the columns
addcol <- function(df, var, key) {
  for (l in levels(factor(df[[var]]))){
    df[paste(key,'_',l, sep="")] = (df[var] == l)
  }
  return(df)
}

df <- df %>% 
  addcol('product_type', 'product') %>% 
  addcol('company', 'company')
