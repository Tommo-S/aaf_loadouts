/*
* Author: Tommo
* Description: Update players ace medic, ace engineer, eod status when loading a loadout from arsenal, and setting up variables so loadout can be reapplied on respawn.
* Arguments:
* 0 - loadout data (in getunitloadout format) ARRAY
* 1 - loadout name STRING
* Notes: Not called manually.
* Example:
[(getUnitLoadout bob), "CLS"] call aaf_fnc_arsenalLoadLoadoutEH; 
*/

params ["_loadoutData","_loadoutName"];
//Updating respawn loadout
player setVariable["Saved_Loadout",_loadoutData];

//Setting med/engineer/eod levels
private _medLevel = 0;
private _engLevel = 0;
private _eod = false;

switch _loadoutName do {
    case "CLS" : {_medLevel = 1};
    case "Medic" : {_medLevel = 2};
    case "Engineer" : {_engLevel = 2};
    case "EOD" : {_eod = true};
};

player setVariable ["ace_medical_medicClass",_medLevel,true];
player setVariable ["ACE_isEngineer",_engLevel,true];
player setVariable ["ACE_isEOD",_eod,true];

player setVariable ["aaf_var_respawn_medicLevel",_medLevel];
player setVariable ["aaf_var_respawn_engineerLevel",_engLevel];
player setVariable ["aaf_var_respawn_eodLevel",_eod];

