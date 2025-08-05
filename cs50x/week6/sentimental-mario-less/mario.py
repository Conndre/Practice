
from cs50 import get_int

# Get an integer number between 1 and 8 for the pyramid height
while True:
    n = get_int("Height: ")
    if n >= 1 and n <= 8:
        break

# Iterate to print a pyramid with the input number

for i in range(0, n, 1):
    for j in range(0, n, 1):
        if (i + j < n - 1):
            print(" ", end="")
        else:
            print("#", end="")
    print()
