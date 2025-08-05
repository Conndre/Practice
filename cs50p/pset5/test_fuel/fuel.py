def main():
    # Get an input
    fraction = input("Fraction: ")
    percentage = convert(fraction)

    # Print the output
    print(gauge(percentage))


def convert(fraction):
    while True:
        try:
            x, y = map(int, fraction.split('/'))
            return (x / y) * 100
        except (ValueError, ZeroDivisionError):
            raise


def gauge(percentage):
    if percentage >= 99:
        return "F"
    elif percentage <= 1:
        return "E"
    else:
      return str(round(percentage)) + "%"


if __name__ == "__main__":
    main()








