class CfgPatches
{
	class aaf_loadouts
	{
		name = "AAF Loadouts";
		author = "Tommo";
		requiredVersion = 1.84;
		requiredAddons[] = {"cba_main"};
		units[] = {};
		weapons[] = {};
	};
};

class Extended_PreInit_EventHandlers {
    class aaf_loadouts_preInit {
        init = "call compile preprocessFileLineNumbers '\aaf_loadouts\addons\aaf_loadouts\XEH_preInit.sqf'";
    };
};


class Extended_PostInit_EventHandlers {
	class aaf_loadouts_postInit {
		init = "call compile preprocessFileLineNumbers '\aaf_loadouts\addons\aaf_loadouts\XEH_postInit.sqf'";
	};
};


/*
class CfgFunctions
{
	class AAF_L
	{
		class Functions
		{
			tag = "AAF";
			class AAF_Init {
				file = "\aaf_functions\functions\AAF_Init.sqf";
				postInit = 1;
			};
		};
	};
};
*/