#include <stdio.h>

struct A
{
    int i;
    int c;
    long double a;
    
};

int main()
{
    double tab[] = {1, 2, 3, 4, 5};
    struct A tab2[2];

    printf("%lu", sizeof(tab2));
}