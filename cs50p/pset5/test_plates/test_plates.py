import plates
from plates import is_valid

def main():
    # Call Test Functions
    test_lenght()
    test_start_with_twoletters()
    test_numbers_at_theend()
    test_firstnumber_notzero()
    test_punctuation()



# Plates must have 2 characters maximum and 6 characters minimum (letters or numbers)
def test_lenght():
    assert is_valid("AA") == True
    assert is_valid("ABCDEF") == True
    assert is_valid("A") == False
    assert is_valid("ABCDEFG    ") == False

# Plates must start with at least 2 letters
def test_start_with_twoletters():
    assert is_valid("AA") == True
    assert is_valid("A3") == False
    assert is_valid("4A") == False
    assert is_valid("44") == False

# number must be at the end of plates (not in the middle)
def test_numbers_at_theend():
    assert is_valid("AAA222") == True
    assert is_valid("AAA22A") == False

# First number must not be a 0
def test_firstnumber_notzero():
    assert is_valid("AAA022") == False
    assert is_valid("AAA220") == True

# No puntuaction marks are allowed
def test_punctuation():
    assert is_valid("AA!?22") == False
    assert is_valid("AA.A 22") == False

if __name__ == "__main__":
    main()





