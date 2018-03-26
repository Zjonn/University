// Prime.h : Declaration of the CPrime

#pragma once
#include "Net_i.h"
#include "resource.h"       // main symbols
#include <comsvcs.h>

using namespace ATL;



// CPrime

class ATL_NO_VTABLE CPrime :
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CPrime, &CLSID_Prime>,
	public IDispatchImpl<IPrime, &IID_IPrime, &LIBID_NetLib, /*wMajor =*/ 1, /*wMinor =*/ 0>
{
public:
	CPrime()
	{
	}

	DECLARE_PROTECT_FINAL_CONSTRUCT()

	HRESULT FinalConstruct()
	{
		return S_OK;
	}

	void FinalRelease()
	{
	}

DECLARE_REGISTRY_RESOURCEID(IDR_PRIME)

DECLARE_NOT_AGGREGATABLE(CPrime)

BEGIN_COM_MAP(CPrime)
	COM_INTERFACE_ENTRY(IPrime)
	COM_INTERFACE_ENTRY(IDispatch)
END_COM_MAP()




// IPrime
public:
	STDMETHOD(Prime)(int x, int* ret);
};

OBJECT_ENTRY_AUTO(__uuidof(Prime), CPrime)
