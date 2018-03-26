#include <stdio.h>

int main()
{
    int a, b;
    scanf("%d %d", &a, &b);

    if (a > b)
    {
        int c = a;
        a = b;
        b = c;
    }

    for (int i = a; i <= b; i++)
    {
        printf("%d\n", i);
    }
}
