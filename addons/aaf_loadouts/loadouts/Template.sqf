// <- The double slashes are comments. Any lines beginning with those are invisible to the game.

/* <-- this starts a comment block.
Think of multi line comments.
this ends a comment block --> */


//A simple check for a required mod, or mods. If the mods aren't loaded it will exit here and this factions loadout won't be added.
//Can comment out this check if a faction should always be enabled.
if not (["ADFU_Base"] call aaf_fnc_checkPBOLoaded) exitWith {};

aaf_loadouts_masterlist pushback ["aaf_loadouts_adf","ADF",["AMC", "AMC-T", "AMP", "MC", "AMC-S"]];
//aaf_loadouts_masterlist pushback [Faction_variablename,"faction display name",["camo1","camo2","camo3"]];
//Pay attention to the variable name, we'll need that later in the file.


/*
Notes:
select %1 refers to selected camo, it's the index of the selected camo from the available faction camos. If we were using AMC, it would be 0. If we were using AMP it would be 2. If we were using AMC-S it would be 4. (remembering array elements start counting from 0)
select %2 refers to silencers setting (0 for off, 1 for on)
select %3 refers to ir lasers setting (0 for off, 1 for on)
select %4 refers to nightvision setting (0 for off, 1 for on)
select %5 refering to optics setting (0 for no magnification, 1 for magnified optics)
Selections can be more complex, i.e. selecting for both uniform and nvg to get the right type of NVGs to match a uniform.

Examples:
Selecting by camo
(['ADFU_G3_AMC_Rolled','ADFU_G3_AMCT_Rolled','ADFU_G3_AMP_Nopad_Rolled','ADFU_G3_MC_Rolled','ADFU_G3_AMCS'] select %1)

selecting by silencers (note that for accessorys, a blank string '' indicates there is nothing on the slot)
(['','muzzle_snds_M'] select %2)

Selecting by IR lasers
(['','acc_pointer_IR'] select %3)

Selecting by NVGs
(['','NVGoggles'] select %4)

Selecting by Optics
(['optic_Holosight','ADFU_optic_TA31'] select %5)

Selecting by BOTH uniform and NVGS (i.e. getting right coloured goggles to match uniforms)
(['',(['NVGoggles','NVGoggles_INDEP','NVGoggles_OPFOR','NVGoggles','NVGoggles_OPFOR'] select %1)] select %4)

Selecting by BOTH uniform and optics (i.e. getting right coloured sight to match uniforms). Shouldn't be a big deal except for camo weapons.
(['',(['madeupsight_Black','madeupsight_woodland','madeupsight_desert'] select %1)] select %5)

Selecting by code.
Important: This relies on breaking up the string and inserting more text. It's very easy to fuck up the quotation marks.
//If RHS is enabled, _item will be rhsusf_acc_eotech_xps3, if not _item will be optic_Holosight.

private _item = if (isClass(configFile >> "CfgPatches" >> "rhsusf_main")) then {'rhsusf_acc_eotech_xps3'} else {'optic_Holosight'};

(['"+_item+"','ADFU_optic_TA31'] select %5)
*/