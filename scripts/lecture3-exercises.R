############ Exercise One #############
## Load untidy data
lotr_untidy <- read.csv(file.path("data","lotr_untidy.csv"))
# View data 
print(lotr_untidy)

## Tidying the untidy data
lotr_tidy <-
  gather(lotr_untidy, key = 'Gender', value = 'Words', Female, Male)
lotr_tidy <-
  pivot_longer(lotr_untidy, cols=c(Female, Male), names_to = 'Gender', values_to = 'Words')
lotr_tidy <- arrange(lotr_tidy,'Gender')
#View data
print(lotr_tidy)


## Writing data to a csv file
write_csv(lotr_tidy, path = file.path("data", "lotr_tidy.csv"))

############ Exercise Two #############
## Load Male and Female dataframes 
male <- read.csv(file.path("data","Male.csv"))
female <- read.csv(file.path("data","Female.csv"))

# View Data
print("Male Data")
print(male)
print("Female Data")
print(female)
print("Gender is a spectrum")

## Using gender specific data, recreate the tidy lotr data
lotr_untidy_fromGender <- bind_rows(female,male)
str(lotr_untidy_fromGender)
# View Data
print(lotr_untidy_fromGender)
#Gather Race Columns
lotr_tidy_fromGender <-
  gather(lotr_untidy_fromGender, key = 'Race', value = 'Words', Elf, Hobbit,Man)
#Sort by gender
lotr_tidy_fromGender <- arrange(lotr_tidy_fromGender, Gender)
# Write to CSV
write_csv(lotr_tidy, path = file.path("data", "lotr_tidy_fromGender.csv"))
## NB: Already created lotr_tidy from film specific data in Exercise One 


############ Exercise Three #############
lotr_tidy <- read_csv(file.path("data", "lotr_tidy.csv"))
print(lotr_tidy)

#Preview spread data into seperate columns for races/genders
lotr_tidy %>% 
  spread(key = Race, value = Words)

lotr_tidy %>% 
  spread(key = Gender, value = Words)

print(lotr_tidy) # data is unchanged

# Actually spread the data with pivot_wider()
lotr_untidy_byGender <- pivot_wider(lotr_tidy,names_from="Gender",values_from = "Words")
lotr_untidy_byRace <- pivot_wider(lotr_tidy,names_from = "Race",values_from="Words")
lotr_tidy_RaceGenderMerge <-unite(lotr_tidy,Race_Gender,Race,Gender) # Merge Gender and Race Columns
lotr_untidy_byBoth <- pivot_wider(lotr_tidy_RaceGenderMerge,names_from = "Race_Gender",values_from="Words")

# Write each of these to csv files in the data directory
write_csv(lotr_untidy_byGender, path = file.path("data","lotr_untidy_byGender.csv"))
write_csv(lotr_untidy_byRace, path = file.path("data","lotr_untidy_byRace.csv"))
write_csv(lotr_untidy_byBoth, path = file.path("data","lotr_untidy_byBoth.csv"))