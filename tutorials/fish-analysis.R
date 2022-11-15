## This file reads in comma separated fish data and then appends a new column
## describing whether the fish size is categorized as big or small (at two different thresholds)
#fish_data = read.csv("Gaeta_etal_CLC_data.csv")
fish_data= read.csv("C:\Users\omartari\Documents\Course Work\BIOL548O\data\Gaeta_etal_CLC_data_2.csv")

library(dplyr)
fish_data_cat = fish_data %>% 
  mutate(length_cat = ifelse(length > 300, "big", "small"))