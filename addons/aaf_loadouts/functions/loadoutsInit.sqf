/*
* Author: Tommo
* Description: Process any modpack factional loadouts
* Arguments:
* Notes:
* Not to be called manually.
*/

if isnil "aaf_loadouts_masterlist" then {
	aaf_loadouts_masterlist = [];
};

//Setting up global var to track our arsenals. Our arsenals are only updated with items related to the loadouts.
aaf_loadout_arsenals = [];
aaf_loadouts_arsenalItems = [];

//Raw role names.
aaf_loadouts_roles = ["rifleman", "rifleman_gl", "lat", "cls", "lsw", "secco", "secco_gl", "marksman", "medic", "eod", "engineer", "mat", "mat_ammo", "mmg","mmg_ammo"];
//Role fancy display names.
aaf_loadouts_displayRoles = ["Rifleman", "Grenadier", "LAT", "CLS", "LSW", "Secco", "Secco w/GL", "Marksman", "Medic", "EOD", "Engineer", "MAT Gunner", "MAT Ammo Bearer", "MMG Gunner","MMG Ammo Bearer"];

//Add factions name.sqf to loadouts folder, add same name to this array.
private _factions = ["ADF","USA_80s"];

{
    private _script = "\aaf_loadouts\addons\aaf_loadouts\loadouts\" + _x + ".sqf";
    call compile preprocessFileLineNumbers  _script;
} foreach _factions;
