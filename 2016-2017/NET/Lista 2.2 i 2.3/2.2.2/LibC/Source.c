#include <stdio.h>


__declspec(dllexport) int isPrimeC(int num)
{
	for (int i = 2; i*i <= num; i++) {
		if (num%i == 0)return 0;
	}return 1;
}
