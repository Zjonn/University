// dllmain.h : Declaration of module class.

class CNetModule : public ATL::CAtlDllModuleT< CNetModule >
{
public :
	DECLARE_LIBID(LIBID_NetLib)
	DECLARE_REGISTRY_APPID_RESOURCEID(IDR_NET, "{B6CF0B97-2ECC-47A6-A9BB-3772F394831C}")
};

extern class CNetModule _AtlModule;
