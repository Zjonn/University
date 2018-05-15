#include <stdio.h>
#include <stdlib.h>

extern unsigned mulf(unsigned, unsigned);
//#bashrc
int main(int num, char *v[]) {
  if (num != 3)
    return EXIT_FAILURE;

  float a = atof(v[1]);
  float b = atof(v[2]);
  printf("%f %f \n", a, b);
  unsigned c = mulf(*(unsigned *)&a, *(unsigned *)&b);
  printf("%f\n", *(float *)&c);
  printf("0x%08x 0x%08x 0x%08x\n", *(unsigned *)&a, *(unsigned *)&b, c);
}