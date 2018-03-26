// Prime.cpp : Implementation of CPrime

#include "stdafx.h"
#include "Prime.h"


// CPrime



STDMETHODIMP CPrime::Prime(int x, int* ret)
{
	*ret = 1;
	if (x < 2)*ret = 0;
	for (int i = 2; i < x; i++) {
		if (x%i == 0)*ret = 0;
	}
	
	return S_OK;
}

