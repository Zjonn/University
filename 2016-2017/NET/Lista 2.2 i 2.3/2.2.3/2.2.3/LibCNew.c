#include <stdio.h>
__declspec(dllexport) int ExecuteC(int num, int (*fun)(int)) {
	return (*fun)(num);
}
