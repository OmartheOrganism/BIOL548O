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

<<<<<<< HEAD
### Exercise Two ###
surveys <- read.csv(file.path("data","surveys.csv"))

## Without Pipes
# Select Year Month Day
surveys_YMD <- select(surveys, year, month, day)

# Convert Weight Column to kg's 
surveys_1 <- select(surveys, year,species_id,weight)
surveys_2 <- na.omit(surveys_1)
surveys_3 <- mutate(surveys_2, weight = (weight/1000))

# Get counts of speicies id's in data
species_counts <- summarize(group_by(surveys, species_id), abundance=n())

# Get mean weights by year
species_weight_means <- select(surveys,year,species_id,weight)
species_weight_means <- group_by(species_weight_means, year)
species_weight_means <- summarize(species_weight_means, avg=mean(weights))
species_weight_means <- na.omit(species_weight_means)
print(species_weight_means)

### Exercise Three ###
# Select Species_ID, weight and year columns only
print(surveys %>% select(year,species_id,weight) %>% na.omit())
# Get Data for species_id SH only
print(surveys %>% select(year,month,day,species_id) %>% filter(species_id=="SH"))
# Get a count for number of rows for each species ID
print(surveys %>% select(species_id) %>% group_by(species_id) %>% summarize(count = n()))
#Get a count for number of rows for each species ID in each year 
print(surveys %>% select(species_id,year) %>% group_by(year,species_id) %>% summarize(count = n()))

surveys %>% select(species_id,year,weight) %>% group_by(year,species_id) %>% summarize(avg = mean(weight)) %>% na.omit()



      
=======
### Exercise Two ###
>>>>>>> c975547dd98c63dbb2ae2d8bdd0028d5066504d2
