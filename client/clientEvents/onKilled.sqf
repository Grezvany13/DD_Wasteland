//	@file Version: 1.0
//	@file Name: onKilled.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

_player = (_this select 0) select 0;
_killer = (_this select 0) select 1;
if(isnil {_player getVariable "cmoney"}) then {_player setVariable["cmoney",0,true];};

_getUID = getPlayerUID player;

PlayerCDeath = [_player];
publicVariable "PlayerCDeath";
if (isServer) then {
	_id = PlayerCDeath spawn serverPlayerDied; 
};

if(!local _player) exitwith {};

if((_player != _killer) && (vehicle _player != vehicle _killer) && (playerSide == side _killer) && (str(playerSide) in ["WEST", "EAST"])) then {
	pvar_PlayerTeamKiller = objNull;
	if(_killer isKindOf "CAManBase") then {
		pvar_PlayerTeamKiller = _killer;
	} else {
		_veh = (_killer);
		_trts = configFile >> "CfgVehicles" >> typeof _veh >> "turrets";
		_paths = [[-1]];
		if (count _trts > 0) then {
			for "_i" from 0 to (count _trts - 1) do {
				_trt = _trts select _i;
				_trts2 = _trt >> "turrets";
				_paths = _paths + [[_i]];
				for "_j" from 0 to (count _trts2 - 1) do {
					_trt2 = _trts2 select _j;
					_paths = _paths + [[_i, _j]];
				};
			};
		};
		_ignore = ["SmokeLauncher", "FlareLauncher", "CMFlareLauncher", "CarHorn", "BikeHorn", "TruckHorn", "TruckHorn2", "SportCarHorn", "MiniCarHorn", "Laserdesignator_mounted"];
		_suspects = [];
		{
			_weps = (_veh weaponsTurret _x) - _ignore;
			if(count _weps > 0) then {
				_unt = objNull;
				if(_x select 0 == -1) then {_unt = driver _veh;}
				else {_unt = _veh turretUnit _x;};
				if(!isNull _unt) then {
					_suspects = _suspects + [_unt];
				};
			};
		} forEach _paths;

		if(count _suspects == 1) then {
			pvar_PlayerTeamKiller = _suspects select 0;
		};
	};
};

if(!isNull(pvar_PlayerTeamKiller)) then {
	publicVar_teamkillMessage = pvar_PlayerTeamKiller;
	publicVariable "publicVar_teamkillMessage";
};

private["_a","_b","_c","_d","_e","_f","_m","_player","_killer", "_to_delete"];

_to_delete = [];
_to_delete_quick = [];

if((_player getVariable "cmoney") > 0) then {
	_m = "EvMoney" createVehicle (position _player);
	_m setVariable["money", (_player getVariable "cmoney"), true];
	_m setVariable ["owner", "world", true];
	_to_delete = _to_delete + [_m];
};

if((_player getVariable "medkits") > 0) then {
	for "_a" from 1 to (_player getVariable "medkits") do {	
		_m = "CZ_VestPouch_EP1" createVehicle (position _player);
		_to_delete = _to_delete + [_m];
	};
};

if((_player getVariable "repairkits") > 0) then {
	for "_b" from 1 to (_player getVariable "repairkits") do {	
		_m = "Suitcase" createVehicle (position _player);
		_to_delete = _to_delete + [_m];
	};
};

// DROP FOOD AND WATER IF NOT ENOUGHT ON MAP
_allVehicles = vehicles;
_vehicleCountFood = 0;
_vehicleCountWater = 0;

{
	_vehicle = _X;
	_vehicleType = Format["%1",typeOf _x];
	
	//deleteVehicle _vehicle;
	
	if( (_vehicleType isKindOf "Land_Bag_EP1") OR (_vehicleType isKindOf "Land_Teapot_EP1") ) then {
	
		if(_vehicleType isKindOf "Land_Bag_EP1") then {
			_vehicleCountFood = _vehicleCountFood + 1;
		} else {
			_vehicleCountWater = _vehicleCountWater + 1;
		};
	};
	
}forEach _allVehicles;

if((_player getVariable "canfood") > 0 AND _vehicleCountFood < 50) then {
	for "_c" from 1 to (_player getVariable "canfood") do {	
		player setVariable["canfood",(player getVariable "canfood")-1,true];
		_temp1 = "Land_Bag_EP1" createVehicle (position player);
		_temp1 setPos [(_pos select 0)+1, _pos select 1, _pos select 2];
		_temp1 setVariable["food",10,true];
	};
};

if((_player getVariable "water") > 0 AND _vehicleCountWater < 50) then {
	for "_d" from 1 to (_player getVariable "water") do {	
		player setVariable["water", (player getvariable "water")-1,true];
		_temp2 = "Land_Teapot_EP1" createVehicle (position player);
		_temp2 setPos _pos;
	};
};

if((_player getVariable "fuelFull") > 0) then {
	for "_e" from 1 to (_player getVariable "fuelFull") do {	
		player setVariable["fuelFull",(player getVariable "fuelFull")-1,true];
		_temp3 = "Fuel_can" createVehicle (position player);
		_temp3 setVariable["fuel", true, true];
		_temp3 setPos _pos;
	};
};

true spawn {
	waitUntil {playerRespawnTime < 2};
	titleText ["", "BLACK OUT", 1];
};