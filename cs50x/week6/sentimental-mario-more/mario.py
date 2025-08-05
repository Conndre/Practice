
from cs50 import get_int

# Prompt user for an integer number between 1 and 8 for the pyramid height
# Manage errors that re-prompt input, for invalid numbers o inputs

while True:
    try:
        height = get_int("Height: ")
        if height >= 1 and height <= 8:
            break

    except ValueError as error:
        print(error)

# Iterate to print two half-pyramids separated for a gap of size 2
for i in range(height):
    print(" " * (height - i - 1), end="")
    print("#" * (i + 1), end="")

    # Print a gap of size 2
    print("  ", end="")

    # Print the second half-pyramid
    print("#" * (i + 1))
