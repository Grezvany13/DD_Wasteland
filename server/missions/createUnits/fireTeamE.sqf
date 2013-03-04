
//Author: Art Vandelay
//Created on: 16/02/2013 


if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5"];

_group = _this select 0;
_pos = _this select 1;

//Leader (Sniper)
_leader = _group createUnit ["Policeman", [(_pos select 0) + 1, (_pos select 1) - 2, 0], [], 0, "FORM"];
_leader addMagazine "20Rnd_9x39_SP5_VSS";
_leader addMagazine "20Rnd_9x39_SP5_VSS";
_leader addMagazine "20Rnd_9x39_SP5_VSS";
_leader addMagazine "SmokeShellBlue";
_leader addMagazine "SmokeShellOrange";
_leader addMagazine "HandGrenade_West";
_leader addWeapon "VSS_Vintorez";

//Rifleman
_man2 = _group createUnit ["Woodlander4", [(_pos select 0) + 1, (_pos select 1) - 3, 0], [], 0, "FORM"];
_man2 addMagazine "30Rnd_545x39_AK";
_man2 addMagazine "30Rnd_545x39_AK";
_man2 addMagazine "30Rnd_545x39_AK";
_man2 addWeapon "AK_107_kobra";

//Rifleman
_man3 = _group createUnit ["Woodlander4", [(_pos select 0) + 1, (_pos select 1) - 4, 0], [], 0, "FORM"];
_man3 addMagazine "30Rnd_545x39_AK";
_man3 addMagazine "30Rnd_545x39_AK";
_man3 addMagazine "30Rnd_545x39_AK";
_man3 addWeapon "AK_107_kobra";

//Rifleman
_man4 = _group createUnit ["Woodlander4", [(_pos select 0) + 1, (_pos select 1) - 5, 0], [], 0, "FORM"];
_man4 addMagazine "30Rnd_545x39_AK";
_man4 addMagazine "30Rnd_545x39_AK";
_man4 addMagazine "30Rnd_545x39_AK";
_man4 addWeapon "AK_107_kobra";

//Support
_man5 = _group createUnit ["Woodlander4", [(_pos select 0) + 1, (_pos select 1) - 6, 0], [], 0, "FORM"];
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addWeapon "m240_scoped_EP1";

_leader = leader _group;
_leader setVehicleInit "null = [this,'UPS','random','nowait'] execVM 'addons\scripts\UPSMON.sqf'";
processInitCommands;
