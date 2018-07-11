#include "test.h"

#define SECOND 1000000000

void timer_add(_timer_t *t, _timer_t *add)
{
    if (t->sum.tv_nsec + add->sum.tv_nsec >= SECOND)
    {
        t->sum.tv_sec = t->sum.tv_sec + add->sum.tv_sec + 1;
        t->sum.tv_nsec = t->sum.tv_nsec + add->sum.tv_nsec - SECOND;
    }
    else
    {
        t->sum.tv_sec = t->sum.tv_sec + add->sum.tv_sec;
        t->sum.tv_nsec = t->sum.tv_nsec + add->sum.tv_nsec;
    }
}

void timer_div(_timer_t *t, int v)
{
    long sec = t->sum.tv_sec, nano = t->sum.tv_nsec;

    sec = sec * SECOND / v;
    nano = nano / v + sec % SECOND;
    sec /= SECOND;
    if (nano >= SECOND)
    {
        sec += 1;
        nano -= SECOND;
    }

    t->sum.tv_sec = sec;
    t->sum.tv_nsec = nano;
}

void timer_clearPrint(_timer_t *t)
{
    printf("%ld,%04ld ", t->sum.tv_sec,
           t->sum.tv_nsec / 1000);
}

void timer_clearPrintnl(_timer_t *t)
{
    printf("%ld,%04ld\n", t->sum.tv_sec,
           t->sum.tv_nsec / 1000);
}

void timer_prepareAndStart(_timer_t *t)
{
    timer_reset(t);
    timer_start(t);
}