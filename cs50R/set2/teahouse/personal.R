# Prompt user for coffee strength preference
strength <- tolower(readline(prompt = "What is your coffee strength preference (Mild, Medium, Strong)? "))

# Prompt user for sweetness preference
sweetness <- tolower(readline(prompt = "Do you want your coffee sweetened (Yes or No)? "))

# Check for valid strength input
if (strength != "mild" && strength != "medium" && strength != "strong") {
  cat("Invalid strength input. Please enter 'Mild', 'Medium', or 'Strong'.\n")
} else {
  # Check for valid sweetness input
  if (sweetness != "yes" && sweetness != "no") {
    cat("Invalid sweetness input. Please enter 'Yes' or 'No'.\n")
  } else {
    # Recommendation logic using logical expressions
    if (strength == "mild" && sweetness == "yes") {
      cat("We recommend a Vanilla coffee!\n")
    } else if (strength == "medium" && sweetness == "yes") {
      cat("We recommend a Caramel Coffee\n")
    } else if (strength == "strong" && sweetness == "yes") {
      cat("We recommend a Mocha!\n")
    } else if (strength == "mild" && sweetness == "no") {
      cat("We recommend a American Coffee!\n")
    } else if (strength == "medium" && sweetness == "no") {
      cat("We recommend a Cappuccino!\n")
    } else if (strength == "strong" && sweetness == "no") {
      cat("We recommend an Espresso!\n")
    }
  }
}
