
//Post init disabler
[
	"aaf_loadouts_disable_postinit",
	"CHECKBOX",
	"Disable Loadouts post init",
	["AAF Loadouts","Post Init Disablers"],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;

// Defaults. Will obviously need to make the default factions available to be selected.
// Which I guess means preinit the factions, instead of post init?
// For now this is pie in the sky, get it working first.
// Currently not possible to have list one influence list two in CBA options.
// However, could do a list for default factions, then make separate options for EACH faction's default uniform.
//But this is incredibly pie in sky, fuck that.
/*
[
	"aaf_loadouts_default_faction",
	"CHECKBOX",
	"Default Faction",
	["AAF Loadouts","Defaults"],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;

[
	"aaf_loadouts_default_camo",
	"CHECKBOX",
	"Default Camo",
	["AAF Loadouts","Defaults"],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;
*/