import sys
from pyfiglet import Figlet

figlet = Figlet()

if len(sys.argv) == 1:
    is_font = True

elif len(sys.argv) == 3 and (sys.argv[1] == "-f" or sys.argv[1] == "--font"):
    is_font = False

else:
    sys.exit(1)
print(is_font)

# Get a list of available fonts
figlet.getFonts()
# Set the fonts
if is_font == False:
    try:
        figlet.setFont(font=sys.argv[2])

    except:
        print("Invalid usage")
        sys.exit(1)

# Get an user text
text = input("Input: ")
# Print output
print("Output", "\n", figlet.renderText(text))



