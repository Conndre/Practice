def main():
    # Get user imput
    text = input("Input: ")

    # Print the new word without vowels
    print("Output: " + shorten(text))

def shorten(word):
    output = ""
    vowels = ["a", "e", "i", "o", "u"]
    # loop through each letter
    for letter in word:
        if not letter.lower() in vowels:
            output += letter
    # Return the output (new word withouth vowels)
    return output



if __name__ == "__main__":
    main()

