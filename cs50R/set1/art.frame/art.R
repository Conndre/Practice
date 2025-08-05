# Step 1: Create a blank data frame
art <- data.frame(
  A = c(" ", " ", " "),
  B = c(" ", " ", " "),
  C = c(" ", " ", " "),
  D = c(" ", " ", " "),
  E = c(" ", " ", " ")
)

# Step 2: Fill the data frame with characters to form a pattern
art[1, "B"] <- "*"
art[1, "D"] <- "*"
art[2, "A"] <- "*"
art[2, "E"] <- ":"
art[3, "B"] <- ":"
art[3, "D"] <- ":"

# Step 3: Print the data frame to see the ASCII art
print(art)

# test with  source("art.R")