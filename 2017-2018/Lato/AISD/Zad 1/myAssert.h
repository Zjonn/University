#ifdef NDEBUG
#define assert(EXPRESSION) ((void)0)
#else
#define assert(EXPRESSION) ((EXPRESSION) ? (void)0 : _myassert(#EXPRESSION, __FILE__, __LINE__))
#endif

#include <stdio.h>


void _myassert(const char *expression, const char *file, int line)
{
    fprintf(stderr, "Assertion '%s' failed, file '%s' line '%d'.\n", expression, file, line);
}