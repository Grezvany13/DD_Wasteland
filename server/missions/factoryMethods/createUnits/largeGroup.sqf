//	@file Version: 1.0
//	@file Name: largeGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5","_man6","_man7","_man8","_man9","_man10"];

_group = _this select 0;
_pos = _this select 1;

//Anti Air no weapon
_leader = _group createunit ["TK_Special_Forces_EP1", [(_pos select 0) + 30, _pos select 1, 0], [], 0.5, "Form"];
_leader addMagazine "Strela";
_leader addWeapon "Strela";
_leader addMagazine "30Rnd_556x45_G36";
_leader addMagazine "30Rnd_556x45_G36";
_leader addMagazine "30Rnd_556x45_G36";
_leader addWeapon "G36a";

//Support
_man2 = _group createunit ["TK_INS_Soldier_EP1", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
_man2 addMagazine "100Rnd_556x45_M249";
_man2 addMagazine "100Rnd_556x45_M249";
_man2 addWeapon "M249_m145_EP1";

//Rifle_man
_man3 = _group createunit ["TK_GUE_Soldier_3_EP1", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man3 addMagazine "30Rnd_556x45_G36";
_man3 addMagazine "30Rnd_556x45_G36";
_man3 addMagazine "30Rnd_556x45_G36";
_man3 addWeapon "G36a";

//Rifle_man
_man4 = _group createunit ["TK_GUE_Soldier_AAT_EP1", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addWeapon "M16A4_ACG";

//Sniper
_man5 = _group createunit ["TK_GUE_Soldier_HAT_EP1", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
_man5 addMagazine "20Rnd_556x45_Stanag";
_man5 addMagazine "20Rnd_556x45_Stanag";
_man5 addMagazine "20Rnd_556x45_Stanag";
_man5 addWeapon "M4SPR";

//Rifle_man_sd
_man6 = _group createunit ["TK_INS_Soldier_AAT_EP1", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];
_man6 addMagazine "20rnd_762x51_SB_SCAR";
_man6 addMagazine "20rnd_762x51_SB_SCAR";
_man6 addMagazine "20rnd_762x51_SB_SCAR";
_man6 addWeapon "SCAR_H_CQC_CCO_SD";

//Machinegunner
_man7 = _group createunit ["TK_GUE_Soldier_MG_EP1", [(_pos select 0) - 40, _pos select 1, 0], [], 0.5, "Form"];
_man7 addMagazine "100Rnd_762x54_PK";
_man7 addMagazine "100Rnd_762x54_PK";
_man7 addWeapon "Pecheneg";

//Rifle_man
_man8 = _group createunit ["TK_INS_Soldier_MG_EP1", [_pos select 0, (_pos select 1) + 50, 0], [], 0.5, "Form"];
_man8 addMagazine "64Rnd_9x19_Bizon";
_man8 addMagazine "64Rnd_9x19_Bizon";
_man8 addMagazine "64Rnd_9x19_Bizon";
_man8 addWeapon "Bizon";

//Sniper
_man9 = _group createunit ["TK_INS_Soldier_AT_EP1", [_pos select 0, (_pos select 1) - 50, 0], [], 0.5, "Form"];
_man9 addMagazine "20Rnd_556x45_Stanag";
_man9 addMagazine "20Rnd_556x45_Stanag";
_man9 addMagazine "20Rnd_556x45_Stanag";
_man9 addWeapon "M8_sharpshooter";

//Rifle_man
_man10 = _group createunit ["TK_CIV_Takistani04_EP1", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man10 addMagazine "30Rnd_556x45_Stanag";
_man10 addMagazine "30Rnd_556x45_Stanag";
_man10 addMagazine "30Rnd_556x45_Stanag";
_man10 addWeapon "M16A2";

_leader = leader _group;
[_group, _pos] call defendArea;