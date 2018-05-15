#include <stdio.h>
#include <stdlib.h>

typedef struct
{
  int dis_to_A;
  int prev_station;
  int cost;
} fuel_station;

typedef struct
{
  long cost;
  int how_long_cheapest;
} pair;

void readNum(int *);

int main()
{
  // n = ilosc stacji
  // l = droga z A -> B
  // b = pojemnosc baku
  int n, l, b;
  scanf("%d %d %d", &n, &l, &b);

  fuel_station stations[n + 2];
  pair que[n + 2];
  int beg = 0, end = 1;

  stations[0].prev_station = 0;
  stations[0].dis_to_A = 0;
  stations[0].cost = 0;

  que[0].cost = 0;
  que[0].how_long_cheapest = 1;

  int dis_to_A = 0;
  int id = 0;

  for (int i = 1; i < n + 2; i++, end++)
  {
    if (i < n + 1)
    {
      readNum(&stations[i].dis_to_A);
      readNum(&stations[i].cost);
    }
    else
    {
      stations[i].dis_to_A = l;
      stations[i].cost = 0;
    }

    if (stations[i].dis_to_A - stations[i - 1].dis_to_A > b)
    {
      printf("NIE\n");
      return 0;
    }
/////////////////////////////////////////////////////////////
    for (; 1; ++id)
    {
      if (stations[i].dis_to_A - stations[id].dis_to_A <= b){
        ++id;
        break;}
    }
    stations[i].prev_station = --id;

    for (int val = stations[i].prev_station - stations[i - 1].prev_station;
         val > 0; ++beg)
    {
      if (val >= que[beg].how_long_cheapest)
        val -= que[beg].how_long_cheapest;
      else
      {
        que[beg].how_long_cheapest -= val;
        break;
      }
    }

    long new_cost = stations[i].cost + que[beg].cost;

    int j = 1;
    for (; new_cost < que[end - 1].cost; ++j, --end)
      ;

    que[end].cost = new_cost;
    que[end].how_long_cheapest = j;
  }

  if ((l - stations[n + 1].dis_to_A) > b)
  {
    printf("NIE\n");
  }
  else
    printf("%ld\n", que[end - 1].cost);
}

void readNum(int *number)
{
  register int c = getchar();
  *number = 0;

  while (c <= 47 || c >= 58)
    c = getchar();

  for (; (c > 47 && c < 58); c = getchar())
    *number = *number * 10 + c - '0';
}
