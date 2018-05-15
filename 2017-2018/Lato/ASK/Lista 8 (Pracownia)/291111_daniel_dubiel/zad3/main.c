#include <stdio.h>
#include <stdlib.h>

void insert_sort(long *, long *);

int main(int num, char *v[])
{
    if (num == 1)
        return EXIT_FAILURE;

    long tab[num - 1];
    for (int i = 0; i < num - 1; i++)
    {
        tab[i] = atol(v[i + 1]);
    }

    insert_sort(tab, &tab[num - 2]);

    for (int i = 0; i < num - 2; i++)
    {
        printf("%ld, ", tab[i]);
    }
    printf("%ld\n", tab[num - 2]);
}