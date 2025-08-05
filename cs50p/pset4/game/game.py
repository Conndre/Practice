import random

# Get a level n from user
# if not a positive integer, the program should prompt again
while True:
    try:
        level = int(input("level: "))
        if level > 0:
            break
    except:
        pass

# Randomly generates an integer between 1 and level
random_integer = random.randint(1, level)

# Prompts the user to guess that integer and check it.
while True:
    try:
        guess = int(input("Guess: "))
        if guess > 0:
            if guess < random_integer:
                print("Too small!")

            elif guess > random_integer:
                print("Too large!")

            else:
                print("Just right!")
                break
    except:
        pass







