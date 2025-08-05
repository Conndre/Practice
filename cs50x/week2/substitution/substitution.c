#include <cs50.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, string argv[])
{
    // Check number of argurments
    if (argc != 2)
    {
        printf("Usage: ./substitution key\n");
        return 1;
    }
    // Check string's lenght
    if (strlen(argv[1]) != 26)
    {
        printf("Key must contain 26 characters.\n");
        return 1;
    }
    // Check if all characters are letters
    for (int i = 0; i < strlen(argv[1]); i++)
    {
        if (isalpha(argv[1][i]) == false)
        {
            printf("Key must only contain alphabetic characters.\n");
            return 1;
        }
        // Check for repeated characters
        for (int j = i + 1; j < strlen(argv[1]) + 1; j++)
        {
            if ((argv[1][i]) == (argv[1][j]))
            {
                printf("Key must not contain repeated characters.\n");
                return 1;
            }
        }
    }
    // Prompt user for input
    string plaintext = get_string("Plaintext: ");
    printf("ciphertext: ");

    // Print the output and must preserve case
    for (int i = 0; i < strlen(plaintext); i++)
    {
        if (plaintext[i]>= 'A' && plaintext[i]<= 'Z')
        {
            char upper_cipher = (toupper(argv[1][plaintext[i] - 65]));
            printf("%c", upper_cipher);
        }
        else if (plaintext[i] >= 'a' && plaintext[i]<= 'z')
        {
            char lower_cipher = (tolower(argv[1][plaintext[i] - 97]));
            printf("%c", lower_cipher);
        }
        else if (isalpha(plaintext[i]) == false)
        {
            printf("%c", plaintext[i]);
        }
    }
    // After outputting ciphertext, print a newline.
    // Your program should then exit by returning 0 from main
    printf("\n");
}



