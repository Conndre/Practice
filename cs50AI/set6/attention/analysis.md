# Analysis

# Background

### Layer:

    Transformer models are organized into multiple layers, each with its own set of parameters.
    Each layer processes information in turn, refining representations of words in the context of the sentence.
    Lower layers tend to capture local relationships (such as words that are close to each other),
    while higher layers capture more global relationships (such as the relationship between distant words in the sentence)

### Head:

    Within each layer, there are multiple attention "heads".
    Each attention head performs a different calculation on how the words in the sentence should interact with each other.
    These heads allow the model to capture different aspects of the context and relationships between words.


## Layer 1, Head 4

- In the initial layers, attention seems to be more dispersed and focuses on single words.
- This head tends to focus on the key words of the sentence.
- There is a  high attention on words like “picked” and “up”

Example Sentences:
- Then I picked up a [MASK] from the table.


## Layer 3, Head 10

- This head shows the moment where begins a deeper understanding of the context of sentences
- The image shows a perfect diagonal with ten white attention cells and
- each cell connects a word to the next in the correct position.
- e.g: The first white cell for "then" and "I" , a second one for  "I" and "picked"
and so on, in the right order, with all the sentence´s words.

Example Sentences:
- Then I picked up a [MASK] from the table.


## Layer 12, Head 3

As we move to higher layers, attention becomes more specific and focuses on more complex relationships between words.
This head shows a high attention cell between the MASK token and the period.

Example Sentences:

Then I picked up a [MASK] from the table.
    Then I picked up a book from the table.
    Then I picked up a bottle from the table.
    Then I picked up a plate from the table.




