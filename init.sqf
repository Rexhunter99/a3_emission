
// to use only 1 type 
ns_blow_itemapsi = ["H_PilotHelmetFighter_B","H_PilotHelmetFighter_I","H_PilotHelmetFighter_O"];//set headgear protection here
ns_blow_itemtype = 1; // 1=Headgear 2=Vest 3=Item  4=Goggles 5=Uniform
ns_blow_removeapsi = true; // remove/destroy APSI item after storm
ns_blow_delaymod = 0.1; //blowout delay - higher number longer time between blowouts
ns_blow_damage_unprotected = 0.60; //amount of damage blowout causes - value of 1 or higher will kill player!
ns_blow_damage_inbuilding = 0.0; // set to 0 to have player not take damage when in a building regardless of having APSI

ns_prep_time = 20; //time to prepare/hide
ns_blow_time = 20; //time after preparing before storm actually hits

ns_blowout = true;//Do not change
ns_blowout_exile = true;//Do not change
ns_blow_prep = false;//Do not change
ns_blow_status = false;//Do not change
ns_blow_action = false;//Do not change
phasAPSI = false;//Do not change

fnc_isInsideBuilding = compile preprocessFileLineNumbers "addons\blowout\external\fn_isInsideBuilding.sqf";
fnc_hasAPSI = compile preprocessFileLineNumbers "addons\blowout\external\fn_hasAPSI.sqf";

if (!isDedicated) then {
	 _bul = [] execVM "addons\blowout\module\blowout_client.sqf";
	diag_log "BLOWOUT CLIENT - Loading";
};
if (isServer) then {
	_bul = [] execVM "addons\blowout\module\blowout_server.sqf";
	sleep 2;
};

systemChat "FallingSheep's EVR, ready!";