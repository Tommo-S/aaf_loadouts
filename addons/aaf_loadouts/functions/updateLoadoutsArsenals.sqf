/*
* Author: Tommo
* Description: Update players ace medic, ace engineer, eod status when loading a loadout from arsenal, and setting up variables so loadout can be reapplied on respawn.
* Arguments:
* NONE
* Notes: Called on server by aaf_fnc_serverHandleLoadoutsChange;
* Example:
[] call aaf_fnc_updateLoadoutArsenals; 
*/

if ((count aaf_loadout_arsenals) == 0) exitWith {
    ["aaf_fnc_updateLoadoutArsenals exit, no arsenals"] remoteExec ["systemChat",0,false];
};

if (isnil "aaf_loadouts_arsenalItems") exitWith {
    ["aaf_fnc_updateLoadoutArsenals exit, no defined arsenal items"] remoteExec ["systemChat",0,false];
};

{
    if (isnull _x) then {
        aaf_loadout_arsenals = aaf_loadout_arsenals - _x;
    } else {
        [_x, true, true] call ace_arsenal_fnc_removeVirtualItems;
        [_x, aaf_loadouts_arsenalItems, true] call ace_arsenal_fnc_initBox;
    };
} foreach aaf_loadout_arsenals;
