
def main():
    # Get user input
    greeting = input("Greetings: ")
    greeting = greeting.lower().strip()

    # Print the result
    print("$" + str(value(greeting)))

def value(greeting):

    if "hello" in greeting:
        return 0

    elif "h" == greeting[0]:
        return 20

    else:
        return 100





if __name__ == "__main__":
    main()
