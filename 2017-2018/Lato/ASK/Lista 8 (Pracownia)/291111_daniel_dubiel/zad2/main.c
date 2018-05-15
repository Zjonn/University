#include <stdio.h>
#include <stdlib.h>

typedef struct
{
    unsigned long lcm, gcd;
} result_t;

result_t lcm_gcd(unsigned long, unsigned long);

int main(int num, char *v[])
{
    if (num != 3)
        return EXIT_FAILURE;
    result_t res = lcm_gcd(atol(v[1]), atol(v[2]));
    printf("%lu %lu\n", res.gcd, res.lcm);
}