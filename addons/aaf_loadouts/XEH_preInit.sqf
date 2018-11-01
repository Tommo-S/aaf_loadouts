
aaf_fnc_LoadoutsModule_Module = compile preprocessFileLineNumbers '\aaf_loadouts\addons\aaf_loadouts\functions\LoadoutsModule_Module.sqf';
aaf_fnc_LoadoutsModule_Modifier = compile preprocessFileLineNumbers '\aaf_loadouts\addons\aaf_loadouts\functions\LoadoutsModule_Modifier.sqf';
aaf_fnc_LoadoutsModule_SetLoadout = compile preprocessFileLineNumbers '\aaf_loadouts\addons\aaf_loadouts\functions\LoadoutsModule_SetLoadout.sqf';
aaf_fnc_RoleSelectModule_Module = compile preprocessFileLineNumbers '\aaf_loadouts\addons\aaf_loadouts\functions\RoleSelectModule_Module.sqf';
aaf_fnc_loadoutsInit = compile preprocessFileLineNumbers '\aaf_loadouts\addons\aaf_loadouts\functions\loadoutsInit.sqf';
aaf_fnc_serverHandleLoadoutsChange = compile preprocessFileLineNumbers '\aaf_loadouts\addons\aaf_loadouts\functions\serverHandleLoadoutsChange.sqf';
aaf_fnc_addLoadoutsArsenal = compile preprocessFileLineNumbers '\aaf_loadouts\addons\aaf_loadouts\functions\addLoadoutsArsenal.sqf';
aaf_fnc_addLoadoutsArsenalModule = compile preprocessFileLineNumbers '\aaf_loadouts\addons\aaf_loadouts\functions\addLoadoutsArsenalModule.sqf';
aaf_fnc_updateLoadoutsArsenals = compile preprocessFileLineNumbers '\aaf_loadouts\addons\aaf_loadouts\functions\updateLoadoutsArsenals.sqf';
aaf_fnc_compileItemList = compile preprocessFileLineNumbers '\aaf_loadouts\addons\aaf_loadouts\functions\compileItemList.sqf';
aaf_fnc_arsenalLoadLoadoutEH = compile preprocessFileLineNumbers '\aaf_loadouts\addons\aaf_loadouts\functions\arsenalLoadLoadoutEH.sqf';
aaf_fnc_checkPBOLoaded = compile preprocessFileLineNumbers '\aaf_loadouts\addons\aaf_loadouts\functions\checkPBOLoaded.sqf';


#include "initSettings.sqf";

if aaf_loadouts_disable_postinit exitWith {
    diag_log "aaf_loadouts log: disabled via CBA options, exiting";
};

call aaf_fnc_loadoutsInit;
