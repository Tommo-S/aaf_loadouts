/*
* Author: Tommo
* Description: Creates Achilles custom dialog for setting unit roles, called by module.
* Arguments:
* 0 Position module was dropped - ARRAY 
* 1 Target object - OBJECT If no object provided, uses Achilles alternate selection method of drag box -> press enter.
* Notes:
* Not to be called manually.
* Requires scheduled environment
*/

//Ares alt selection method.
params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
private _selectedObjects = if (isNull _objectUnderCursor) then {
    ["Objects"] call Achilles_fnc_SelectUnits;
} else {
    [_objectUnderCursor];
};

if (isNil "_selectedObjects") exitWith {};

if (_selectedObjects isEqualTo []) exitWith {
    ["No object was selected!"] call Achilles_fnc_showZeusErrorMessage;
};

private _dialogResult = [
    "Set Unit Loadout",
    [
        ["COMBOBOX",["Loadout","Select unit loadout"],aaf_loadouts_displayRoles, 0, false]
    ]
] call Achilles_fnc_ShowChooseDialog;
if (_dialogResult isEqualTo []) exitWith {};
private _role = aaf_loadouts_roles select (_dialogResult select 0);



//Check if a faction/camo has already been defined in mission, if not define default.
//Note: Not calling a server wide start here, can be done when person sets a faction.
if isnil "aaf_loadouts_data" then {
    aaf_loadouts_data = [0,0,0,0,0,0];
};

{
    if (isPlayer  _x) then {
        [_x,["aaf_loadouts_role",_role]] remoteExec ["setVariable",_x,false];
        [] remoteExec ["aaf_fnc_LoadoutsModule_SetLoadout",_x,false];
    };
} foreach _selectedObjects;
