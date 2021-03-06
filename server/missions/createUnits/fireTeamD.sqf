
//Author: Art Vandelay
//Created on: 16/02/2013 


if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5"];

_group = _this select 0;
_pos = _this select 1;

//Leader
_leader = _group createUnit ["Policeman", [_pos select 0, (_pos select 1) - 6, 0], [], 0, "FORM"];
_leader addMagazine "20Rnd_762x51_DMR";
_leader addMagazine "20Rnd_762x51_DMR";
_leader addMagazine "20Rnd_762x51_DMR";
_leader addMagazine "20Rnd_762x51_DMR";
_leader addMagazine "SmokeShellOrange";
_leader addMagazine "SmokeShellPurple";
_leader addMagazine "HandGrenade_West";
_leader addWeapon "M14_EP1";

//Rifleman
_man2 = _group createUnit ["Woodlander4", [_pos select 0, (_pos select 1) - 7, 0], [], 0, "FORM"];
_man2 addMagazine "30Rnd_556x45_G36SD";
_man2 addMagazine "30Rnd_556x45_G36SD";
_man2 addMagazine "30Rnd_556x45_G36SD";
_man2 addMagazine "30Rnd_556x45_G36SD";
_man2 addWeapon "G36_C_SD_camo";

//Rifleman
_man3 = _group createUnit ["Woodlander4", [_pos select 0, (_pos select 1) - 8, 0], [], 0, "FORM"];
_man3 addMagazine "30Rnd_556x45_G36SD";
_man3 addMagazine "30Rnd_556x45_G36SD";
_man3 addMagazine "30Rnd_556x45_G36SD";
_man3 addMagazine "30Rnd_556x45_G36SD";
_man3 addWeapon "G36_C_SD_camo";

//Sniper
_man4 = _group createUnit ["Woodlander4", [_pos select 0, (_pos select 1) - 9, 0], [], 0, "FORM"];
_man4 addMagazine "20rnd_762x51_B_SCAR";
_man4 addMagazine "20rnd_762x51_B_SCAR";
_man4 addMagazine "20rnd_762x51_B_SCAR";
_man4 addMagazine "20rnd_762x51_B_SCAR";
_man4 addWeapon "SCAR_H_LNG_Sniper";

//Support
_man5 = _group createUnit ["Woodlander4", [(_pos select 0) + 1, (_pos select 1) - 1, 0], [], 0, "FORM"];
_man5 addMagazine "100Rnd_556x45_BetaCMag";
_man5 addMagazine "100Rnd_556x45_BetaCMag";
_man5 addMagazine "100Rnd_556x45_BetaCMag";
_man5 addWeapon "M8_SAW";

_leader = leader _group;
_leader setVehicleInit "null = [this,'UPS','random','nowait'] execVM 'addons\scripts\UPSMON.sqf'";
processInitCommands;