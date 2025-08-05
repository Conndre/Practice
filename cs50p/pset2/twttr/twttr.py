# Ask for user input
text = input("Input: ")

# Print outpout
print("Output: ", end="")

vowels = ["a", "e", "i", "o", "u"]

# Loop through every letter
for letter in text:
    if not letter.lower() in vowels:
        print(letter, end="")

print()
