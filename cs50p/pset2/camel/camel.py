# Ask user for input
camelcase= input("CamelCase: ")

# Print snake_case
print("snake_case: ", end="")

# Loop through every letter
# Print all letters in lowercase and separated words by underscores# Print all letters in lowercase and separated words by underscores

for letter in camelcase:
    if letter.isupper():
        print("_" + letter.lower(), end="")
    else:
        print(letter, end="")

# Print space at the end
print()
