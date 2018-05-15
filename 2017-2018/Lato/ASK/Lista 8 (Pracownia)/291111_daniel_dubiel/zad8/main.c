#include <stdio.h>
#include <stdlib.h>

double approx_sqrt(double, double);

int main(int num, char *v[]) {
  if (num != 3)
    return EXIT_FAILURE;

  double x = atof(v[1]);
  double eps = atof(v[2]);
  printf("%f\n", approx_sqrt(x, eps));
}