
//Author: Art Vandelay
//Created on: 16/02/2013 


if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_randomVehicle","_vehicle"];

_group = _this select 0;
_pos = _this select 1;

//Leader
_leader = _group createUnit ["Policeman", [(_pos select 0) + 1, (_pos select 1) - 7, 0], [], 0, "FORM"];
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
_man2 = _group createUnit ["Woodlander4", [(_pos select 0) + 1, (_pos select 1) - 8, 0], [], 0, "FORM"];
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "HandGrenade_West";
_man2 addMagazine "HandGrenade_West";
_man2 addWeapon "M8_compact";

//Rifleman
_man3 = _group createUnit ["Woodlander4", [(_pos select 0) + 1, (_pos select 1) - 9, 0], [], 0, "FORM"];
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "HandGrenade_West";
_man3 addMagazine "HandGrenade_West";
_man3 addWeapon "M8_compact";

//Random vehicle
_randomVehicle = ["M1128_MGS_EP1", "AAV", "BMP2_UN_EP1", "BAF_Jackal2_L2A1_w", "BTR60_TK_EP1", "M113Ambul_TK_EP1", "BRDM2_TK_GUE_EP1"] call BIS_fnc_selectRandom;
_vehicle = createVehicle [_randomVehicle, [(_pos select 0) - 20, (_pos select 1) - 20, 0], [], 0, "FORM"];

//Assign positions and shove them in vehicle
_leader = leader _group;
_leader assignAsCommander _vehicle;
[_leader] orderGetIn true;
sleep 0.2;
_leader moveInCommander _vehicle;

_man2 assignAsGunner _vehicle;
[_man2] orderGetIn true;
sleep 0.2;
_man2 moveInGunner _vehicle;

_man3 assignAsDriver _vehicle;
[_man3] orderGetIn true;
sleep 0.2;
_man3 moveInDriver _vehicle;

_leader setVehicleInit "null = [this,'UPS','nowait'] execVM 'addons\scripts\UPSMON.sqf'";

_vehicle setVehicleLock "LOCKED";
_vehicle setVariable ["original",1,true];
_vehicle setVariable ["R3F_LOG_disabled", true, true];
processInitCommands;