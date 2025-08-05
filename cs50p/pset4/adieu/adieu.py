# pip install inflect
import inflect
p = inflect.engine()

# Create a list to store the names
names = []

while True:
    try:
        name = input("Input: ")
        names.append(name)

    except EOFError:
        # Create a new line
        print()
        break

# Print the output using inflect module
output = p.join(names)
print("Adieu, adieu, to " + output)
