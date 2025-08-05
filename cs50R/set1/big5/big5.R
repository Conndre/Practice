# Read the data from the tests.tsv file
tests <- read.table("tests.tsv", header = TRUE, sep = "\t")

# Convert the gender column according to the codebook
tests$gender <- ifelse(tests$gender == 1, "Male",
                       ifelse(tests$gender == 2, "Female",
                              ifelse(tests$gender == 3, "Other", "Unanswered")))
# Check if the gender conversion worked correctly
print(head(tests$gender))

# Compute the extroversion score (sum E columns, divided by 15, rounded to 2 dec.)
tests$extroversion <- round((tests$E1 + tests$E2 + tests$E3) / 15, 2)
# Compute the neuroticism score
tests$neuroticism <- round((tests$N1 + tests$N2 + tests$N3) / 15, 2)
# Compute the agreeableness score
tests$agreeableness <- round((tests$A1 + tests$A2 + tests$A3) / 15, 2)
# Compute the conscientiousness score
tests$conscientiousness <- round((tests$C1 + tests$C2 + tests$C3) / 15, 2)
# Compute the openness score
tests$openness <- round((tests$O1 + tests$O2 + tests$O3) / 15, 2)

# Write the modified data to analysis.csv
write.csv(tests, "analysis.csv", row.names = FALSE)

# Check and view the file
df <- read.csv("analysis.csv")
View(head(df))

# Test with source("big5.R")


