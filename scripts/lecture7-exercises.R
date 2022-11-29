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

### 