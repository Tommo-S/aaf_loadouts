/*
* Author: Tommo
* Description: Updates global variable aaf_loadouts_arsenalItems with a list of unique items from provided array. Used to assembling arsenal item lists required for each loadout.
* Provide this function with data, usually in the format of a getUnitLoadout array. Function will continually drill down into provided arrays until it reaches a string/number, strings are pushed back to master array, numbers are ignored (they're ammo count in the loadout). 
* Arguments:
* 0 - ARRAY/STRING/SCALAR
* Notes: Set aaf_loadouts_arsenalItems to an empty array before starting to call this function.
* Example:
[(getUnitLoadout bob), (getUnitLoadout kev)] call aaf_fnc_compileItemList; 
*/


params ["_data"];  
if isnil "_data" exitwith {};

switch (typeName _data) do {
    case "STRING"    : {
        if (_data != "") then {aaf_loadouts_arsenalItems pushBackUnique _data};
    };
    case "ARRAY"     : {
            {
                if (typeName _x != "SCALAR") then {
                    [_x] call aaf_fnc_compileItemList;
                };
            } foreach _data;
    };
};
