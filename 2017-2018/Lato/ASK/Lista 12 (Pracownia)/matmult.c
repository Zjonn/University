/*
 * Matrix multiplication with and without blocking.
 *
 * Intel® Core™ i5-6600 CPU @ 3.30GHz
 *
 * $ ./matmult -n 1024 -v 0
 * Time elapsed: 3.052755 seconds.
 * $ ./matmult -n 1024 -v 1
 * Time elapsed: 0.746337 seconds.
 * $ ./matmult -n 1024 -v 2
 * Time elapsed: 9.882309 seconds.
 * $ ./matmult -n 1024 -v 3
 * Time elapsed: 0.698795 seconds.
 */
#include "common.h"
#include "test.h"

/* You can modify following definitions to try out different settings. */
#define T double

/* Break matrices start alignment with following offsets: */
static int A_OFFSET = NITEMS(BLOCK_SIZE * 0, T);
static int B_OFFSET = NITEMS(BLOCK_SIZE * 1, T);
static int C_OFFSET = NITEMS(BLOCK_SIZE * 2, T);

/* Useful macro for accessing row-major 2D arrays of size n×n. */
#define M(a, i, j) a[(i)*n + (j)]

//#define BLOCK 16
static int BLOCK = 16;

static void printBlockTimes(int n, T *a, T *b, T *c);
static void printFuncTimes(int n, T *a, T *b, T *c);
static void printOffsetTimes(int n, T *a, T *b, T *c);

static void fill(T *dst, int size)
{
  for (int i = 0; i < size; i++)
    dst[i] = 1;
}

/* ijk (& jik) */
static __noinline void multiply0(int n, T *a, T *b, T *c)
{
  int i, j, k, sum;
  for (i = 0; i < n; i++)
  {
    for (j = 0; j < n; j++)
    {
      sum = 0.0;
      for (k = 0; k < n; k++)
        sum += M(a, i, k) * M(b, k, j);
      M(c, i, j) = sum;
    }
  }
}

/* kij (& ikj) */
static __noinline void multiply1(int n, T *a, T *b, T *c)
{
  int i, j, k, r;
  for (k = 0; k < n; k++)
  {
    for (i = 0; i < n; i++)
    {
      r = M(a, i, k);
      for (j = 0; j < n; j++)
        M(c, i, j) += r * M(b, k, j);
    }
  }
}

/* jki (& kji) */
static __noinline void multiply2(int n, T *a, T *b, T *c)
{
  int i, j, k, r;
  for (j = 0; j < n; j++)
  {
    for (k = 0; k < n; k++)
    {
      r = M(b, k, j);
      for (i = 0; i < n; i++)
        M(c, i, j) += M(a, i, k) * r;
    }
  }
}

/* BLOCK*BLOCK tiled version */
static __noinline void multiply3(int n, T *a, T *b, T *c)
{
  int i, j, k;
  int i1, j1, k1;
  for (i = 0; i < n; i += BLOCK)
    for (j = 0; j < n; j += BLOCK)
      for (k = 0; k < n; k += BLOCK)
        for (i1 = i; i1 < i + BLOCK; i1++)
          for (j1 = j; j1 < j + BLOCK; j1++)
            for (k1 = k; k1 < k + BLOCK; k1++)
              M(c, i1, j1) += M(a, i1, k1) * M(b, k1, j1);
}

typedef void (*matmult_t)(int n, T *a, T *b, T *c);

static matmult_t multiply[4] = {multiply0, multiply1, multiply2, multiply3};
static int offsets[5][3] = {{0, 0, 0}, {0, 1, 2}, {0, 4, 8}, {0, 1, 3}, {0, 8, 16}};

int main(int argc, char **argv)
{
  int opt, variant = -1, n = 0;
  bool err = false, special = false;

  while ((opt = getopt(argc, argv, "n:v:b:s")) != -1)
  {
    if (opt == 'n')
      n = atoi(optarg);
    else if (opt == 'v')
      variant = atoi(optarg);
    else if (opt == 's')
      special = true;
    else if (opt == 'b')
      BLOCK = atoi(optarg);
    else
      err = true;
  }

  if (err || n == 0 || variant < 0 || BLOCK < 2 || variant >= 4)
    fail("Usage: %s -n size -v variant -b blockSize\n", argv[0]);

  if (n % BLOCK && n % MAX_BLOCK)
    fail("Matrix size (%d) must be divisible by %d!", n, BLOCK);

  size_t size = n * n * sizeof(T);
  size_t pagesize = getpagesize();

  /* Allocate space for each matrix plus extra space (of page size). */
  T *a = malloc_page_aligned(size + pagesize);
  T *b = malloc_page_aligned(size + pagesize);
  T *c = malloc_page_aligned(size + pagesize);

  //printf("Generate 2 matrices %d x %d (%ld KiB each)\n", n, n, size >> 10);

  fill(a, n * n + NITEMS(pagesize, T));
  fill(b, n * n + NITEMS(pagesize, T));
  bzero(c, size + pagesize);
  flush_cache();

  _timer_t timer, average;
  timer_reset(&average);
  //printf("Performing matrix multiplication.\n");
  if (variant == 3 && special)
  {
    printBlockTimes(n, a, b, c);
  }
  else if (variant == 2 && special)
  {
    printFuncTimes(n, a, b, c);
  }
  else if (variant == 1 && special)
  {
    printOffsetTimes(n, a, b, c);
  }
  else
  {
    timer_prepareAndStart(&timer);
    multiply[variant](n, a + A_OFFSET, b + B_OFFSET, c + C_OFFSET);
    timer_stop(&timer);
    timer_clearPrint(&timer);
  }

  free(a);
  free(b);
  free(c);

  return 0;
}
//variant 3
static void printBlockTimes(int n, T *a, T *b, T *c)
{
  _timer_t timer, average;

  printf("BlockSize time\n");
  for (BLOCK = 2; BLOCK <= MAX_BLOCK; BLOCK *= 2)
  {
    multiply[3](n, a + A_OFFSET, b + B_OFFSET, c + C_OFFSET);

    timer_reset(&average);

    printf("%d ", BLOCK);

    for (int j = 0; j < TEST_LOOPS; j++)
    {
      timer_prepareAndStart(&timer);
      multiply[3](n, a + A_OFFSET, b + B_OFFSET, c + C_OFFSET);
      timer_stop(&timer);
      timer_add(&average, &timer);
    }
    timer_div(&average, TEST_LOOPS);
    timer_clearPrintnl(&average);
  }
}
//variant 2
static void printFuncTimes(int n, T *a, T *b, T *c)
{
  _timer_t timer, average;
  printf("MatrixSize Fun0 Fun1 Fun2 Fun3\n");
  for (int i = MAX_BLOCK; i <= n; i += MAX_BLOCK)
  {
    printf("%d ", i);
    for (int v = 0; v < 4; v++)
    {
      multiply[v](i, a + A_OFFSET, b + B_OFFSET, c + C_OFFSET);

      timer_reset(&average);

      for (int j = 0; j < TEST_LOOPS; j++)
      {
        timer_prepareAndStart(&timer);
        multiply[v](i, a + A_OFFSET, b + B_OFFSET, c + C_OFFSET);
        timer_stop(&timer);
        timer_add(&average, &timer);
      }
      timer_div(&average, TEST_LOOPS);
      timer_clearPrint(&average);
    }
    printf("\n");
  }
}
//varinat 1
static void printOffsetTimes(int n, T *a, T *b, T *c)
{
  _timer_t timer, average;
  printf("BLOCK: %d\n", BLOCK);
  printf("MatrixSize O(0,0,0) O(0,1,2) O(0,4,8) O(0,1,3) O(0,8,16)\n");
  for (int k = MAX_BLOCK; k <= n; k += MAX_BLOCK)
  {
    printf("%d ", k);
    for (int i = 0; i < 5; i++)
    {
      A_OFFSET = NITEMS(BLOCK_SIZE * offsets[i][0], T);
      B_OFFSET = NITEMS(BLOCK_SIZE * offsets[i][1], T);
      C_OFFSET = NITEMS(BLOCK_SIZE * offsets[i][2], T);
      //skrajny wynik do odrzucenia
      multiply[3](k, a + A_OFFSET, b + B_OFFSET, c + C_OFFSET);

      timer_reset(&average);

      for (int j = 0; j < TEST_LOOPS; j++)
      {
        timer_prepareAndStart(&timer);
        multiply[3](k, a + A_OFFSET, b + B_OFFSET, c + C_OFFSET);
        timer_stop(&timer);
        timer_add(&average, &timer);
      }
      timer_div(&average, TEST_LOOPS);
      timer_clearPrint(&average);
    }
    printf("\n");
  }
}
