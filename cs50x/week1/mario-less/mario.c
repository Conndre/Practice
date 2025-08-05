#include <cs50.h>
#include <stdio.h>

void print_pyramid(int height);

int main(void)
{
    // Prompt the user for the pyramid's height
    int height;
    do
    {
        height = get_int("Height: ");
    }
    while (height <= 0 || height > 8);
    print_pyramid(height);
}

void print_pyramid(int height)
{
	for (int i = 1; i <= height; i++)
   {
		for (int j = 1; j <= height; j++)
		{
			if (i + j >= height + 1)
				printf("#");
			else
				printf(" ");
		}
		printf("\n");
	}
}
