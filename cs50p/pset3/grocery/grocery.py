# Create a dictionary
grocery = {}
                    
while True:
    try:
        # Get user input
        item = input().lower()
            if item in grocery:
                grocery[item] += 1
        else:
            grocery[item] = 1

        # Print items in alfabetical order

    except EOFError:
        for key in sorted(grocery.keys()):
            print(grocery[key], key.upper())
        # Stop the while loop
        break
