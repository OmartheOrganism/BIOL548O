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

# Grouping
surveys_by_species <- group_by(surveys, species_id)
print(summarize(surveys_by_species, abundance = n()))

# Grouping Multiple 
surveys_by_species_plot <- group_by(surveys, species_id, plot_id)
print(summarize(surveys_by_species_plot, abundance = n()))

species_weight <- summarize(surveys_by_species, avg_weight = mean(weight))

species_weight <- summarize(surveys_by_species,
                            avg_weight = mean(weight, na.rm = TRUE))
na.omit(species_weight) # Omit NaN's 

ds_data <- filter(surveys, species_id == "DS")
ds_data_by_year <- group_by(ds_data, year)
ds_weight_by_year <- summarize(ds_data_by_year,
                               avg_weight = mean(weight, na.rm = TRUE))
# This is a little dumbe I could've just piped the output of the first lines to the last one

### Exercise Two ###