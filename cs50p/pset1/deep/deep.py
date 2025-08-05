def main():
    # Ask the user
    answer = input("What is the Answer to the Great Question of Life, the Universe, and Everything? ")

    # Acceptable Answers: 42 or (case-insensitively) forty-two or forty two.

    if answer.strip() == "42":
        print("Yes")

    elif answer.lower().strip() == "forty two":
        print("Yes")

    elif answer.lower().strip() == "forty-two":
        print("Yes")

    else:
        print("No")

main()
