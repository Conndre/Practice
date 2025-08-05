from datetime import date
import inflect
import sys
import operator
p = inflect.engine()


def main():
    # Get a birthdate input and Check if it is a valid day
    try:
        birthdate = input("Date of Birth: ")
        # Calculate the difference between input and today-date (by using operator)
        difference = operator.sub(date.today(), date.fromisoformat(birthdate))
        # Print the age in minutes using words
        print(convert_to_text(difference.days))

    except ValueError:
        sys.exit("Invalid date")


def convert_to_text(time):
    # Convert the age to minutes
    minutes = time * 24 * 60

    # Use inflect and return the result (numbers to words)
    return f"{(p.number_to_words(minutes, andword='')).capitalize()} minutes"


if __name__ == "__main__":
    main()
