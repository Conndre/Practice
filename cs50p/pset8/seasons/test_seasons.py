
import pytest
from seasons import convert_to_text


def test_convert_to_text():
    assert convert_to_text(365) == "Five hundred twenty-five thousand, six hundred minutes"
