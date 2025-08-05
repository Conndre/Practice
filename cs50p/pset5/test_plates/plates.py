def main():
    plate = input("Plate: ")
    if is_valid(plate):
        print("Valid")
    else:
        print("Invalid")


def is_valid(s):
    # 2 characters maximum and 6 characters minimum
    if len(s) > 6 or len(s) < 2:
        return False
    else:
        # must start with at least 2 letters
        if not (s[0].isalpha() and s[1].isalpha()):
            return False

    # must be a number or a letter and first number not a 0
    for i in range(len(s)):
        if s[i].isalnum():
            if s[i].isnumeric():
                if s[i:].isnumeric() and int(s[i]) != 0:
                    return True
                else:
                    return False
        # If neither a number nor letter, return False
        else:
            return False

    return True


if __name__ == "__main__":
    main()
