import re
import sys


def main():
    print(count(input("Text: ")))


def count(s):
    # Search for the text "um" in a string imput, using IGNORECASE (case insensitive))

    um =  r"\bum\b"
    um_count = re.findall(um, s, re.IGNORECASE)
    return len(um_count)



if __name__ == "__main__":
    main()
