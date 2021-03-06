
//Author: Art Vandelay
//Created on: 16/02/2013 


if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5"];

_group = _this select 0;
_pos = _this select 1;

//Leader (Sniper)
_leader = _group createUnit ["Policeman", [_pos select 0, _pos select 1, 0], [], 0, "FORM"];
_leader addMagazine "20Rnd_762x51_DMR";
_leader addMagazine "20Rnd_762x51_DMR";
_leader addMagazine "20Rnd_762x51_DMR";
_leader addMagazine "20Rnd_762x51_DMR";
_leader addMagazine "SmokeShell";
_leader addMagazine "SmokeShellBlue";
_leader addMagazine "SmokeShellOrange";
_leader addMagazine "SmokeShellPurple";
_leader addMagazine "HandGrenade_West";
_leader addMagazine "HandGrenade_West";
_leader addWeapon "DMR";

//Rifleman
_man2 = _group createUnit ["Woodlander4", [(_pos select 0) + 6, _pos select 1, 0], [], 0, "FORM"];
_man2 addMagazine "30Rnd_556x45_StanagSD";
_man2 addMagazine "30Rnd_556x45_StanagSD";
_man2 addMagazine "30Rnd_556x45_StanagSD";
_man2 addMagazine "30Rnd_556x45_StanagSD";
_man2 addMagazine "1Rnd_Smoke_M203";
_man2 addWeapon "SCAR_L_CQC_CCO_SD";

//Rifleman
_man3 = _group createUnit ["Woodlander4", [(_pos select 0) + 7, _pos select 1, 0], [], 0, "FORM"];
_man3 addMagazine "30Rnd_556x45_StanagSD";
_man3 addMagazine "30Rnd_556x45_StanagSD";
_man3 addMagazine "30Rnd_556x45_StanagSD";
_man3 addMagazine "30Rnd_556x45_StanagSD";
_man3 addWeapon "SCAR_L_CQC_CCO_SD";

//Rifleman
_man4 = _group createUnit ["Woodlander4", [(_pos select 0) + 8, _pos select 1, 0], [], 0, "FORM"];
_man4 addMagazine "30Rnd_556x45_StanagSD";
_man4 addMagazine "30Rnd_556x45_StanagSD";
_man4 addMagazine "30Rnd_556x45_StanagSD";
_man4 addMagazine "30Rnd_556x45_StanagSD";
_man4 addMagazine "HandGrenade_West";
_man4 addWeapon "SCAR_L_CQC_CCO_SD";

//Support
_man5 = _group createUnit ["Woodlander4", [(_pos select 0) + 9, _pos select 1, 0], [], 0, "FORM"];
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addWeapon "m240_scoped_EP1";

_leader = leader _group;
_leader setVehicleInit "null = [this,'UPS','random','nowait'] execVM 'addons\scripts\UPSMON.sqf'";
processInitCommands;

