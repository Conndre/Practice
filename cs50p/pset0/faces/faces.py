# Define the main function
def main():
    # Ask user for input
    user_input = input("Please enter some text: ")

    # Call Convert function
    user_input = convert(user_input)

    # Print the result
    print(user_input)

# Implement a function called convert
def convert(text):
    text = text.replace(":)", "🙂").replace(":(", "🙁")
    return text

# Call the main  function
main()
