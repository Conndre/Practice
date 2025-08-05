from cs50 import get_int

sum_evens = 0
sum_odds = 0
digit_number = 0
number = 0
number2 = 0

while True:
    credit_card = get_int("Number: ")
    if credit_card > 0:
        break

# Loop over the credit card numer
while credit_card > 0:
    digit_number += 1

    # Get all the digits jumping every 2 digits.
    number2 = number

    number = credit_card % 10

    if digit_number % 2 == 0:
        duplicate = number * 2

        # Add the every 2 digits numbers
        sum_evens += (duplicate // 10) + (duplicate % 10)
    else:
        sum_odds += number

    # Divide and decrease one digit from credit card
    credit_card = credit_card // 10

# Use the given formula
first_n = number * 10 + number2

# Check if the credit card is valid
if (sum_evens + sum_odds) % 10 == 0:

    # Validate and check the different kind of credit cards
    if (sum_evens + sum_odds) % 10 == 0:

        if (digit_number == 13 or digit_number == 16) and number == 4:
            print("VISA")

        elif digit_number == 15 and (first_n == 34 or first_n == 37):
            print("AMEX")

        elif digit_number == 16 and first_n >= 51 and first_n <= 55:
            print("MASTERCARD")

        else:
            print("INVALID")

else:
    print("INVALID")






