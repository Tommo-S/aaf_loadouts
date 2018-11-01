/*
* Author: Tommo
* Description: Checks if provided PBOs are loaded. Returns true if PBO is loaded. Returns false if ANY PBO is not present.
* Arguments:
* 0-Whatever PBO name - STRING/ARRAY.
* Notes: 
* Example:
["ADFU_Base"] call aaf_fnc_checkPBOLoaded; 
["ADFU_Base","rhsusf_main"] call aaf_fnc_checkPBOLoaded;
*/
private _return = true;


if (count _this == 0) exitWith {
    diag_log "AAF Log: Loadouts. aaf_fnc_checkPBOLoaded no input provided";
    systemChat "AAF Log: Loadouts. aaf_fnc_checkPBOLoaded no input provided";
    _return
};

{
    if (not (_x isequaltype "STRING")) exitWith {
        _return = false;
        diag_log "AAF Log: Loadouts. aaf_fnc_checkPBOLoaded invalid input (string required)";
        systemChat "AAF Log: Loadouts. aaf_fnc_checkPBOLoaded invalid input (string required)";
    };
    if not (isClass(configFile >> "CfgPatches" >> _x)) exitWith {
        _return = false;
        diag_log format ["AAF Log: Loadouts. aaf_fnc_checkPBOLoaded mod not loaded. %1",_x];
    };
} foreach _this;

_return

//Need to load with RHS enabled to see if the 80s loadouts show up.
