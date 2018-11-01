diag_log "Post init";

if aaf_loadouts_disable_postinit exitWith {
    diag_log "aaf_loadouts log: disabled via CBA options, exiting";
};


//For Server
//Add a publicvariables EH that will ultimately update any aaf arsenals (just arsenal objects flagged to be cleared/updated with new loadout items when factions change)


if isServer then {
   "aaf_loadouts_data" addPublicVariableEventHandler {
        [] call aaf_fnc_serverHandleLoadoutsChange;
    };
};


//For players
if (hasInterface && {!isDedicated}) then {
    
    //If ares is loaded, add custom modules. Need to add to all players in case they get promoted to Zeus later.
    if not isnil "Ares_fnc_RegisterCustomModule" then {
        ["AAF", "Loadouts: Set Unit Loadout",{[_this select 0, _this select 1] spawn aaf_fnc_RoleSelectModule_Module; }] call Ares_fnc_RegisterCustomModule; 
        ["AAF", "Loadouts: Set Faction",{ [] spawn aaf_fnc_LoadoutsModule_Module; }] call Ares_fnc_RegisterCustomModule;
        ["AAF", "Loadouts: Add Loadouts Arsenal",{ [_this select 0, _this select 1] call aaf_fnc_addLoadoutsArsenalModule; }] call Ares_fnc_RegisterCustomModule; 
    };

    //This enacts loadout change whenever someone drops a change faction module.
   "aaf_loadouts_data" addPublicVariableEventHandler {
        [(_this select 1)] call aaf_fnc_LoadoutsModule_SetLoadout;
    };
    
    //Setting up to set medical/engineer/EOD or not status when loading default loadouts. Also should update the players saved loadout.
    ["ace_arsenal_onLoadoutLoad", {_this call aaf_fnc_arsenalLoadLoadoutEH}] call CBA_fnc_addEventHandler;
    
    
    //Handle setting JIPs initial loadout. Only set if a module/mission has specified and broadcast loadout values.
    //Unsure if this will work, depends on when publicvariables are sent to JIPs. If sent after this then they're fucked.
    if didJIP then {
        diag_log "aaf_loadouts log: Player was JIP";
        if not isnil "aaf_loadouts_data" then {
            diag_log  "aaf_loadouts log: aaf_loadouts_data not nil";
            diag_log format ["aaf_loadouts log: aaf_loadouts_data = %1",aaf_loadouts_data];
            aaf_loadouts_data call aaf_fnc_LoadoutsModule_SetLoadout;
        } else {
            diag_log "aaf_loadouts log: playered JIPped, but aaf_loadouts_data was nil";
        };
    };
};
