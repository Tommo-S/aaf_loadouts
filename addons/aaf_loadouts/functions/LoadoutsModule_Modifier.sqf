/*
* Author: Tommo
* Description: Modifer function for the faction/camo select module, modifies the list of available camos when choosing another faction.
* Arguments:
* 0 Mode - STRING 
* 1 control - NUMBER, not used, passed by Achilles.
* 2 index - NUMBER, index of choice.
* Notes:
* Not to be called manually.
* Achilles modules operate in the UInamespace by default, so need to use missionNamespace getvariable to check normal global variables.
*/

params ["_mode", "_ctrl", "_comboIndex"];

_IDD_DIALOG			= 133798;
_IDC_COMBO_FACTION	= 20000;
_IDC_COMBO_CAMO 	= 20001;

disableSerialization;
private _dialog = findDisplay _IDD_DIALOG;


switch (_mode) do {
    case "LOADED":
    {
        private _ctrlFaction = _dialog displayCtrl _IDC_COMBO_FACTION;
        _ctrlFaction lbSetCurSel lbCurSel _ctrlFaction;
    };
    case "FACTION":
    {
        private _ctrlCamo = _dialog displayCtrl _IDC_COMBO_CAMO; 
        lbClear _ctrlCamo;
        private _loadoutList = missionNamespace getVariable ["aaf_loadouts_masterlist",[]];
        private _camolist = ((_loadoutList select _comboIndex) select 2);
        {
            _ctrlCamo lbAdd _x;
        } forEach ((_loadoutList select _comboIndex) select 2);
    };
    case "CAMO":
        {};
};
