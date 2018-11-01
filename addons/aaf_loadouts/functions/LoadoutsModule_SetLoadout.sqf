/*
* Author: Tommo
* Description: Handles checking the player's role, assembling their loadout data, setting it, saving it for respawn, setting ACE medic/engineer/EOD and saving that for respawn.
* Arguments:
* 0 Faction - STRING 
* 1 Uniform/Camo - STRING
* 2 Equip Silencers - NUMBER optional
* 3 Equip IR Lasers - NUMBER optional
* 2 Equip Nightvision - NUMBER optional
* Notes:
* Players default to Rifleman (1st loadout in faction) when they haven't been assigned a loadout.
* Example:
["ADF","AMCU",0,0,0] call aaf_fnc_LoadoutsModule_SetLoadout
*/

if isDedicated exitWith {};
if not hasInterface exitWith {};

//This should always be defined by the publicvariable, right? Never not be defined?
//Just in case.
if isnil "aaf_loadouts_data" then {
    diag_log "AAF_loadouts LOG: aaf_loadouts_data wasn't defined when loadouts_module_SetLoadOut ran";
    aaf_loadouts_data = [0,0,0,0,0,0];
};

//Need to read from the actually sent data before reading from the global var, idiot. Or do you. It'll be updated via publicVariable before this runs, so no, no need to validate the data.
aaf_loadouts_data params [["_faction",0,[0]],["_uniform",0,[0]],["_silencers",0,[0]],["_irLasers",0,[0]],["_NVGs",0,[0]],["_optics",0,[0]]];
private _role = tolower (player getvariable ["aaf_loadouts_role","rifleman"]);
private _loadouts = (aaf_loadouts_masterlist select _faction) select 0;
_loadouts = missionNamespace getVariable [_loadouts,[]];

if ((count _loadouts) == 0) exitWith {systemChat "Empty loadouts";};

private _modifiedloadout = [] + (_loadouts select 0);

switch _role do {
    default 			{  _role = 0};
    case "rifleman" 	: {_role = 0};
    case "rifleman_gl" 	: {_role = 1};
    case "lat" 			: {_role = 2};
    case "cls" 			: {_role = 3};
    case "lsw" 			: {_role = 4};
    case "secco" 		: {_role = 5};
    case "secco_gl" 	: {_role = 6};
    case "marksman" 	: {_role = 7};
    case "medic" 		: {_role = 8};
    case "eod" 			: {_role = 9};
    case "engineer" 	: {_role = 10};
    case "mat" 			: {_role = 11};
    case "mat_ammo" 	: {_role = 12};
    case "mmg" 			: {_role = 13};
    case "mmg_ammo"		: {_role = 14};
};

if (_role != 0) then {
            {
                if (_x != "") then {
                    _modifiedloadout set [_foreachIndex,_x];
                };
            } foreach (_loadouts select _role);
};

{
    _x = format [_x,_uniform,_silencers,_irLasers,_NVGs,_optics];
    _x = call compile _x;
    _modifiedloadout set [_foreachIndex,_x];
} foreach _modifiedloadout;

/*
if (_silencers == 0) then {
    (_modifiedloadout select 0) set [1,''];
    (_modifiedloadout select 2) set [1,''];
};

if (_irLasers == 0) then {
    (_modifiedloadout select 0) set [2,''];
    (_modifiedloadout select 2) set [2,''];
};

if (_NVGs == 0) then {
    (_modifiedloadout select 9) set [5,''];
};
*/


//Keeping personal headgear.
private _goggles = goggles player;
_modifiedloadout set [7,_goggles];

player setUnitLoadout _modifiedloadout;

//Special role setting/revoking.
//Remember _role has been converted to a number.
private _medic = switch _role do {
    case 3 		: {1};
    case 8 		: {2};
    default 	  {0};
};
player setVariable ["ace_medical_medicClass",_medic,true];

private _engineer = if (_role == 10) then {
    1
} else {
    0
};
player setVariable ["ACE_isEngineer",_engineer,true];

private _eod = if (_role == 9) then {
    true
} else {
    false
};
player setVariable ["ACE_isEOD",_eod,true];

private _value = missionnamespace getVariable ["aaf_disable_groupInsignia",false];
if not _value then {
    [] call aaf_fnc_setPersonalSig;
};

private _value = missionnamespace getVariable ["aaf_disable_respawnLoadout",false];
if not _value then {
    player setVariable ["Saved_Loadout",_modifiedloadout];
    player setVariable ["aaf_var_respawn_medicLevel",_medic];
    player setVariable ["aaf_var_respawn_engineerLevel",_engineer];
    player setVariable ["aaf_var_respawn_eodLevel",_eod];
};
