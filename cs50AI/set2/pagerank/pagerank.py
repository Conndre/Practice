import os
import random
import re
import sys

DAMPING = 0.85
SAMPLES = 10000


def main():
    if len(sys.argv) != 2:
        sys.exit("Usage: python pagerank.py corpus")
    corpus = crawl(sys.argv[1])
    ranks = sample_pagerank(corpus, DAMPING, SAMPLES)
    print(f"PageRank Results from Sampling (n = {SAMPLES})")
    for page in sorted(ranks):
        print(f"  {page}: {ranks[page]:.4f}")
    ranks = iterate_pagerank(corpus, DAMPING)
    print(f"PageRank Results from Iteration")
    for page in sorted(ranks):
        print(f"  {page}: {ranks[page]:.4f}")


def crawl(directory):
    """
    Parse a directory of HTML pages and check for links to other pages.
    Return a dictionary where each key is a page, and values are
    a list of all other pages in the corpus that are linked to by the page.
    """
    pages = dict()

    # Extract all links from HTML files
    for filename in os.listdir(directory):
        if not filename.endswith(".html"):
            continue
        with open(os.path.join(directory, filename)) as f:
            contents = f.read()
            links = re.findall(r"<a\s+(?:[^>]*?)href=\"([^\"]*)\"", contents)
            pages[filename] = set(links) - {filename}

    # Only include links to other pages in the corpus
    for filename in pages:
        pages[filename] = set(
            link for link in pages[filename]
            if link in pages
        )

    return pages


# Ranks web pages (using damping factor)
def transition_model(corpus, page, damping_factor):
    """
    Return a probability distribution over which page to visit next,
    given a current page.

    With probability `damping_factor`, choose a link at random
    linked to by `page`. With probability `1 - damping_factor`, choose
    a link at random chosen from all pages in the corpus.
    """
    distribution = {}
    # number of links on page
    links = len(corpus[page])

    if links:
        for link in corpus:
            distribution[link] = (1 - damping_factor) / len(corpus)

        for link in corpus[page]:
            distribution[link] += damping_factor / links
    else:
        # Choose at random, all pages have same probability
        for link in corpus:
            distribution[link] = 1 / len(corpus)

    return distribution


def sample_pagerank(corpus, damping_factor, n):
    """
    Return PageRank values for each page by sampling `n` pages
    according to transition model, starting with a page at random.

    Return a dictionary where keys are page names, and values are
    their estimated PageRank value (a value between 0 and 1). All
    PageRank values should sum to 1.
    """

    # Get a dictionary with number of samples equal to 0
    # Initialize all pages to 0
    dict = corpus.copy()
    for i in dict:
        dict[i] = 0
    sample = None

    # PageRank  with sampling
    # keep track of how many times each page has been visited
    for _ in range(n):
        if sample:
            # Implement transition model (sum of all pageranks should add up to 1)
            model = transition_model(corpus, sample, damping_factor)
            sample = random.choices(list(model.keys()), list(model.values()), k=1)[0]
        else:
            sample = random.choice(list(corpus.keys()))

        # Count samples
        dict[sample] += 1

    # Iterate
    for p in dict:
        dict[p] = dict[p] / n

    return dict


def iterate_pagerank(corpus, damping_factor):
    """
    Return PageRank values for each page by iteratively updating
    PageRank values until convergence.

    Return a dictionary where keys are page names, and values are
    their estimated PageRank value (a value between 0 and 1). All
    PageRank values should sum to 1.
    """
    n = len(corpus)
    pagerank = {}
    new_pagerank = {}

    # The iterative PageRank implementation
    # Assign for each page a rank of 1/n
    for page in corpus:
        pagerank[page] = 1 / n

    # Calculate new rank values
    while True:
        for page in corpus:
            total = 0
            for link_page in corpus:
                # If page has links
                if page in corpus[link_page]:
                    total += (pagerank[link_page] / len(corpus[link_page]))

                # If no links
                if len(corpus[link_page]) == 0:
                    total += (pagerank[link_page]) / n

            total *= damping_factor
            total += (1 - damping_factor) / n

            new_pagerank[page] = total

        converged = True
        for p in pagerank:
            diff = abs(new_pagerank[p] - pagerank[p])
            if diff >= 0.001:
                converged = False
                break

        if converged == True:
            break
        else:
            pagerank = new_pagerank.copy()

    return new_pagerank


if __name__ == "__main__":
    main()
