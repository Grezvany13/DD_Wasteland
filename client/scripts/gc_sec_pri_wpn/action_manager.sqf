// GeneralCarver Second Primary Weapon Action Manager
// Author: GeneralCarver
// Version: 2
// Date: 12/3/10
// Description: This script manages add adding and removing the switch weapon action for a player.




// ============================================================================
// Define Variables

private ["_switch_weapon_act_id"];
_switch_weapon_act_id = 9999;

//
// ============================================================================




// ============================================================================
// Begin Script

while {local player} do 
	{
	// check to add action to switch
	// check if player is alive.
	if (alive player) then 
		{
		// player is alive..
		// check if action is already added...
		if (_switch_weapon_act_id == 9999) then 
			{
			// action is not added, add it.
			_switch_weapon_act_id = player addaction ["Switch Weapon", "client\scripts\gc_sec_pri_wpn\switch_weapon.sqf", "", 0, false, true, "", ""];
			};
		};
	// check conditions to remove action and reset spare rifle..
	// check if player is not alive..
	if (alive player) then 
		{
		// nothing, player is alive.
		} else 
		{
		// player is dead. remove action.
		player removeaction _switch_weapon_act_id;
		_switch_weapon_act_id = 9999;
		};
	sleep 1;
	};

// 
// ============================================================================



// ============================================================================
// Change Log

/*
v1 - 10/18/10 - Released.
v2 - 12/3/10 - Removed script feature which checked if a revive script was active in a mission.
*/