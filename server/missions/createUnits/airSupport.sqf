
//Author: Art Vandelay
//Created on: 16/02/2013 


if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_randomVehicle","_vehicle"];

_group = _this select 0;
_pos = _this select 1;

//Leader
_leader = _group createUnit ["Policeman", [(_pos select 0) + 2, (_pos select 1) - 1, 0], [], 0, "FORM"];
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "SmokeShell";
_leader addMagazine "SmokeShellBlue";
_leader addMagazine "SmokeShellOrange";
_leader addMagazine "SmokeShellPurple";
_leader addMagazine "HandGrenade_West";
_leader addMagazine "HandGrenade_West";
_leader addWeapon "M8_compact";

//Rifleman
_man2 = _group createUnit ["Pilot", [(_pos select 0) + 2, (_pos select 1) - 2, 0], [], 0, "FORM"];
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "HandGrenade_West";
_man2 addMagazine "HandGrenade_West";
_man2 addWeapon "M8_compact";

//Rifleman
_man3 = _group createUnit ["Pilot", [(_pos select 0) + 2, (_pos select 1) - 2, 0], [], 0, "FORM"];
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "HandGrenade_West";
_man3 addMagazine "HandGrenade_West";
_man3 addWeapon "M8_compact";

//Random vehicle
_randomVehicle = ["Mi171Sh_CZ_EP1", "Mi17_UN_CDF_EP1", "UH1H_TK_GUE_EP1", "MH60S", "UH1Y"] call BIS_fnc_selectRandom;
_vehicle = createVehicle [_randomVehicle, [(_pos select 0) + 20, (_pos select 1) + 20, 0], [], 0, "FORM"];
_vehicle setVehicleInit "this addAction [('<t color=''#00EEFF''>') + ('HALO Jump') + '</t>','addons\haloJump\haloJump.sqf',[],7,false,true,'','player in _target']";
processInitCommands;

//Assign positions and shove them in vehicle
_leader = leader _group;
_leader assignAsDriver _vehicle;
[_leader] orderGetIn true;
sleep 0.2;
_leader moveInDriver _vehicle;

_man2 assignAsGunner _vehicle;
[_man2] orderGetIn true;
sleep 0.2;
_man2 moveInGunner _vehicle;

_man3 assignAsGunner _vehicle;
[_man3] orderGetIn true;
sleep 0.2;
_man3 moveInGunner _vehicle;


_leader setVehicleInit "null = [this,'UPS','nowait'] execVM 'addons\scripts\UPSMON.sqf'";

_vehicle setVehicleLock "LOCKED";
_vehicle setVariable ["original",1,true];
_vehicle setVariable ["R3F_LOG_disabled", true, true];
processInitCommands;