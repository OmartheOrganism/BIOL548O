## imports 
library(stringr)
install.packages("gapminder")
gDat <- gapminder::gapminder
str(gDat)

# Practice
(strings <- c("a", "ab", "acb", "accb", "acccb", "accccb"))
grep("ac*b", strings, value = TRUE)

### Exercise 1 ###
# find al countries in gapminder which contain the string ee
ee_countries <- grep("e{2}",levels(gDat$country),value=TRUE)
print(ee_countries)

### Exercise 2 ###
# find all .R files in main folder (scripts) 
R_files <- dir(path="scripts/",pattern="*.R$") 
print(R_files)

### Exercise 3 ### 
# find all countries in gapminder which contain i OR t AND end with land
i_t_land_countries <- grep("([i|t|I|T]+.*)(land)$",ignore.case=FALSE,levels(gDat$country),value=TRUE) %>% gsub(pattern = "land",replacement="LAND")
print(i_t_land_countries)

### Exercise 4 ### 
# find all continents with letter o
o_continents <- grep("o",levels(gDat$continent),ignore.case=TRUE, value=TRUE) 
print(o_continents)
