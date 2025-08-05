# Prompt user for flavor preference
flavor <- tolower(readline(prompt = "What is your flavor preference (Light or Bold)? "))

# Prompt user for caffeine preference
caffeine <- tolower(readline(prompt = "Do you prefer caffeine (Yes or No)? "))

# Check for valid flavor input
if (flavor != "light" && flavor != "bold") {
  cat("Invalid flavor input. Please enter 'Light' or 'Bold'.\n")
} else {
  # Check for valid caffeine input
  if (caffeine != "yes" && caffeine != "no") {
    cat("Invalid caffeine input. Please enter 'Yes' or 'No'.\n")
  } else {
    # Recommendation logic using logical expressions
    if (flavor == "light" && caffeine == "yes") {
      cat("We recommend green tea!\n")
    } else if (flavor == "bold" && caffeine == "yes") {
      cat("We recommend black tea!\n")
    } else if (flavor == "light" && caffeine == "no") {
      cat("We recommend chamomile tea!\n")
    } else if (flavor == "bold" && caffeine == "no") {
      cat("We recommend rooibos tea!\n")
    }
  }
}

# test by source("teahouse.R")type light, follow by yes

