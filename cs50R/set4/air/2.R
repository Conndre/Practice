# In 2.R, load the air tibble from air.RData with load.
# Update the tibble by sorting all rows by  emissions column, highest to lower´

# Load the tibble
load("air.RData")

# Sort by emissions
air <- air %>% arrange(desc(emissions))

#Print air
print(air)

# Save the tibble
save(air, file = "2.RData")




