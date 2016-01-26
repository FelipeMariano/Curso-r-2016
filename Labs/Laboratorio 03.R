## Exercícios Lab 03:
## Felipe Mariano

#install.packages('nycflights13')
library(nycflights13)
library(tidyr)
library(magrittr)
library(dplyr)

flights <- flights %>% tbl_df

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
  flights %>% select(-tailnum, -origin, -dest)

######MUTATE:
#1------
 flights %>% select(flight, dep_delay, arr_delay, distance, air_time) %>% mutate(ganho_de_tempo = (dep_delay - arr_delay), velocidade = (distance/air_time * 60))

#2------
  flights %>% select(flight, hour, minute, air_time) %>% mutate(hour2 = hour + (air_time%/%60), minute2 = air_time %% 60)

######SUMMARISE:
#1------
  flights %>% summarise(media_dist = mean(distance))

#2------
  flights %>% group_by(month) %>% summarise(media = mean(distance))

#3------
  flights %>% group_by(month) %>% summarise(media = mean(air_time, na.rm = TRUE), mediana = median(air_time, na.rm = TRUE), quart1 = quantile(air_time, probs = c(0.25), na.rm = TRUE), quart3 = quantile(air_time, probs = c(0.25), na.rm = TRUE))
  #ARRUMAR


######ARRANGE:
#1------
  flights %>% arrange(dep_delay)


#2------
  flights %>% arrange(desc(dep_delay))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~TIDYR


######SPREAD:
#1------
  flights %>% select(day, month, dep_delay) %>%
  group_by(day, month) %>% summarise(med = mean(dep_delay, na.rm=TRUE)) %>%
  spread(month, med)


#2------
  flights %>% select(hour, day, dep_delay) %>%
  group_by(hour, day) %>% summarise(med = mean(dep_delay, na.rm=TRUE)) %>%
  spread(day, med)

######GATHER:
#1------
  flights %>% select(day, month, dep_delay) %>%
  group_by(day, month) %>% summarise(med = mean(dep_delay, na.rm=TRUE)) %>%
  spread(month, med) %>% gather(day)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~DESAFIOS
n <- nrow(flights)
flights %>% filter(dep_delay > 0) %>% 
  group_by(flight) %>% 
  summarise(med = mean(dep_delay + arr_delay, na.rm = TRUE), td = med + qt(0.975, df = n - 1) * sqrt(var(dep_delay + arr_delay, na.rm = TRUE) / n))


flights %>% filter(dep_delay > 0) %>% 
  group_by(dest) %>% 
  summarise(atraso_med = mean(dep_delay + arr_delay, na.rm = TRUE)) %>% 
  filter(atraso_med > 60) %>% 
  arrange(desc(atraso_med)) %>% head(10)
