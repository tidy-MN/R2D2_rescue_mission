library(readr)
library(tidyr)
library(dplyr)
library(caesar)

# Day 3 Idea: Jedi forces have information that indicate the Rebels have plans
# to abduct Princess Leigh. Jedi have intercepted an encrypted message, and
# have gathered intelligence from eyewitness accounts of the conspirators.
# Witness's overheard mystery person one as saying there home world was "Concord Dawn"
# Mystery person 2 was described as being heavy, greater than 100 mass, not too tall less than
# 200 meters tall and having brown skin color.
# The encrypted message can be decoded by combining the two seed codes from each mystery person.



# Built-in Datasets
# Using package functions
# Filter function

starwars <- as.data.frame(dplyr::starwars)
starwars$seed <- sample(1000, size = nrow(starwars), replace = TRUE)
starwars <- group_by(starwars, homeworld)

mystery_person_one <- filter(starwars, homeworld == "Concord Dawn")
mystery_person_two <- filter(starwars, mass > 100 & skin_color == "brown" & height < 200)

secret_seed <- mystery_person_one$seed + mystery_person_two$seed
secret_seed

message = "We will capture him at noon on the high bluffs of Ojom"

scrambled_message = caesar::seed_cipher(text = message, 
                    seed = secret_seed)

caesar::seed_cipher(text = scrambled_message, 
                    seed = secret_seed, 
                    decrypt = TRUE)
