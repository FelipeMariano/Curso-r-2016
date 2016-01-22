##Lab 03:

library(nycflights13)
#install.packages('nycflights13')

library(dplyr)

flights <-flights %>% tbl_df

######FILTER:
#1------
  flights %>% filter(month == 1 & year == 2013) %>% print(n=100)

#2------
  flights %>% filter(month %in% c(1,2) & year == 2013)  %>% print(n=100)

#3------
  flights %>% filter(distance > 1000) %>% print(n=100)


######SELECT:
#1------
  flights %>% select(month, dep_delay)

#2------
  flights %>% select(mes = month, atraso = dep_delay)

#3------
