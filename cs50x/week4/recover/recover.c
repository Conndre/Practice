#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef uint8_t BYTE;
int main(int argc, char *argv[])
{
    // Accept a single command-line argument
    if (argc != 2)
    {
        printf("Usage: ./recover FILE\n");
        return 1;
    }

    // Open the memory card
    FILE *card = fopen(argv[1], "r");
    if (card == NULL)
    {
        printf("Could not open %s.\n", argv[1]);
        return 1;
    }

    // Create a buffer for a block of data
    int counter = 0;
    BYTE buffer[512];
    char filename[8];
    FILE *img;

    // While there's still data left to read from the memory card
    while (fread(&buffer, sizeof(buffer), 1, card))
    {
        // If the file is jpeg
        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff &&
            (buffer[3] & 0xf0) == 0xe0)
        {
            // If it´s the first image
            if (counter == 0)
            {
                sprintf(filename, "%03i.jpg", counter);
                // Open the image to write
                img = fopen(filename, "w");
                // Write the image
                fwrite(&buffer, sizeof(buffer), 1, img);
                counter++;
            }
            else if (counter > 0)
            {
                // Close the previous image
                fclose(img);

                sprintf(filename, "%03i.jpg", counter);
                img = fopen(filename, "w");
                fwrite(&buffer, sizeof(buffer), 1, img);

                counter++;
            }
        }
        else if (counter > 0)
        {
            fwrite(&buffer, sizeof(buffer), 1, img);
        }
    }

    fclose(card);
    fclose(img);
}
