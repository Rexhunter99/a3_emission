/*
 **  BLOWOUT MODULE - Nightstalkers: Shadow of Namalsk
 *   ..created by Sumrak, ©2010
 *   http://www.nightstalkers.cz
 *   sumrak<at>nightstalkers.cz
 *   PBO edition
 *   SERVER-SIDE script 
*/
private["_emp_tg_namalsk"];
diag_log "BLOWOUT SERVER - Loaded";

bl_flashes = 
{
	if(ns_blow_lightning) then {
     _pozice = [0, 0, 0];
     _blesky1 = "Lightning1_F" createVehicle _pozice;
     _blesky1 setPos [6074.8604, 7402.5205, 0];   
     _blesky1 setVectorUp [0,0,1];
     _blesky2 = "Lightning1_F" createVehicle _pozice;
     _blesky2 setPos [6074.8604, 7402.5205, 151];
     _blesky2 setVectorUp [0,0,1];     
     _blesky3 = "Lightning1_F" createVehicle _pozice;
     _blesky3 setPos [6074.8604, 7402.5205, 320];  
     _blesky3 setVectorUp [0,0,1];
     _blesky4 = "Lightning1_F" createVehicle _pozice;
     _blesky4 setPos [6074.8604, 7402.5205, 471];  
     _blesky4 setVectorUp [0,0,1];   
     _blesky5 = "Lightning1_F" createVehicle _pozice;
     _blesky5 setPos [6074.8604, 7402.5205, 620];  
     _blesky5 setVectorUp [0,0,1];
     _blesky6 = "Lightning1_F" createVehicle _pozice;
     _blesky6 setPos [6074.8604, 7402.5205, 770];  
     _blesky6 setVectorUp [0,0,1];
     _blesky7 = "Lightning1_F" createVehicle _pozice;
     _blesky7 setPos [6074.8604, 7402.5205, 820];  
     _blesky7 setVectorUp [0,0,1];
     _blesky8 = "Lightning1_F" createVehicle _pozice;
     _blesky8 setPos [6074.8604, 7402.5205, 970];  
     _blesky8 setVectorUp [0,0,1];
     _blesky9 = "Lightning1_F" createVehicle _pozice;
     _blesky9 setPos [6074.8604, 7402.5205, 1120];  
     _blesky9 setVectorUp [0,0,1];
     sleep 0.25;
     deleteVehicle _blesky1;  
     deleteVehicle _blesky2; 
     deleteVehicle _blesky3; 
     deleteVehicle _blesky4; 
     deleteVehicle _blesky5; 
     deleteVehicle _blesky6; 
     deleteVehicle _blesky7; 
     deleteVehicle _blesky8; 
     deleteVehicle _blesky9;
	};
};
bl_disable = {
		if (ns_blow_disable_vehicles) then {
		_count_vehicles = count vehicles;
		diag_log format["[NAC BLOWOUT SERVER] :: bl_disable (_count_vehicles = %1)", _count_vehicles];
		for [{_c = 0}, {_c <= _count_vehicles}, {_c = _c + 1}] do {
        _vehikl = vehicles select _c;
        if (_vehikl isKindOf "AllVehicles") then {
			_vehiklfuel = fuel _vehikl;
			//set fuel to 0
            _vehikl setFuel 0;
			waitUntil(!ns_blow_status);
			//set fuel back to what it was
			_vehikl setFuel _vehiklfuel;			
        };
      };
	};
};
bl_damage = {
	if (ns_blow_damage_vehicles) then {
		_count_vehicles = count vehicles;
		diag_log format["[NAC BLOWOUT SERVER] :: bl_damage (_count_vehicles = %1)", _count_vehicles];
		for [{_c = 0}, {_c <= _count_vehicles}, {_c = _c + 1}] do {
        _vehikl = vehicles select _c;
        if (_vehikl isKindOf "AllVehicles") then {
          if ((damage _vehikl) <= 0.99) then {
            _vehikl setDamage (damage _vehikl - ns_blow_vehicle_damageamount);
            _vehikl setFuel 0;
            diag_log format["[NAC BLOWOUT SERVER] :: [V] %1 has been damaged by blowout by 0.90", _vehikl];
          };  
        };
      };    
    };
};
// init
while {true} do {
	if (isNil("ns_blow_emp")) then { ns_blow_emp = false; }; 
 if (isNil("ns_blowout")) then { ns_blowout = true; }; 
 if (isNil("ns_blow_delaymod")) then { ns_blow_delaymod = 1; };
 if (isNil("ns_blow_prep")) then { ns_blow_prep = false; };
 
private["_prodleva"];
_prodleva = random (6000 * ns_blow_delaymod);

while {_prodleva < (3000 * ns_blow_delaymod)} do {
  _prodleva = random (6000 * ns_blow_delaymod);
};
  
  diag_log format["[NAC BLOWOUT SERVER] :: Next blowout in _delay (_delay = %1), delay modifier is %2 (ns_blow_delaymod)", _prodleva, ns_blow_delaymod];
  sleep _prodleva;

  if(!ns_blowout) then {
    diag_log format["[NAC BLOWOUT SERVER] :: Blowout module is temporarily OFF ns_blowout (ns_blowout = %1)", ns_blowout];
  } else {
    diag_log format["[NAC BLOWOUT SERVER] :: Blowout module is ON ns_blowout (ns_blowout = %1)", ns_blowout];
  };
  
  // Stop variable check
  waitUntil{ns_blowout};

  // Preparations before blowout - APSI / players running to take a cover
  ns_blow_prep = true;
  publicVariable "ns_blow_prep";
  diag_log format["[NAC BLOWOUT SERVER] :: Preparations are under way (ns_blow_prep = %1)", ns_blow_prep];
  sleep ns_prep_time;
  ns_blow_prep = false;
  publicVariable "ns_blow_prep";
  diag_log format["[NAC BLOWOUT SERVER] :: Preparations are finished (ns_blow_prep = %1)", ns_blow_prep];
  sleep 5;
  // main blowout variable - 1 == blowout in progress, 0 == no current blowout
  ns_blow_status = true;
  publicVariable "ns_blow_status";
  diag_log format["[NAC BLOWOUT SERVER] :: Blowout in progress (ns_blow_status = %1)", ns_blow_status];
  sleep 2;
  if (ns_blow_status) then {
    ns_blow_action = true;
    publicVariable "ns_blow_action";
    diag_log format["[NAC BLOWOUT SERVER] :: Blowout actions in progress (ns_blow_action = %1)", ns_blow_action];
	_bul = [] call bl_flashes;
    sleep 7.20;
    _bul = [] call bl_flashes;
    sleep 1; 
    _bul = [] call bl_flashes;
    sleep 4.3;
    _bul = [] call bl_flashes;
    sleep 3;
    _bul = [] call bl_flashes;
    sleep 1;
    _bul = [] call bl_flashes;
    sleep 4;
    _bul = [] call bl_flashes;
    sleep 4;
    _bul = [] call bl_flashes;
	//Damage vehicles
	_bul = [] call bl_damage;
	_bul = [] call bl_disable;
   sleep 10;
    ns_blow_action = false;
    publicVariable "ns_blow_action";
    diag_log format["[NAC BLOWOUT SERVER] :: Blowout actions finished (ns_blow_action = %1)", ns_blow_action];
  };
  sleep 10;
  ns_blow_status = false; 
  publicVariable "ns_blow_status";
  diag_log format["[NAC BLOWOUT SERVER] :: Blowout finished (ns_blow_status = %1)", ns_blow_status];
};
