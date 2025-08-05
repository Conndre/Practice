import sys
import csv
from tabulate import tabulate

table = []
# Check number of Command Line Arguments
if len(sys.argv) <= 1:
    sys.exit("Too few command-line arguments")
elif len(sys.argv) > 2:
    sys.exit("Too many command-line arguments")
elif not sys.argv[1].endswith(".csv"):
    sys.exit("Not a CSV file")

else:
    # Implement a program that expects exactly one command-line argument
    try:
        with open(f"{sys.argv[1]}") as file:
            reader = csv.DictReader(file)
            for row in reader:
                table.append(row)

    except FileNotFoundError:
        sys.exit("File does not exist")
    else:
        # Outputs a table formatted as ASCII art using Tabulate
        print(tabulate(table, headers="keys", tablefmt="grid"))


