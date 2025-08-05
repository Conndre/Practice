import pytest
from fuel import convert, gauge

def main():

    test_correct_input()
    test_value_error()
    test_zerodivision()

def test_correct_input():
    assert convert('1/2') == 50 and gauge(50) == "50%"
    assert convert('1/100')== 1 and gauge(1) == "E"
    assert convert('99/100')== 99 and gauge(99) == "F"


def test_zerodivision():
    with pytest.raises(ZeroDivisionError):
        convert("1/0")

def test_value_error():
    with pytest.raises(ValueError):
        convert("cat/dog")


if __name__ == "__main__":
    main()
