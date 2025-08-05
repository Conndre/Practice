// Implements a dictionary's functionality#include <stdbool.h>

#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>

#include "dictionary.h"

// Represents a node in a hash table
typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
} node;

// TODO: Choose number of buckets in hash table
const unsigned int N = 100000;

// Hash table
node *table[N];

// Words in the dictionary
unsigned int dictionaryWords = 0;

// Hash code from the word
unsigned int hashvalue = 0;

// Returns true if word is in dictionary, else false
bool check(const char *word)
{
    // TODO
    // Hash word to obtain hash value
    hashvalue = hash(word);
    // Point cursor to the first node
    node *cursor = table[hashvalue];
    // Go through the linked list
    while (cursor != NULL)
    {
        if (strcasecmp(cursor->word, word) == 0)
        {
            return true;
        }
        cursor = cursor->next;
    }
    return false;
}

// Hashes word to a number
unsigned int hash(const char *word)
{
    // TODO: Improve this hash function
    unsigned long total = 0;
    for (int i = 0; i < strlen(word); i++)
    {
        total += tolower(word[i]);
    }
    return total % N;
}

// Loads dictionary into memory, returning true if successful, else false
bool load(const char *dictionary)
{
    // TODO
    char word[LENGTH + 1];
    // Open dictionary files and read contents
    FILE *dic = fopen(dictionary, "r");
    if (dic != NULL)
    {
        while (fscanf(dic, "%s", word) != EOF)
        {
            node *n = malloc(sizeof(node));
            if (n != NULL)
            {
                hashvalue = hash(word);
                strcpy(n->word, word);
                n->next = table[hashvalue];
                table[hashvalue] = n;
                // free(n);
                dictionaryWords++;
            }
        }
        fclose(dic);
    }
    else
    {
        return false;
    }
    return true;
}

// Returns number of words in dictionary if loaded, else 0 if not yet loaded
unsigned int size(void)
{
    return dictionaryWords;
}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{
    // TODO
    // Iterate through buckets
    for (int i = 0; i < N; i++)
    {
        // Set cursor to the start
        node *cursor = table[i];

        // If coursor is not NULL, free memory
        while (cursor != NULL)
        {
            // Create temp
            node *tmp = cursor;
            // Move cursor to next node
            cursor = cursor->next;
            // Free up temp;
            free(tmp);
        }
    }
    return true;
}
