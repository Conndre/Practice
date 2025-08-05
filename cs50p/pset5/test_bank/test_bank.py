from bank import value

def main():
   test_greetings()

def test_greetings():
    # Test return 0
    assert value("HELLO WORLD") == 0
    assert value("hellow world") == 0

    # Test return 20
    assert value("hi world") == 20
    assert value("HI WORLD") == 20

    # Test return 100
    assert value("What's happening") == 100
    assert value("WHAT'S HAPPENING") == 100



if __name__ == "__main__":
    main()
