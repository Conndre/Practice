months =[
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
]

while True:
    # Get input from user
    user_date = input("Date: ").strip()

    try:
        # Use split()
        month,day,year = user_date.split("/")
        # Convert to integers
        day = int(day)
        month = int(month)
        year = int(year)

        # Check numbers for months and days
        if 1 <= int(day) <=31 and 1 <= int(month) <= 12:
            print(f"{year}-{month:02}-{day:02}")
            break
    except:
        try:
            if "," in user_date:
                 month,day,year = user_date.split(" ")
                 # Remove comma
                 day = day.replace(",", "")

                 # Convert to integers
                 year = int(year)
                 day = int(day)
                 month = month.capitalize()
                 
                 # Check if month exist in list
                 if month in months and (1<= day <=31):
                    month = months.index(month)
                    month +=1
                    print(f"{year}-{month:02}-{day:02}")
                    break
        except:
            pass









