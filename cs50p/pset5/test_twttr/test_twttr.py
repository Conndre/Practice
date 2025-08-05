from twttr import shorten

def main():
    test_twttr()


def test_twttr():
    # Test for: upper and lower cases, numbers and Punctuation marks.
    assert shorten("twitter") == "twttr"
    assert shorten("TWITTER") == "TWTTR"
    assert shorten("TwitteR") == "TwttR"
    assert shorten("1234") == "1234"
    assert shorten(".?!,") == ".?!,"



if __name__ == "__main__":
    main()

