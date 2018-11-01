/*
* Author: Tommo
* Description: Check if the object is already an ACE arsenal, if not add a limited ACE arsenal to it, add the objects required by the current loadout set to it. Adds the object to a list of arsenals that are to be updated when new faction/camo is selected.
* Arguments:
* 0 - target object OBJECT
* Notes: Intention: To be called from init field of object.
* Example:
[this] call aaf_fnc_addLoadoutsArsenal; 
*/

private _object = param [0,objNull,[objNull]];

if (isnull _object) exitWith {
    systemChat "addLoadoutsArsenal: no object provided";
};

//Clients exit, only server proceeds.
if not isServer exitwith {
};




//Checking if object has an arsenal. If not, will need to call one. If it already has an arsenal, gonna leave it alone and not update it.
if isnil "ace_arsenal_EHIDArray" exitWith {
    //No arsenals.
    [_object, aaf_loadouts_arsenalItems, true] call ace_arsenal_fnc_initBox;
    aaf_loadout_arsenals pushBackUnique _object;
};

private _ID = (ace_arsenal_EHIDArray select {_x select 1 == _object}) select 0;
if isnil "_ID" then {
    [_object, aaf_loadouts_arsenalItems, true] call ace_arsenal_fnc_initBox;
    aaf_loadout_arsenals pushBackUnique _object;
};

