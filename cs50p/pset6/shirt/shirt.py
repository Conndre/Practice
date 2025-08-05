import sys
import os
from PIL import Image, ImageOps

# Check Command line arguments
if len(sys.argv) < 3:
    sys.exit("Too few command-line arguments")
elif len(sys.argv) > 3:
    sys.exit("Too many command-line arguments")
else:
    # Get extension of the arguments:
    file_input = os.path.splitext(sys.argv[1])
    file_output = os.path.splitext(sys.argv[2])

if file_input[1] == "":
    sys.exit("Invalid input")
elif file_output[1] == "":
    sys.exit("Invalid output")

elif file_input[1].lower() != file_output[1].lower():
    sys.exit("Input and output have different extensions")
else:
    try:
        user_image = Image.open(sys.argv[1])
    except FileNotFoundError:
        sys.exit("Input does not exist")

    # Open the shirt
    shirt = Image.open("shirt.png")
    # Size of the shirt
    size = shirt.size
    # Resize image to fit shirt
    user_image = ImageOps.fit(user_image, size)
    # Paste shirt in muppet
    user_image.paste(shirt, shirt)
    # Create output image
    user_image.save(sys.argv[2])






