#include <stdio.h>
#include <stdlib.h>

int clz(long);

int main(int num, char *v[])
{
    if (num != 2)
        return EXIT_FAILURE;

    printf("%d\n", clz(atol(v[1])));
}