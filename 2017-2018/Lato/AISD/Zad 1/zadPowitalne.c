/*
Daniel Dubiel 
291111
LJE
*/
#include <stdio.h>

int main()
{
    long a, b, i;
    scanf("%ld %ld", &a, &b);

    i = (a % 2018);
    i = (i)? a - i + 2018 : a;

    for (i; i <= b; i += 2018)
    {
        printf("%ld ", i);
    }
}
