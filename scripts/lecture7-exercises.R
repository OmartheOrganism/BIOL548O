### Exercise One ### 
# Define weight conversion fxn
pounds2grams <- function(pounds){
  grams <- pounds*453.592
  return(grams)
}

# Call function
testMass <- pounds2grams(3.75)
print(testMass)

### Exercise Two ###
# Function: Take length of a therapod and estimate it's mass (from lecture note)
get_mass_from_length_theropoda <- function(length){
  mass <- 0.73 * length ^ 3.63
  return(mass)
}

# Estimate mass of Spinosaurus
spinosaurusMass <- get_mass_from_length_theropoda(16)
print(spinosaurusMass)

# Generate new function which takes in a and b as parameters alongside length
get_mass_from_length <- function(length,a,b){
  mass = a*length^b
  return(mass)
}

# Estimate mass of a Sauropod (for which a=214.44, b=1.46) whose length is 26m
sauropodMass <- get_mass_from_length(26,214.44,1.46)
print(sauropodMass)

### Exercise 3 ###
#rewrite get_mass_from_length function to set default parameters
## rewriting so that the code for exercise two is preserved, so long as the script is executed in order everything should be fine
get_mass_from_length <- function(length,a=39.9,b=2.6){
  mass = a*length^b
  return(mass)
}

# redo calculation of Sauropod mass 
sauropodMass <- get_mass_from_length(26,a=214.44,b=1.46)
print(sauropodMass)

# calculate mass of unknown dinosaur of length 16m 
unknownDinoMass <- get_mass_from_length(16)
print(unknownDinoMass)

### Exercise 4 ###
kg2pounds <- function(mass){
  pounds = mass*2.205
  return(pounds)
}

# get mass (in pounds) of Stegosaurus (a=10.95,b=2.64) which has length of 12m
stegosaurusMass <- kg2pounds(get_mass_from_length(12,a=10.95,b=2.64))
print(stegosaurusMass)
