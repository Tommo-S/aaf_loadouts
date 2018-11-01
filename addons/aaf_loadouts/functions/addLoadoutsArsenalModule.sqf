/*
* Author: Tommo
* Description: Sends object to server to proceed with adding an updating arsenal to it.
* Arguments:
* 0 - position module was dropped ARRAY
* 1 - object module was dropped on OBJECT
* Notes: Intention: To be called from an ARES custom Zeus module.
* Example:
[[0,0,0],arsenal1] call aaf_fnc_addLoadoutsArsenalModule; 
*/
private _position = param [0,[0,0,0],[[]]];
private _object = param [1,objNull,[objNull]];

if (isnull _object) exitWith {
    systemChat "addLoadoutsArsenal: no object provided";
};

[_object] remoteExec ["aaf_fnc_addLoadoutsArsenal",2,false];