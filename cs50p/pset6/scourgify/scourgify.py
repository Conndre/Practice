import sys
import csv

def main():
    check_file()
    # Try to open the file
    students = []
    try:
        with open(sys.argv[1], "r") as csvfile:
            reader = csv.DictReader(csvfile)
            for row in reader:
                split_name = row["name"]. split(",")
                students.append({"first": split_name[1].lstrip(), "last": split_name[0], "house": row["house"]})

    # File does not exit (can not be opened)
    except FileNotFoundError:
        sys.exit("Could not read invalid_file.csv")

    # Write a csv file
    with open(sys.argv[2], "w") as file:
        writer = csv.DictWriter(file, fieldnames=["first", "last", "house"])
        writer.writerow({"first": "first", "last": "last", "house": "house"})
        for row in students:
           writer.writerow({"first": row["first"], "last": row["last"], "house": row["house"]})



# Check command line arguments
def check_file():
    if len(sys.argv) > 3:
        sys.exit("Too many command-line arguments")
    if len(sys.argv) < 3:
        sys.exit("Too few command-line arguments")
    # Check if it is a csv file
    if ".csv" not in sys.argv[1] or ".csv" not in sys.argv[2]:
        sys.exit("Not a csv file")



if __name__== "__main__":
    main()
