/*
 * Matrix transposition with and without blocking.
 *
 * Intel® Core™ i5-6600 CPU @ 3.30GHz
 *
 * $ ./transpose -n 4096 -v 0
 * Time elapsed: 21.528841 seconds.
 * $ ./transpose -n 4096 -v 1
 * Time elapsed: 5.251710 seconds.
 */
#include "common.h"
#include "test.h"

/* You can modify following definitions to try out different settings. */
#define T int
static int BLOCK = 64;

static void fill(T *dst, int n)
{
  for (int i = 0; i < n; i++)
    for (int j = 0; j < n; j++)
      dst[i * n + j] = i * n + j;
}

static __noinline void transpose1(T *dst, T *src, int n)
{
  for (int i = 0; i < n; i++)
    for (int j = 0; j < n; j++)
      dst[j * n + i] = src[i * n + j];
}

static __noinline void transpose2(T *dst, T *src, int n)
{
  for (int i = 0; i < n; i += BLOCK)
    for (int j = 0; j < n; j += BLOCK)
      //B x B
      for (int i1 = i; i1 < i + BLOCK; i1++)
        for (int j1 = j; j1 < j + BLOCK; j1++)
          dst[j1 * n + i1] = src[i1 * n + j1];
}

int main(int argc, char **argv)
{
  int opt, variant = -1, n = 0;
  bool err = false, special = false;

  while ((opt = getopt(argc, argv, "n:v:s")) != -1)
  {
    if (opt == 'n')
      n = atoi(optarg);
    else if (opt == 'v')
      variant = atoi(optarg);
    else if (opt == 's')
      special = true;
    else
      err = true;
  }

  if (err || n == 0 || variant < 0 || variant >= 2)
    fail("Usage: %s -n size -v variant -b block size\n", argv[0]);

  if (n % BLOCK)
    fail("Matrix size (%d) must be divisible by %d!", n, BLOCK);

  size_t size = n * n * sizeof(T);
  T *src = malloc_page_aligned(size);
  T *dst = malloc_page_aligned(size);

  //printf("Generate matrix %d x %d (%ld KiB)\n", n, n, size >> 10);

  fill(src, n);
  bzero(dst, size);
  flush_cache();

  //printf("Performing matrix transposition.\n");
  _timer_t timer, average;
  if (special && variant == 1)
  {
    printf("MatrixSize V0 ");
    for (int i = 2; i <= MAX_BLOCK; i *= 2)
    {
      printf("B%d ", i);
    }
    printf("\n");

    for (int j = MAX_BLOCK; j <= n; j += MAX_BLOCK)
    {
      printf("%d ", j);
      for (BLOCK = 0; BLOCK <= MAX_BLOCK; BLOCK *= 2)
      {
        if (BLOCK == 0)
          transpose1(dst, src, j);
        else
          transpose2(dst, src, j);
          timer_reset(&average);

        for (int k = 0; k < TEST_LOOPS; k++)
        {
          timer_prepareAndStart(&timer);

          if (BLOCK == 0)
            transpose1(dst, src, j);
          else
            transpose2(dst, src, j);

          timer_stop(&timer);
          timer_add(&average, &timer);
        }
        BLOCK = (BLOCK == 0) ? 1 : BLOCK;
        timer_div(&average, TEST_LOOPS);
        timer_clearPrint(&average);
      }
      printf("\n");
    }
  }
  else
  {
    timer_prepareAndStart(&timer);
    if (variant == 0)
      transpose1(dst, src, n);
    if (variant == 1)
      transpose2(dst, src, n);
    timer_stop(&timer);
    timer_clearPrintnl(&timer);
  }

  free(src);
  free(dst);

  return 0;
}
