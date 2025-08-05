import re
import sys

def main():
    print(parse(input("HTML: ")))


def parse(s):
    link =  re.search(r'.+src="https?://(?:www\.)?youtube\.com/embed/([a-z0-9A-Z]+)"', s)
    if link:
        return "https://youtu.be/" + link.group(1)


if __name__ == "__main__":
    main()
