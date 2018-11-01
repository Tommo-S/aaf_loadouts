//Disabled 80s because not quite compatible with changes, needs updating
if true exitWith {};

if not (["rhsusf_main"] call aaf_fnc_checkPBOLoaded) exitWith {};

aaf_loadouts_masterlist pushback ['aaf_loadouts_US_Army_80s','USA Army 80s',['OCP','UCP']];

//Still got everything below medic to do.

aaf_loadouts_US_Army_80s = [
//rifleman

//rifleman_gl

//lat

//cls

//lsw

//secco

//secco_gl

//marksman

//medic

//eod

//engineer

//mat

//mat_ammo

//mmg

//mmg_ammo



//rifleman
//(['rhs_uniform_cu_ocp','rhs_uniform_cu_ucp'] select %1)
//(['rhsusf_iotv_ocp_Rifleman','rhsusf_iotv_ucp_Rifleman'] select %1)
//(['rhsusf_falconii_mc','rhsusf_assault_eagleaiii_ucp'] select %1)
//(['rhsusf_ach_helmet_ocp','rhsusf_ach_helmet_ucp'] select %1)
//(['rhsusf_patrolcap_ocp','rhsusf_patrolcap_ucp'] select %1)


[
"['rhs_weap_m16a4_carryhandle','','','',['rhs_mag_30Rnd_556x45_M855A1_Stanag',30],[],''],",
"[],",
"['rhsusf_weap_m1911a1','','','',['rhsusf_mag_7x45acp_MHP',7],[],''],",
"[(['rhs_uniform_cu_ocp','rhs_uniform_cu_ucp'] select %1),[['ACRE_PRC343',1],['ACE_fieldDressing',4],['ACE_elasticBandage',4],['ACE_quikclot',2],['ACE_packingBandage',4],['ACE_tourniquet',2],['rhsusf_mag_7x45acp_MHP',3,7]]],",
"[(['rhsusf_iotv_ocp_Rifleman','rhsusf_iotv_ucp_Rifleman'] select %1),[['ACE_MapTools',1],['rhs_mag_30Rnd_556x45_M855A1_Stanag',7,30],['SmokeShell',2,1],['rhs_mag_m67',2,1],['ACE_epinephrine',2],['ACE_morphine',2]]],",
"[(['rhsusf_falconii_mc','rhsusf_assault_eagleaiii_ucp'] select %1),[[(['rhsusf_patrolcap_ocp','rhsusf_patrolcap_ucp'] select %1),1]]],",
"(['rhsusf_ach_helmet_ocp','rhsusf_ach_helmet_ucp'] select %1),",
"'',",
"[],",
"['ItemMap','','','ItemCompass','ItemWatch','rhsusf_ANPVS_14']"
],


//rifleman_gl
[
"['rhs_weap_m16a4_carryhandle_M203','','','',['rhs_mag_30Rnd_556x45_M855A1_Stanag',30],['rhs_mag_M441_HE',1],''],",
"",
"",
"",
"[(['rhsusf_iotv_ocp_Grenadier','rhsusf_iotv_ucp_Grenadier'] select %1),[['ACE_MapTools',1],['SmokeShell',2,1],['rhs_mag_m67',2,1],['rhs_mag_30Rnd_556x45_M855A1_Stanag',7,30],['ACE_epinephrine',2],['ACE_morphine',2]]],",
"[(['rhsusf_falconii_mc','rhsusf_assault_eagleaiii_ucp'] select %1),[['rhs_mag_M441_HE',11,1],['rhs_mag_m714_White',4,1],['rhs_mag_m713_Red',4,1],['rhs_mag_m715_Green',4,1],[(['rhsusf_patrolcap_ocp','rhsusf_patrolcap_ucp'] select %1),1]]],",
"",
"",
"",
""
],

//lat - same uniforms as rifleman
[
"",
"['rhs_weap_M136','','','',['rhs_m136_mag',1],[],''],",
"",
"",
"",
"",
"",
"",
"",
""
],

//cls

[
"",
"",
"",
"",
"[(['rhsusf_iotv_ocp_Medic','rhsusf_iotv_ucp_Medic'] select %1),[['ACE_MapTools',1],['ACE_epinephrine',2],['ACE_morphine',2],['rhs_mag_30Rnd_556x45_M855A1_Stanag',7,30],['SmokeShell',4,1],['rhs_mag_m67',2,1]]],",
"[(['rhsusf_falconii_mc','rhsusf_assault_eagleaiii_ucp'] select %1),[['ACE_fieldDressing',16],['ACE_elasticBandage',16],['ACE_quikclot',8],['ACE_packingBandage',16],['ACE_tourniquet',8],['ACE_epinephrine',8],['ACE_morphine',8],['ACE_plasmaIV',4],[(['rhsusf_patrolcap_ocp','rhsusf_patrolcap_ucp'] select %1),1]]],",
"",
"",
"",
""
],

//lsw
[
"['rhs_weap_m249','','','',['rhsusf_200rnd_556x45_mixed_box',200],[],''],",
"",
"",
"",
"[(['rhsusf_iotv_ocp_SAW','rhsusf_iotv_ucp_SAW'] select %1),[['ACE_MapTools',1],['ACE_epinephrine',2],['ACE_morphine',2],['SmokeShell',2,1],['rhs_mag_m67',2,1],['rhsusf_200rnd_556x45_mixed_box',2,200]]],",
"[(['rhsusf_falconii_mc','rhsusf_assault_eagleaiii_ucp'] select %1),[['rhsusf_200rnd_556x45_mixed_box',3,200],[(['rhsusf_patrolcap_ocp','rhsusf_patrolcap_ucp'] select %1),1]]],",
"",
"",
"",
""
],

//secco
[
"",
"",
"",
"",
"[(['rhsusf_iotv_ocp_Squadleader','rhsusf_iotv_ucp_Squadleader'] select %1),[['ACE_MapTools',1],['ACE_epinephrine',2],['ACE_morphine',2],['rhs_mag_30Rnd_556x45_M855A1_Stanag',7,30],['SmokeShell',2,1],['rhs_mag_m67',2,1]]],",
"[(['rhsusf_falconii_mc','rhsusf_assault_eagleaiii_ucp'] select %1),[['ACRE_PRC152',1],[(['rhsusf_patrolcap_ocp','rhsusf_patrolcap_ucp'] select %1),1]]],",
"",
"",
"['Binocular','','','',[],[],''],",
""
],


//secco_gl
[
"['rhs_weap_m16a4_carryhandle_M203','','','',['rhs_mag_30Rnd_556x45_M855A1_Stanag',30],['rhs_mag_M441_HE',1],''],",
"",
"",
"",
"[(['rhsusf_iotv_ocp_Squadleader','rhsusf_iotv_ucp_Squadleader'] select %1),[['ACE_MapTools',1],['ACE_epinephrine',2],['ACE_morphine',2],['SmokeShell',2,1],['rhs_mag_m67',2,1],['rhs_mag_30Rnd_556x45_M855A1_Stanag',7,30]]],",
"[(['rhsusf_falconii_mc','rhsusf_assault_eagleaiii_ucp'] select %1),[['ACRE_PRC152',1],['rhs_mag_M441_HE',11,1],['rhs_mag_m714_White',4,1],['rhs_mag_m713_Red',4,1],['rhs_mag_m715_Green',4,1],[(['rhsusf_patrolcap_ocp','rhsusf_patrolcap_ucp'] select %1),1]]],",
"",
"",
"['Binocular','','','',[],[],''],",
""
],


//marksman
[
"['rhs_weap_m24sws_d','','','rhsusf_acc_M8541_low_d',['rhsusf_5Rnd_762x51_m118_special_Mag',5],[],'rhsusf_acc_harris_swivel'],",
"",
"",
"",
"[(['rhsusf_iotv_ocp_Rifleman','rhsusf_iotv_ucp_Rifleman'] select %1),[['ACE_MapTools',1],['SmokeShell',2,1],['rhs_mag_m67',2,1],['rhsusf_5Rnd_762x51_m118_special_Mag',14,5],['ACE_epinephrine',2],['ACE_morphine',2],['ACE_RangeCard',2]]],",
"[(['rhsusf_falconii_mc','rhsusf_assault_eagleaiii_ucp'] select %1),[['ACE_SpottingScope',1],['rhsusf_acc_premier_anpvs27',1],[(['rhsusf_patrolcap_ocp','rhsusf_patrolcap_ucp'] select %1),1]]],",
"",
"",
"['Binocular','','','',[],[],''],",
""
],

//medic
[
"",
"",
"",
"",
"[(['rhsusf_iotv_ocp_Medic','rhsusf_iotv_ucp_Medic'] select %1),[['ACE_MapTools',1],['ACE_epinephrine',2],['ACE_morphine',2],['rhs_mag_30Rnd_556x45_M855A1_Stanag',7,30],['SmokeShell',6,1],['rhs_mag_m67',2,1]]],",
"['B_Kitbag_cbr',[['ACE_bloodIV',12],['ACE_fieldDressing',26],['ACE_elasticBandage',26],['ACE_epinephrine',16],['ACE_morphine',16],['ACE_packingBandage',26],['ACE_tourniquet',8],['ACE_quikclot',8],[(['rhsusf_patrolcap_ocp','rhsusf_patrolcap_ucp'] select %1),1]]],",
"",
"",
"",
""
],

//eod
[
"",
"",
"['ACE_VMH3','','','',[],[],'']",
"",
"[(['rhsusf_iotv_ocp_Repair','rhsusf_iotv_ucp_Repair'] select %1),[['ACE_MapTools',1],['ACE_epinephrine',2],['ACE_morphine',2],['rhs_mag_30Rnd_556x45_M855A1_Stanag',7,30],['SmokeShell',2,1],['rhs_mag_m67',2,1]]],",
"['B_Kitbag_cbr',[['ACE_DefusalKit',1],['ACE_Clacker',1],['ACE_SpraypaintGreen',1],['ACE_SpraypaintBlue',1],['ACE_SpraypaintRed',1],['DemoCharge_Remote_Mag',6,1],['APERSMine_Range_Mag',4,1],[['rhsusf_weap_m1911a1','','','',['rhsusf_mag_7x45acp_MHP',7],[],''],1],[(['rhsusf_patrolcap_ocp','rhsusf_patrolcap_ucp'] select %1),1]]],",
"",
"",
"",
""
],

//engineer
["",
"",
"",
"",
"[(['rhsusf_iotv_ocp_Repair','rhsusf_iotv_ucp_Repair'] select %1),[['ACE_MapTools',1],['ACE_epinephrine',2],['ACE_morphine',2],['rhs_mag_30Rnd_556x45_M855A1_Stanag',7,30],['SmokeShell',2,1],['rhs_mag_m67',2,1]]],",
"[(['rhsusf_falconii_mc','rhsusf_assault_eagleaiii_ucp'] select %1),[['ToolKit',1],[(['rhsusf_patrolcap_ocp','rhsusf_patrolcap_ucp'] select %1),1]]]",
"",
"",
"",
""]
];

//mat

//mat_ammo

//mmg

//mmg_ammo