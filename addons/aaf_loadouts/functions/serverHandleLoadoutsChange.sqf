/*
* Author: Tommo
* Description: Compiles ALL loadouts from strings, shares loadouts as mission loadouts via ace arsenal, compiles list of items those arsenals will need, calls function to update those arsenals. Called via publicvariable eventhandler when change in aaf_loadouts_data is broadcast.
* Arguments:
* NONE
* Notes: Not to be called manually.
* Example:
[] call aaf_fnc_serverHandleLoadoutsChange; 
*/

//Catch in case this is called manually before loadout data has been set.
if isnil "aaf_loadouts_data" then {
    diag_log "AAF_loadouts LOG: aaf_loadouts_data wasn't defined when serverHandleLoadoutsChange ran";
    aaf_loadouts_data = [0,0,0,0,0,0];
};

aaf_loadouts_arsenalItems = [];

aaf_loadouts_data params [["_faction",0,[0]],["_uniform",0,[0]],["_silencers",0,[0]],["_irLasers",0,[0]],["_NVGs",0,[0]],["_optics",0,[0]]];
private _loadouts = (aaf_loadouts_masterlist select _faction) select 0;
_loadouts = missionNamespace getVariable [_loadouts,[]];

if ((count _loadouts) == 0) exitWith {diag_log format ["AAF_loadouts LOG: no loadouts defined for faction %1",_faction];};
private _loadoutList = [];
private _baseLoadout = (_loadouts select 0);


{
    private _modifiedloadout = [] + (_baseLoadout);
    //For every role except the base loadout, will need to replace the baseloadout with specific edits.
    if (_foreachIndex > 0) then {
            {
                if (_x != "") then {
                    _modifiedloadout set [_foreachIndex,_x];
                };
            } foreach (_loadouts select _foreachIndex);
    };
    
    {
        _x = format [_x,_uniform,_silencers,_irLasers,_NVGs,_optics];
        _x = call compile _x;
        _modifiedloadout set [_foreachIndex,_x];
    } foreach _modifiedloadout;
    
    //Compiling list of items to update arsenals with.
    [_modifiedloadout] call aaf_fnc_compileItemList;
    
    //Adding loadout to mission loadouts.
    _loadoutList pushback [(aaf_loadouts_displayRoles select _foreachIndex),_modifiedloadout];
    
} foreach _loadouts;

missionnamespace setVariable ["ace_arsenal_defaultLoadoutsList",_loadoutList,true];


[] call aaf_fnc_updateLoadoutsArsenals;
//Could look at adding all sunglasses, scarves etc to the arsenal items as well.
