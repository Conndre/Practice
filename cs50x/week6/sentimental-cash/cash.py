
from cs50 import get_float

# Asks the user how much change is owed
while True:
    user_input = get_float("Change_owed: ")
    if user_input > 0:
        break

# Round to an integer number
cents = int(round(user_input * 100))
coins = 0

# Spits out the minimum number of coins
while cents >= 25:
    cents -= 25
    # Calculate the number of coins
    coins += 1

while cents >= 10:
    cents -= 10
    # Calculate the number of coins
    coins += 1

while cents >= 5:
    cents -= 5
    # Calculate the number of coins
    coins += 1

while cents >= 1:
    cents -= 1
    # Calculate the number of coins
    coins += 1

# Print the number of calculated coins
print(coins)
