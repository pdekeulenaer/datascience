#loading
library(dplyr)
library(ggplot2)
library(tidyr)
library(EDAWR)
library(nycflights13)

#piping
diamonds$x %>%
  round(0) %>%
  mean()

#data
gather(cases, "year", "n", 2:4)
spread(pollution, "size", amount)

storms <- separate(storms, date, c("Y","M","D"), sep="-")
storms <- unite(storms, "date", Y, M, D, sep="-")

# selecting w dplyr
select(storms, storm, date)
select(storms, -storm)

filter(storms, wind>=50)

mutate(storms, ratio= wind / pressure, inverse = ratio ^ -1)

summarize(storms, mean = mean(wind), n = n())

arrange(storms, desc(wind), desc(storm))

# master piping
storms %>%
  filter(wind >= 25) %>%
  select(storm, pressure) %>%
  summarize(mean=mean(pressure))

# grouping
pollution %>% 
  group_by(size) %>% 
  summarize(mean = mean(amount), sum = sum(amount))

tb %>% 
  gather(age_group, cases, 4:6) %>% 
  group_by(country, sex, age_group) %>% 
  filter(!is.na(cases)) %>% 
  summarise(cases = mean(cases))
  


