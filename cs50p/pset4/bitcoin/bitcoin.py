import sys
import requests
import json

# Get value n from command-line
if len(sys.argv) == 2:
    try:
        value = float(sys.argv[1])
    except:
        print("Command-line argument is not a number")
        sys.exit(1)
else:
    print("Missing command-line argument ")
    sys.exit(1)

# Get the current cost of  Bitcoins
try:
   r = requests.get('https://api.github.com/events')
   response = r.json()
   bitcoin = response["bpi"]["USD"]["rate_float"]
   amount = bitcoin * value

   print(f"${amount:,.4f}")

except requests.RequestException:
    print("RequestException")
    sys.exit(1)
