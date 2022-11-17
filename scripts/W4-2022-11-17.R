### Imports ###
library(dplyr)

### Exercise One ####
# Load Data
shrubs <- read.csv(file.path("data","shrub-volume-data.csv"))

# EPA
# View Columns
print(names(shrubs))

# View Contents 
print(str(shrubs))

# Working with dplyr
print(shrubs %>% select(length))
print(shrubs %>% select(length,height))
print(shrubs %>% filter(height>5))

shrubs_data_w_vols <- shrubs %>% rowwise() %>% mutate(volume = (length*width*height))
print(shrubs_data_w_vols)
