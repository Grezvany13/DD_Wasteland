//	@file Version: 1.0
//	@file Name: securityaGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4"];

_group = _this select 0;
_pos = _this select 1;

//Anti Vehicle
_leader = _group createunit ["Woodlander4", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
_leader addMagazine "Dragon_EP1";
_leader addWeapon "M47Launcher_EP1";
_leader addMagazine "30Rnd_556x45_G36SD";
_leader addMagazine "30Rnd_556x45_G36SD";
_leader addMagazine "30Rnd_556x45_G36SD";
_leader addWeapon "G36_C_SD_camo";

//Rifleman
_man2 = _group createunit ["Woodlander4", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
_man2 addMagazine "30Rnd_762x39_SA58";
_man2 addMagazine "30Rnd_762x39_SA58";
_man2 addMagazine "30Rnd_762x39_SA58";
_man2 addWeapon "Sa58V_RCO_EP1";

//Rifleman
_man3 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man3 addMagazine "30Rnd_762x39_SA58";
_man3 addMagazine "30Rnd_762x39_SA58";
_man3 addMagazine "30Rnd_762x39_SA58";
_man3 addWeapon "Sa58V_RCO_EP1";

//Sniper
_man4 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
_man4 addMagazine "5Rnd_86x70_L115A1";
_man4 addMagazine "5Rnd_86x70_L115A1";
_man4 addMagazine "5Rnd_86x70_L115A1";
_man4 addMagazine "5Rnd_86x70_L115A1";
_man4 addMagazine "5Rnd_86x70_L115A1";
_man4 addMagazine "5Rnd_86x70_L115A1";
_man4 addWeapon "BAF_LRR_scoped";

_leader = leader _group;
[_group, _pos] call defendArea;