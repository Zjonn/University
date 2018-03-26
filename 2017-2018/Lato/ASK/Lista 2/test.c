#include <stdio.h>
#include <limits.h>

#define MULT(x)(((x) << 1) + (x))
typedef unsigned int uint;

int main(){
    int a = 0;
    int x = -15,y = 2000;
    //printf("%d %d\n%lu\n",a | -a, -a,sizeof(int));
    //printf("%d %d %d\n",x * ~y, (unsigned int)y * (unsigned int)x,x * ~y + (unsigned int)y * (unsigned int)x);
    //printf("%d\n%d",x + y == (unsigned int)x + (unsigned int)y, x * ~y + (unsigned int)y * (unsigned int)x == -x);
    printf("%d\n", MULT(x>>2) + (MULT(x & 3) >> 2) );
}