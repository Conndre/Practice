
SPEED_OF_LIGHT = 300000000

# Ask the user to input a mass
mass_kg = int(input("Please enter a mass in kilograms: "))

# Calculate the energy in joules
energy_in_joules = mass_kg * (SPEED_OF_LIGHT ** 2)

# Print the result in joules
print("The energy is: ", energy_in_joules, "joules")
