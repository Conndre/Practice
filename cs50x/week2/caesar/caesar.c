#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>

int main(int argc, string argv[])
{
    // Check for just one command-line argument
    if (argc != 2)
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }
    // Check if each char in argv[1] is not digit
    int arg_length = strlen(argv[1]);
    for (int i = 0; i < arg_length; i++)
    {
        if (!isdigit(argv[1][i]))
        {
            printf("Usage: ./caesar key");
            return 1;
        }
    }

    // Convert string to integer
    int key = atoi(argv[1]);

    // Prompt user for plaintext
    string plaintext = get_string("plaintext: ");
    printf("ciphertext: ");

    // Check the length of plaintext and iterate
    int plaintext_length = strlen(plaintext);
    for (int i = 0; i < plaintext_length; i++)
    {
        if (isupper(plaintext[i]))
        {
            char upper_ciphertext = ((plaintext[i] - 65 + key) % 26) + 65;
            printf("%c", upper_ciphertext);
        }
        else if (islower(plaintext[i]))
        {
            char lower_ciphertext = (((plaintext[i] - 97) + key) % 26) + 97;
            printf("%c", lower_ciphertext);
        }
        else
        {
            printf("%c", plaintext[i]);
        }
    }

    printf("\n");
}
