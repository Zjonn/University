#include <stdio.h>
#include <stdlib.h>

unsigned long fibonacci(unsigned long);

int main(int num, char *v[])
{
    if (num != 2)
        return EXIT_FAILURE;

    printf("%lu\n", fibonacci(atol(v[1])));
}