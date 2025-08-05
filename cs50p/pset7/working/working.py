import re

def main():
    print(convert(input("Hours: ")))


def convert(s):

    time_format = "(0?[1-9]|1[0-2]):?([0-5][0-9])? (AM|PM)"

    time = r"^" + time_format + " to " + time_format + "$"

    if matches := re.search(time, s):
        first_time = new_format(matches.group(1), matches.group(2), matches.group(3))
        Second_time = new_format(matches.group(4), matches.group(5), matches.group(6))
        return f"{first_time} to {Second_time}"
    else:
        raise ValueError

def new_format(hour, minute, am_pm):

    if hour == "12":
        if am_pm == "AM":
            hr = "00"
        else:
            hr = "12"
    else:
        if am_pm == "AM":
            hr = f"{int(hour):02}"
        else:
            hr = f"{int(hour) + 12}"
    if minute == None:
        min = "00"
    else:
        min = f"{int(minute):02}"

    return f"{hr}:{min}"


if __name__ == "__main__":
    main()
