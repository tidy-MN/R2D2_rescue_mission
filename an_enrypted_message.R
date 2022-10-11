library(readr)
library(tidyr)
library(dplyr)
library(caesar)

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
