### Exercise 13.2.1 ### 
#1) You would need the tailnum, origin and destination from the flights table and the latitude and longitude from the airports table in order to draw the path each plane takes.
#2) Weather connects to the Airports dataframe through the origin variable.
#3) If it included information for all airports it would also connect to flights through the destination variable.

### Exercise 13.4.6 ### 
#1) See code below.
#2) See code below. 
#3) There appears to be no relationship between age/year and delay.

### Exercise 13.5.1 ### 
#2) See code below.
#5) 
#anti_join(flights, airports, by = c("dest" = "faa")): Tells you which flights have destinations not found in the airports dataframe.

#anti_join(airports, flights, by = c("faa" = "dest")): Tells you which airports are not found as destinations in the flights dataframe. 
################ CODE ################
### Exercise 13.4.6 ### 
## imports 
library(nycflights13)
library(tidyverse)

## 13.4.1 Q1
# Compute average arrival delay 
flights2 <- flights %>% group_by(dest) %>% summarise(mean.delay=mean(dep_delay,na.rm=TRUE))

# Plot airports by flight delays (code from textbook, changed to inner join)
flights2 %>% 
  inner_join(airports, by = c("dest" = "faa"))%>% 
  ggplot(aes(x=lon, y=lat, color=mean.delay)) +
  borders("state") +
  geom_point() +
  coord_quickmap()

## Q2
flights3 <- flights %>% left_join(airports,by=c("origin"="faa")) %>% left_join(airports,by=c("dest"="faa"))
print(select(flights3,lat.x,lon.x))

## Q3
flights4 <- flights %>% 
  group_by(tailnum) %>%
  summarise(mean.delay=mean(dep_delay,na.rm=TRUE)) %>%
  left_join(planes, by="tailnum") %>%
  ggplot(aes(x=year, y=mean.delay)) +
  geom_point()
print(flights4)

### Exercise 13.5.1 ### 
## Q2
flights5 <- flights %>%
  group_by(tailnum) %>%
  summarise(total = n()) %>%
  filter(total > 100)

flights %>% semi_join(flights5,by="tailnum")

## Q5 
print(anti_join(flights, airports, by = c("dest" = "faa")))
print(anti_join(airports, flights, by = c("faa" = "dest")))