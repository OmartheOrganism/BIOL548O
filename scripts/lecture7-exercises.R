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
