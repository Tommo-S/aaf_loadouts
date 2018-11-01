/*
* Author: Tommo
* Description: Creates the Achilles custom dialog when the select faction module is dropped.
* Arguments:
* None
* Notes:
* Players default to Rifleman (1st loadout in faction) when they haven't been assigned a loadout.
* Must be spawned, requires scheduled environment.
* Example:
[] spawn aaf_fnc_LoadoutsModule_Module; 
*/

private _factions = [];
{
    _factions pushback (_x select 1);
} foreach aaf_loadouts_masterlist;

private _dialogResult =
[
    "Set Loadouts",
    [
        ["COMBOBOX",["Faction","Select Faction"], _factions, 0, false,[["LBSelChanged","FACTION"]]],
        ["COMBOBOX",["Camo", "Select Camo"], ["1","2","3"], 0, false,[["LBSelChanged","CAMO"]]],
        ["COMBOBOX",["Silencers", "Silencers equipped (where possible)?"], ["No","Yes"], 0, false],
        ["COMBOBOX",["IR Lasers", "IR lasers equipped (where possible)?"], ["No","Yes"], 0, false],
        ["COMBOBOX",["Night Vision", "NVGs equipped?"], ["No","Yes"], 0, false],
        ["COMBOBOX",["Magnified Optics", "Use magnified optics (where available)"], ["No","Yes"], 0, false]
        
    ],
    "aaf_fnc_LoadoutsModule_Modifier"
] call Achilles_fnc_ShowChooseDialog;

// Get dialog results
if (_dialogResult isEqualTo []) exitWith {};
_dialogResult params ["_faction","_camo","_silencers","_irLasers","_NVGs","_optics"];
//[_faction,_camo,_silencers,_irLasers,_NVGs] remoteExec ["aaf_fnc_LoadoutsModule_SetLoadout",0,"aaf_fnc_LoadoutsModule_SetLoadout"];
//Maybe change the below so it doesn't JIP, but setup something so when the player JIPs, it checks the server for the loadout variables first.
//[_faction,_camo,_silencers,_irLasers,_NVGs] remoteExec ["aaf_fnc_setLoadoutVars",0,true];

aaf_loadouts_data = [_faction,_camo,_silencers,_irLasers,_NVGs,_optics];
publicVariable "aaf_loadouts_data";
//Apparently publicVariable event handlers don't trigger for the computer they're broadcast from.
aaf_loadouts_data call aaf_fnc_LoadoutsModule_SetLoadout;

//Workaround for updating loadouts arsenals in non-dedi environment.
if (isServer && {!isDedicated}) then {
    [] call aaf_fnc_serverHandleLoadoutsChange;
};
