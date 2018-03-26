#include <stdio.h>

#if 1
#include "myAssert.h"
#else
#define assert(e) ((void)0)
#endif

void test();
long long powR(long, long, long);

int main()
{
    long n, a, b, m;
    int i;

    test();   

    scanf("%d", &n);

    for (i = 0; i < n; i++)
    {
        scanf("%ld %ld %ld", &a, &b, &m);

        if (a == 0 || a == 1)
            printf("%ld\n", a);
        else
        {
            printf("%lld\n", powR(a, b, m));
        }
    }
}

void test(){
    assert(powR(9, 199, 10) == 8);
    assert(powR(95925179, 427342114, 1000000000) == 272569881);
}

long long powR(long a, long b, long m)
{
    long long w;
    if (b == 1)
    {
        return a;
    }

    w = powR(a, b / 2, m);
    w = (w * w) % m;

    if (b % 2)
    {
        w = (w * a) % m;
    }

    return w % m;
}