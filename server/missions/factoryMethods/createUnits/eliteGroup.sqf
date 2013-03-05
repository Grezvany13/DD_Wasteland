//	@file Version: 1.0
//	@file Name: eliteGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5","_man6","_man7","_man8","_man9","_man10","_man11","_man12","_man13","_man14","_man15","_man16"];

_group = _this select 0;
_pos = _this select 1;

//Anti Air no weapon
_leader = _group createunit ["TK_CIV_Worker02_EP1", [(_pos select 0) + 30, _pos select 1, 0], [], 0.5, "Form"];
_leader addMagazine "Stinger";
_leader addWeapon "Stinger";
_leader addMagazine "30Rnd_556x45_G36";
_leader addMagazine "30Rnd_556x45_G36";
_leader addMagazine "30Rnd_556x45_G36";
_leader addWeapon "G36C_camo";

//Support
_man2 = _group createunit ["TK_CIV_Worker02_EP1", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
_man2 addMagazine "100Rnd_556x45_BetaCMag";
_man2 addMagazine "100Rnd_556x45_BetaCMag";
_man2 addWeapon "MG36_camo";

//Rifle_man
_man3 = _group createunit ["TK_CIV_Worker02_EP1", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man3 addMagazine "30Rnd_556x45_G36";
_man3 addMagazine "30Rnd_556x45_G36";
_man3 addMagazine "30Rnd_556x45_G36";
_man3 addWeapon "G36A_camo";

//Rifle_man
_man4 = _group createunit ["TK_CIV_Worker02_EP1", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];
_man4 addMagazine "30Rnd_556x45_G36";
_man4 addMagazine "30Rnd_556x45_G36";
_man4 addMagazine "30Rnd_556x45_G36";
_man4 addWeapon "G36K_camo";

//Sniper
_man5 = _group createunit ["TK_CIV_Worker02_EP1", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
_man5 addMagazine "5Rnd_762x51_M24";
_man5 addMagazine "5Rnd_762x51_M24";
_man5 addMagazine "5Rnd_762x51_M24";
_man5 addMagazine "5Rnd_762x51_M24";
_man5 addMagazine "5Rnd_762x51_M24";
_man5 addMagazine "5Rnd_762x51_M24";
_man5 addWeapon "M24_des_EP1";

//Rifle_man
_man6 = _group createunit ["TK_CIV_Worker02_EP1", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];
_man6 addMagazine "30Rnd_556x45_G36";
_man6 addMagazine "30Rnd_556x45_G36";
_man6 addMagazine "30Rnd_556x45_G36";
_man6 addWeapon "G36K_camo";

//Support
_man7 = _group createunit ["TK_CIV_Worker02_EP1", [(_pos select 0) - 40, _pos select 1, 0], [], 0.5, "Form"];
_man7 addMagazine "100Rnd_556x45_BetaCMag";
_man7 addMagazine "100Rnd_556x45_BetaCMag";
_man7 addWeapon "MG36_camo";

//Rifle_man
_man8 = _group createunit ["TK_CIV_Worker02_EP1", [_pos select 0, (_pos select 1) + 50, 0], [], 0.5, "Form"];
_man8 addMagazine "30Rnd_556x45_G36";
_man8 addMagazine "30Rnd_556x45_G36";
_man8 addMagazine "30Rnd_556x45_G36";
_man8 addWeapon "G36K_camo";

//Sniper
_man9 = _group createunit ["TK_CIV_Worker02_EP1", [_pos select 0, (_pos select 1) - 50, 0], [], 0.5, "Form"];
_man9 addMagazine "5Rnd_127x99_as50";
_man9 addMagazine "5Rnd_127x99_as50";
_man9 addMagazine "5Rnd_127x99_as50";
_man9 addMagazine "5Rnd_127x99_as50";
_man9 addMagazine "5Rnd_127x99_as50";
_man9 addMagazine "5Rnd_127x99_as50";
_man9 addWeapon "BAF_AS50_scoped";

//Rifle_man
_man10 = _group createunit ["TK_CIV_Worker02_EP1", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man10 addMagazine "30Rnd_556x45_G36";
_man10 addMagazine "30Rnd_556x45_G36";
_man10 addMagazine "30Rnd_556x45_G36";
_man10 addWeapon "G36K_camo";

//Rifle_man
_man11 = _group createunit ["TK_CIV_Worker02_EP1", [_pos select 0, (_pos select 1) + 60, 0], [], 0.5, "Form"];
_man11 addMagazine "30Rnd_556x45_G36";
_man11 addMagazine "30Rnd_556x45_G36";
_man11 addMagazine "30Rnd_556x45_G36";
_man11 addWeapon "G36K_camo";

//Rifle_man
_man12 = _group createunit ["TK_CIV_Worker02_EP1", [_pos select 0, (_pos select 1) - 60, 0], [], 0.5, "Form"];
_man12 addMagazine "30Rnd_556x45_G36";
_man12 addMagazine "30Rnd_556x45_G36";
_man12 addMagazine "30Rnd_556x45_G36";
_man12 addWeapon "G36K_camo";

//Rifle_man
_man13 = _group createunit ["TK_CIV_Worker02_EP1", [_pos select 0, (_pos select 1) + 70, 0], [], 0.5, "Form"];
_man13 addMagazine "30Rnd_556x45_G36";
_man13 addMagazine "30Rnd_556x45_G36";
_man13 addMagazine "30Rnd_556x45_G36";
_man13 addWeapon "G36K_camo";

//Rifle_man
_man14 = _group createunit ["TK_CIV_Worker02_EP1", [_pos select 0, (_pos select 1) - 70, 0], [], 0.5, "Form"];
_man14 addMagazine "30Rnd_556x45_G36";
_man14 addMagazine "30Rnd_556x45_G36";
_man14 addMagazine "30Rnd_556x45_G36";
_man14 addWeapon "G36K_camo";

//Rifle_man
_man15 = _group createunit ["TK_CIV_Worker02_EP1", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man15 addMagazine "30Rnd_556x45_G36";
_man15 addMagazine "30Rnd_556x45_G36";
_man15 addMagazine "30Rnd_556x45_G36";
_man15 addWeapon "G36A_camo";

//Rifle_man
_man16 = _group createunit ["TK_CIV_Worker02_EP1", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man16 addMagazine "30Rnd_556x45_G36";
_man16 addMagazine "30Rnd_556x45_G36";
_man16 addMagazine "30Rnd_556x45_G36";
_man16 addWeapon "G36A_camo";

_leader = leader _group;
[_group, _pos] call defendArea;