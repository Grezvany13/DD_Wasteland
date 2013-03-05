//	@file Version: 1.0
//	@file Name: midGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5","_man6","_man7"];

_group = _this select 0;
_pos = _this select 1;

//Anti Vehicle
_leader = _group createunit ["TK_CIV_Takistani05_EP1", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
_leader addMagazine "MAAWS_HEAT";
_leader addMagazine "MAAWS_HEAT";
_leader addWeapon "MAAWS";
_leader addMagazine "30Rnd_762x39_SA58";
_leader addMagazine "30Rnd_762x39_SA58";
_leader addMagazine "30Rnd_762x39_SA58";
_leader addWeapon "Sa58V_EP1";

//Support
_man2 = _group createunit ["TK_CIV_Takistani06_EP1", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
_man2 addMagazine "100Rnd_556x45_BetaCMag";
_man2 addMagazine "100Rnd_556x45_BetaCMag";
_man2 addWeapon "MG36";

//Rifle_man
_man3 = _group createunit ["TK_CIV_Takistani02_EP1", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man3 addMagazine "64Rnd_9x19_Bizon";
_man3 addMagazine "64Rnd_9x19_Bizon";
_man3 addMagazine "64Rnd_9x19_Bizon";
_man3 addWeapon "Bizon";

//Rifle_man
_man4 = _group createunit ["TK_CIV_Takistani03_EP1", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addWeapon "M16A2";

//Rifle_man
_man5 = _group createunit ["TK_CIV_Takistani01_EP1", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];
_man5 addMagazine "30Rnd_556x45_Stanag";
_man5 addMagazine "30Rnd_556x45_Stanag";
_man5 addMagazine "30Rnd_556x45_Stanag";
_man5 addWeapon "M16A4_ACG";

//Sniper
_man6 = _group createunit ["TK_CIV_Takistani04_EP1", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
_man6 addMagazine "20Rnd_556x45_Stanag";
_man6 addMagazine "20Rnd_556x45_Stanag";
_man6 addMagazine "20Rnd_556x45_Stanag";
_man6 addWeapon "M8_sharpshooter";

//Grenadier
_man7 = _group createunit ["TK_CIV_Takistani01_EP1", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];
_man7 addMagazine "30Rnd_556x45_Stanag";
_man7 addMagazine "30Rnd_556x45_Stanag";
_man7 addMagazine "30Rnd_556x45_Stanag";
_man7 addMagazine "1Rnd_HE_M203";
_man7 addMagazine "1Rnd_HE_M203";
_man7 addMagazine "1Rnd_HE_M203";
_man7 addWeapon "M16A4_GL";

_leader = leader _group;
[_group, _pos] call defendArea;