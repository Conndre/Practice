import random

def main():
    # Call function get_level()
    level = get_level()
    score = 0

    # Set a cycle of 10 random additions
    for i in range(10):
        # Call the function generate_integer(level)
        x,y = generate_integer(level)
        correct_answer = x + y
        tries = 0

        # The user have 3 tries for each addition
        # Check user answers with correct answers
        while tries < 3:
            try:
                user_answer = int(input(f"{x} + {y} = "))
                if user_answer == correct_answer:
                    score += 1
                    break
                else:
                    print("EEE")
                    tries += 1

            except ValueError:
                print("EEE")
                tries += 1
        # If the 3 tries are incorrect, print the correct answer
        if tries == 3:
            print(f"{x} + {y} = {correct_answer}")

    # Print the score
    print("Score:", score)



def get_level():
    while True:
        try:
            level = int(input("Level: "))
            if level in [1,2,3]:
                return level
        except ValueError:
            pass



def generate_integer(level):
    if level == 1:
        x = random.randint(0, 9)
        y = random.randint(0, 9)
    elif level == 2:
        x = random.randint(10, 99)
        y = random.randint(10, 99)
    elif level == 3:
        x = random.randint(100, 999)
        y = random.randint(100, 999)
    return x, y


if __name__ == "__main__":
    main()



