# create a dictionary menu
menu = {
    "Baja Taco": 4.25,
    "Burrito": 7.50,
    "Bowl": 8.50,
    "Nachos": 11.00,
    "Quesadilla": 8.50,
    "Super Burrito": 8.50,
    "Super Quesadilla": 9.50,
    "Taco": 3.00,
    "Tortilla Salad": 8.00
}

# Set the variable total to 0
total = 0
while True:
    try:
        # Get user input
        item = input("Item: ").strip().title()

        # loop in the dictionary (menu)

        if item in menu:
            total += menu[item]
            print("Total: $", end="")
            print("{:.2f}".format(total))


    except EOFError:
        # print a new line
        print()
        break



