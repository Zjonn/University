#include <stdio.h>

void print(int[],int);

int main()
{
    int tab[] = {42, 44, 80}, i = 1;
    tab[i] = i++;
    print(tab,3);
}

void print(int tab[], int n)
{
    for (int i = 0; i < n; i++)
    {
        printf("%d ", tab[i]);
    }
    printf("\n");
}