//Couldn't work out how to include macros without making it much, much worse for readability, or macroing the whole thing. Not sure why I'm leaving this in.
#include "\aaf_loadouts\addons\aaf_loadouts\script_component.hpp"


if not (["ADFU_Base"] call aaf_fnc_checkPBOLoaded) exitWith {};

aaf_loadouts_masterlist pushback ["aaf_loadouts_adf","ADF",["AMC", "AMC-T", "AMP", "MC", "AMC-S"]];

//Check if RHS is enabled. If enabled, use its eotech as it's nicer, black, looks better. Otherwise suck shit eat the vanilla optic. There is an apex dlc optic that is a black holosight but it's pretty ehhh.
private _unmagOptic = if (isClass(configFile >> "CfgPatches" >> "rhsusf_main")) then {'rhsusf_acc_eotech_xps3'} else {'optic_Holosight'};

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

*/

private _rifleman = [
"['ADFU_SteyrEF88',(['','muzzle_snds_M'] select %2),(['','acc_pointer_IR'] select %3),(['"+_unmagOptic+"','ADFU_optic_TA31'] select %5),['ADFU_30Rnd_556x45_B',30],[],''],",
"[],",
"['ADFU_hpII',(['','muzzle_snds_acp'] select %2),'','',['ADFU_13Rnd_45ACP_Mag',13],[],''],",
"[(['ADFU_G3_AMC_Rolled','ADFU_G3_AMCT_Rolled','ADFU_G3_AMP_Nopad_Rolled','ADFU_G3_MC_Rolled','ADFU_G3_AMCS'] select %1),[['ACRE_PRC343',1],['ACE_fieldDressing',4],['ACE_elasticBandage',4],['ACE_packingBandage',4],['ACE_tourniquet',2],['ACE_quikclot',2],['ACE_epinephrine',2],['ACE_morphine',2],['ADFU_13Rnd_45ACP_Mag',2,13]]],",
"[(['ADFU_V_TBAS_Assaulter_Belt_AMC','ADFU_V_TBAS_Assaulter_Belt_AMCT','ADFU_V_TBAS_Assaulter_Belt_AMP','ADFU_V_JPC_Assaulter_Belt_MC','ADFU_V_JPC_Assaulter_Belt_AMCS'] select %1),[['ACE_MapTools',1],['SmokeShell',2,1],['HandGrenade',2,1],['ADFU_30Rnd_556x45_B',7,30]]],",
"[(['ADFU_Assaultpack_AMC','ADFU_Assaultpack_AMCT','ADFU_Assaultpack_AMP','ADFU_Assaultpack_MC','ADFU_Assaultpack_AMCS'] select %1),[[(['ADFU_Booniehat_AMC','ADFU_Booniehat_AMCT','ADFU_Booniehat_AMP','ADFU_Booniehat_MC','ADFU_Beenie_AMCS'] select %1),1]]],",
"(['ADFU_H_Airframe_Cover_02_AMC','ADFU_H_Airframe_Cover_02_AMCT','ADFU_Helmet_ECH_AMP','ADFU_H_OpsCore_02_MC','ADFU_H_OpsCore_02_AMCS'] select %1),",
"'',",
"[],",
"['ItemMap','','','ItemCompass','ItemWatch',(['',(['NVGoggles','NVGoggles_INDEP','NVGoggles_OPFOR','NVGoggles','NVGoggles_OPFOR'] select %1)] select %4)]"];

private _rifleman_GL = [
"['ADFU_SteyrEF88_GL',(['','muzzle_snds_M'] select %2),(['','acc_pointer_IR'] select %3),(['"+_unmagOptic+"','ADFU_optic_TA31'] select %5),['ADFU_30Rnd_556x45_B',30],['1Rnd_HE_Grenade_shell',1],''],",
"",
"",
"",
"",
"[(['ADFU_Assaultpack_AMC','ADFU_Assaultpack_AMCT','ADFU_Assaultpack_AMP','ADFU_Assaultpack_MC','ADFU_Assaultpack_AMCS'] select %1),[['1Rnd_HE_Grenade_shell',11,1],['1Rnd_Smoke_Grenade_shell',4,1],['1Rnd_SmokeRed_Grenade_shell',4,1],['1Rnd_SmokeBlue_Grenade_shell',4,1],[(['ADFU_Booniehat_AMC','ADFU_Booniehat_AMCT','ADFU_Booniehat_AMP','ADFU_Booniehat_MC','ADFU_Beenie_AMCS'] select %1),1]]],",
"",
"",
"",
""];

private _LAT = [
"",
"['ADFU_launch_M72','','','',['ACE_PreloadedMissileDummy_ADFU',1],[],''],",
"",
"",
"",
"",
"",
"",
"",
""];

private _CLS = [
"",
"",
"",
"",
"",
"[(['ADFU_Assaultpack_AMC','ADFU_Assaultpack_AMCT','ADFU_Assaultpack_AMP','ADFU_Assaultpack_MC','ADFU_Assaultpack_AMCS'] select %1),[['ACE_fieldDressing',16],['ACE_elasticBandage',16],['ACE_quikclot',8],['ACE_packingBandage',16],['ACE_morphine',12],['ACE_epinephrine',12],['ACE_plasmaIV',4],['ACE_tourniquet',8],['SmokeShell',2,1],[(['ADFU_Booniehat_AMC','ADFU_Booniehat_AMCT','ADFU_Booniehat_AMP','ADFU_Booniehat_MC','ADFU_Beenie_AMCS'] select %1),1]]],",
"",
"",
"",
""];

private _LSW = [
"['ADFU_minimi','',(['','acc_pointer_IR'] select %3),(['"+_unmagOptic+"','ADFU_optic_ElcanC79'] select %5),['ADFU_200Rnd_556x45',200],[],''],",
"",
"",
"",
"[(['ADFU_V_TBAS_Hgunner_Belt_AMC','ADFU_V_TBAS_Hgunner_Belt_AMCT','ADFU_V_TBAS_Hgunner_Belt_AMP','ADFU_V_JPC_Hgunner_Belt_MC','ADFU_V_TBAS_Hgunner_Belt_AMCS'] select %1),[['ACE_MapTools',1],['ADFU_200Rnd_556x45',1,200],['SmokeShell',2,1],['HandGrenade',2,1]]],",
"[(['ADFU_Kitbag_AMC','ADFU_Kitbag_AMCT','ADFU_Kitbag_AMP','ADFU_Kitbag_MC','ADFU_Kitbag_AMCS'] select %1),[['ADFU_200Rnd_556x45',3,200],[(['ADFU_Booniehat_AMC','ADFU_Booniehat_AMCT','ADFU_Booniehat_AMP','ADFU_Booniehat_MC','ADFU_Beenie_AMCS'] select %1),1]]],",
"",
"",
"",
""];

private _Secco = [
"",
"",
"",
"",
"[(['ADFU_V_TBAS_TeamLeader_Belt_AMC','ADFU_V_TBAS_TeamLeader_Belt_AMCT','ADFU_V_TBAS_TeamLeader_Belt_AMP','ADFU_V_JPC_Teamleader_Belt_MC','ADFU_V_TBAS_TeamLeader_Belt_AMCS'] select %1),[['ACE_MapTools',1],['HandGrenade',2,1],['SmokeShell',2,1],['ADFU_30Rnd_556x45_B',5,30],['ADFU_30Rnd_556x45_T',2,30]]],",
"[(['ADFU_Assaultpack_AMC','ADFU_Assaultpack_AMCT','ADFU_Assaultpack_AMP','ADFU_Assaultpack_MC','ADFU_Assaultpack_AMCS'] select %1),[['ACRE_PRC152',1],['SmokeShell',2,1],['SmokeShellRed',2,1],['SmokeShellBlue',2,1],['SmokeShellGreen',2,1],[(['ADFU_Booniehat_AMC','ADFU_Booniehat_AMCT','ADFU_Booniehat_AMP','ADFU_Booniehat_MC','ADFU_Beenie_AMCS'] select %1),1]]],",
"",
"",
"[(['Binocular','Rangefinder'] select %4),'','','',[],[],''],",
"['ItemMap','ItemGPS','','ItemCompass','ItemWatch',(['',(['NVGoggles','NVGoggles_INDEP','NVGoggles_OPFOR','NVGoggles','NVGoggles_OPFOR'] select %1)] select %4)]"];

private _Secco_GL = [
"['ADFU_SteyrEF88_GL',(['','muzzle_snds_M'] select %2),(['','acc_pointer_IR'] select %3),(['"+_unmagOptic+"','ADFU_optic_TA31'] select %5),['ADFU_30Rnd_556x45_B',30],['1Rnd_HE_Grenade_shell',1],''],",
"",
"",
"",
"[(['ADFU_V_TBAS_TeamLeader_Belt_AMC','ADFU_V_TBAS_TeamLeader_Belt_AMCT','ADFU_V_TBAS_TeamLeader_Belt_AMP','ADFU_V_JPC_Teamleader_Belt_MC','ADFU_V_TBAS_TeamLeader_Belt_AMCS'] select %1),[['ACE_MapTools',1],['HandGrenade',2,1],['SmokeShell',2,1],['ADFU_30Rnd_556x45_B',5,30],['ADFU_30Rnd_556x45_T',2,30]]],",
"[(['ADFU_Assaultpack_AMC','ADFU_Assaultpack_AMCT','ADFU_Assaultpack_AMP','ADFU_Assaultpack_MC','ADFU_Assaultpack_AMCS'] select %1),[['ACRE_PRC152',1],['SmokeShell',2,1],['SmokeShellRed',2,1],['SmokeShellBlue',2,1],['SmokeShellGreen',2,1],['1Rnd_HE_Grenade_shell',11,1],['1Rnd_SmokeBlue_Grenade_shell',4,1],['1Rnd_Smoke_Grenade_shell',4,1],['1Rnd_SmokeRed_Grenade_shell',4,1],[(['ADFU_Booniehat_AMC','ADFU_Booniehat_AMCT','ADFU_Booniehat_AMP','ADFU_Booniehat_MC','ADFU_Beenie_AMCS'] select %1),1]]],",
"",
"",
"[(['Binocular','Rangefinder'] select %4),'','','',[],[],''],",
"['ItemMap','ItemGPS','','ItemCompass','ItemWatch',(['',(['NVGoggles','NVGoggles_INDEP','NVGoggles_OPFOR','NVGoggles','NVGoggles_OPFOR'] select %1)] select %4)]"];

private _marksman = ["['ADFU_HK417',(['','ADFU_muzzle_snds_M'] select %2),(['','acc_pointer_IR'] select %3),'ADFU_optic_TA648RMR',['20Rnd_762x51_Mag',20],[],'bipod_01_F_blk']",
"[]",
"",
"",
"[(['ADFU_V_TBAS_Marksman_Belt_AMC','ADFU_V_TBAS_Marksman_Belt_AMCT','ADFU_V_TBAS_Marksman_Belt_AMP','ADFU_V_JPC_Marksman_Belt_MC','ADFU_V_TBAS_Marksman_Belt_AMCS'] select %1),[['ACE_MapTools',1],['HandGrenade',2,1],['SmokeShell',2,1],['20Rnd_762x51_Mag',7,20]]]",
"",
"",
"",
"['Rangefinder','','','',[],[],'']",
""];

private _medic = ["",
"",
"",
"",
"[(['ADFU_V_TBAS_Medic_Belt_AMC','ADFU_V_TBAS_Medic_Belt_AMCT','ADFU_V_TBAS_Medic_Belt_AMP','ADFU_V_JPC_Medic_Belt_MC','ADFU_V_TBAS_Medic_Belt_AMCS'] select %1),[['ACE_MapTools',1],['HandGrenade',2,1],['SmokeShell',6,1],['ADFU_30Rnd_556x45_B',7,30]]]",
"[(['ADFU_Kitbag_AMC','ADFU_Kitbag_AMCT','ADFU_Kitbag_AMP','ADFU_Kitbag_MC','ADFU_Kitbag_AMCS'] select %1),[['ACE_fieldDressing',26],['ACE_elasticBandage',26],['ACE_quikclot',8],['ACE_packingBandage',26],['ACE_morphine',16],['ACE_epinephrine',16],['ACE_tourniquet',8],['adv_aceCPR_AED',1],['ACE_bloodIV',12],[(['ADFU_Booniehat_AMC','ADFU_Booniehat_AMCT','ADFU_Booniehat_AMP','ADFU_Booniehat_MC','ADFU_Beenie_AMCS'] select %1),1]]]",
"",
"",
"",
""];

private _EOD = [
"",
"",
"['ACE_VMH3','','','',[],[],'']",
"",
"",
"[(['ADFU_Kitbag_AMC','ADFU_Kitbag_AMCT','ADFU_Kitbag_AMP','ADFU_Kitbag_MC','ADFU_Kitbag_AMCS'] select %1),[['ACE_DefusalKit',1],['ACE_Clacker',1],['ACE_SpraypaintGreen',1],['ACE_SpraypaintBlue',1],['ACE_SpraypaintRed',1],['DemoCharge_Remote_Mag',6,1],['APERSMine_Range_Mag',4,1],['ATMine_Range_Mag',1,1],[(['ADFU_Booniehat_AMC','ADFU_Booniehat_AMCT','ADFU_Booniehat_AMP','ADFU_Booniehat_MC','ADFU_Beenie_AMCS'] select %1),1]]]",
"",
"",
"",
""];

private _Engineer = [
"",
"",
"",
"",
"",
"[(['ADFU_Assaultpack_AMC','ADFU_Assaultpack_AMCT','ADFU_Assaultpack_AMP','ADFU_Assaultpack_MC','ADFU_Assaultpack_AMCS'] select %1),[['ToolKit',1],[(['ADFU_Booniehat_AMC','ADFU_Booniehat_AMCT','ADFU_Booniehat_AMP','ADFU_Booniehat_MC','ADFU_Beenie_AMCS'] select %1),1]]]",
"",
"",
"",
""];

private _MAT = [
"",
"['ADFU_M3_CG','','','ADFU_optic_m3CG',['ADFU_m3CG_HEAT',1],[],'']",
"",
"",
"",
"[(['ADFU_Kitbag_AMC','ADFU_Kitbag_AMCT','ADFU_Kitbag_AMP','ADFU_Kitbag_MC','ADFU_Kitbag_AMCS'] select %1),[['ADFU_m3CG_HEATRAP',1,1],['ADFU_m3CG_HEAT',1,1],[(['ADFU_Booniehat_AMC','ADFU_Booniehat_AMCT','ADFU_Booniehat_AMP','ADFU_Booniehat_MC','ADFU_Beenie_AMCS'] select %1),1]]]",
"",
"",
"",
""];

private _MAT_Ammo = [
"",
"",
"",
"",
"",
"[(['ADFU_Kitbag_AMC','ADFU_Kitbag_AMCT','ADFU_Kitbag_AMP','ADFU_Kitbag_MC','ADFU_Kitbag_AMCS'] select %1),[['ADFU_m3CG_HEAT',2,1],['ADFU_m3CG_HEATRAP',2,1],[(['ADFU_Booniehat_AMC','ADFU_Booniehat_AMCT','ADFU_Booniehat_AMP','ADFU_Booniehat_MC','ADFU_Beenie_AMCS'] select %1),1]]]",
"",
"",
"",
""];

private _MMG = ["['ADFU_Maximi_Para',(['','ADFU_muzzle_snds_M'] select %2),(['','acc_pointer_IR'] select %3),(['"+_unmagOptic+"','ADFU_optic_ElcanC79'] select %5),['ADFU_100Rnd_762x51',100],[],'']",
"",
"",
"",
"[(['ADFU_V_TBAS_Hgunner_Belt_AMC','ADFU_V_TBAS_Hgunner_Belt_AMCT','ADFU_V_TBAS_Hgunner_Belt_AMP','ADFU_V_JPC_Hgunner_Belt_MC','ADFU_V_TBAS_Hgunner_Belt_AMCS'] select %1),[['ACE_MapTools',1],['HandGrenade',2,1],['SmokeShell',2,1],['ADFU_100Rnd_762x51',1,100]]]",
"[(['ADFU_Kitbag_AMC','ADFU_Kitbag_AMCT','ADFU_Kitbag_AMP','ADFU_Kitbag_MC','ADFU_Kitbag_AMCS'] select %1),[['ADFU_100Rnd_762x51',3,100],[(['ADFU_Booniehat_AMC','ADFU_Booniehat_AMCT','ADFU_Booniehat_AMP','ADFU_Booniehat_MC','ADFU_Beenie_AMCS'] select %1),1]]]",
"",
"",
"",
""];

private _MMG_ammo = [
"",
"",
"",
"",
"",
"[(['ADFU_Carryall_AMC','ADFU_Carryall_AMCT','ADFU_Carryall_AMP','ADFU_Carryall_MC','ADFU_Carryall_AMCS'] select %1),[['ADFU_100Rnd_762x51',4,100],[(['ADFU_Booniehat_AMC','ADFU_Booniehat_AMCT','ADFU_Booniehat_AMP','ADFU_Booniehat_MC','ADFU_Beenie_AMCS'] select %1),1]]]",
"",
"",
"",
""];

//Loadouts
aaf_loadouts_adf = [
_rifleman,
_rifleman_GL,
_LAT,
_CLS,
_LSW,
_Secco,
_Secco_GL,
_marksman,
_medic,
_EOD,
_Engineer,
_MAT,
_MAT_Ammo,
_MMG,
_MMG_ammo];
