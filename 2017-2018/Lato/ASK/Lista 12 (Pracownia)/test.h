#include "common.h"

#define MAX_BLOCK 128
#define TEST_LOOPS 4

void timer_add(_timer_t *t, _timer_t *add);
void timer_div(_timer_t *t, int v);
void timer_clearPrint(_timer_t *t);
void timer_clearPrintnl(_timer_t *t);
void timer_prepareAndStart(_timer_t *t);