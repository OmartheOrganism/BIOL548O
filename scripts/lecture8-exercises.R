### Exercise One ###
# Inialize variables
w <- 10.2
x <- 1.3
y <- 2.8
z <- 17.5
colors <- c("red", "blue", "green")
masses <- c(45.2, 36.1, 27.8, 81.6, 42.4)
dna1 <- "attattaggaccaca"
dna2 <- "attattaggaacaca"

# Determine if:
## w > 10?
print(w > 10)
## green is in colors?
print("green" %in% colors)
## x >y?
print(x > y)
## are any values in masses greater than 40?
print("TRUE" %in% c(masses > 40))

### Exercise Two ###
# Practice conditional age_class
age_class = "sapling"
if (age_class == "sapling"){
  y <- 10
}
print(y)

### Exercise 3 ### 
# Practice Alternative conditional age_class
age_class <- "seedling"
if (age_class == "sapling"){
  y <- 10
} else if (age_class == "seedling"){
  y <- 5
}
print(y)

# create else statement at end
age_class <- "adult"
if (age_class == "sapling"){
  y <- 10
} else if (age_class == "seedling"){
  y <- 5
} else {
  y <- 0
}
print(y)

### Exercise 4 ###
get_mass_from_length_by_name <- function(length,name){
  if (name=="Stegosauria"){
    a <- 10.95
    b <- 2.64
  } else if (name=="Theropoda"){
    a <- 0.73
    b <- 3.63
  } else if (name=="Sauropoda"){
    a <- 214.44
    b <- 1.46
  } else {
    print("I'm sorry I don't know how to deal with that kind of dino!")
    a <- NA
    b <- NA
    mass <- NA
  }
  mass <- a*length^b
  return(mass)
}

# use new fxn to get mass
print(get_mass_from_length_by_name(10,"Stegosauria"))
print(get_mass_from_length_by_name(8,"Theropoda"))
print(get_mass_from_length_by_name(12,"Sauropoda"))
print(get_mass_from_length_by_name(13,"Ankylosauria"))


