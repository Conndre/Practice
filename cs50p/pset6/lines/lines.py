import sys

# Check number of Command Line Arguments
if len(sys.argv) > 2:
    sys.exit("Too many command-line arguments")
elif len(sys.argv) < 2:
    sys.exit("Too few command-line arguments")

else:
    # Implement one command-line argument
    # outputs the number of lines of code in that file, excluding comments and blank lines
    if sys.argv[1].endswith(".py"):
        nlines=0
        with open(sys.argv[1], 'r') as file:
            for line in file:
                if not line.lstrip().startswith("#") and line.lstrip() != "":
                    nlines += 1
            print(nlines)

    else:
        sys.exit("Not a Phyton file")





