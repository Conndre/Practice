def main():
    # Ask user for input
    expression = input("Expression: ")

    # Convert it into variables
    x, y, z = expression.split(" ")

    # Change variables to float
    x = float(x)
    z = float(z)

    # Calculate the result
    if y == "+":
        result = (x + z)
    if y == "-":
        result = (x - z)
    if y == "*":
        result = (x * z)
    if y == "/":
        result = (x / z)

    # Print the result
    print(round(result, 1))

main()
