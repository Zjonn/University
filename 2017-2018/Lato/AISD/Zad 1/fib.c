#include <stdio.h>

#if 0
#include "myAssert.h"
#define assertFib(X, M, Y) (assert(fib(X, M) == Y))
#else
#define assert(e) ((void)0)
#define assertFib(X, M, Y) ((void)0)
#endif

void tests();
int fib(int, int);
void fibM(int, int[], int);
void multMxM(int[4], int[4], int[4], int);
long long mult(long long, long long, long long, long long, int);

int main()
{
    int n, i, a, b;

    scanf("%d", &n);

    for (i = 0; i < n; i++)
    {
        scanf("%d %d", &a, &b);
        printf("%d\n", fib(a, b));
    }
}

void tests()
{
    assert(mult(2, 2, 5, 5, 100) == 29);
    assertFib(1, 10, 1);
    assertFib(2, 10, 1);
    assertFib(3, 10, 2);
    assertFib(4, 25, 3);
    assertFib(5, 25, 5);
    assertFib(6, 25, 8);
    assertFib(7, 27, 13);
    assertFib(8, 29, 21);
    assertFib(9, 31, 3);
    assertFib(10, 33, 22);
}

int fib(int n, int m)
{
    int tab[4];
    if (n == 0)
        return 0;
    if (n == 1 | n == 2)
        return 1;

    fibM(n, tab, m);
    return tab[1];
}

void fibM(int n, int result[], int m)
{
    int tab[4], tab1[4];

    if (n == 1)
    {
        result[0] = 1;
        result[1] = 1;
        result[2] = 1;
        result[3] = 0;
        return;
    }

    fibM(n / 2, tab, m);
    
    multMxM(tab, tab, tab1, m);
    
    if (n % 2)
    {
        int low[] = {1, 1, 1, 0};
        multMxM(tab1, low, result, m);
    }
    else
    {
        int i;
        for (i = 0; i < 4; i++)
            result[i] = tab1[i];
    }
}

void multMxM(int matrixA[4], int matrixB[4], int result[4], int m)
{
    result[0] = mult(matrixA[0], matrixB[0], matrixA[1], matrixB[2], m);
    result[1] = mult(matrixA[0], matrixB[1], matrixA[1], matrixB[3], m);
    result[2] = mult(matrixA[2], matrixB[0], matrixA[3], matrixB[2], m);
    result[3] = mult(matrixA[2], matrixB[1], matrixA[3], matrixB[3], m);
}

long long mult(long long a1, long long a2, long long b1, long long b2, int m)
{
    return ((a1 * a2) % m + (b1 * b2) % m) % m;
}