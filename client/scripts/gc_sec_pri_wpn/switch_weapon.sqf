// GeneralCarver Second Primary Weapon Switch Weapon Script
// Author: GeneralCarver
// Version: 2
// Date: 12/3/10
// Description: This script manages switching a player's weapons.




// ============================================================================
// Define Variables

private ["_primary_weapon", "_gc_initial_primary_weapon_in_hands"];
_primary_weapon = primaryweapon player;

// End Define Variables
// ============================================================================





// ============================================================================
// Begin Script

// exit script if it is already running
if (gc_sec_pri_wpn_script_active) exitWith 
	{
	// nothing, script is active.
	};

// script not running, set as running.
gc_sec_pri_wpn_script_active = true;

// check if player has primary weapon.
if (_primary_weapon == "") then 
	{
	// player does not have primary weapon.
	// Check if player has weapon on back...
	if (gc_sec_pri_wpn_stored_weapon == "NONE") then 
		{
		// player does not have weapon on back.
		// do nothing. script ends.
		} else 
		{
		// player has weapon on back.
		titleText ["Retrieving weapon...", "PLAIN DOWN"];
		// add stored weapon to player.
		player addweapon gc_sec_pri_wpn_stored_weapon;
		gc_sec_pri_wpn_stored_weapon = "NONE";
		sleep 2;
		titleText ["Press ""F"" to cycle to weapon.", "PLAIN DOWN"];
		sleep 3;
		// clear message on screen.
		titleText ["  ", "PLAIN DOWN"];
		};
	} else  
	{
	// player has primary weapon.
	// remove primary weapon from player.
	player removeweapon _primary_weapon;
	// check if player has a weapon in storage.
	if (gc_sec_pri_wpn_stored_weapon == "NONE") then 
		{
		// player does not have weapon on back.
		titleText ["Slinging weapon onto back...", "PLAIN DOWN"];
		gc_sec_pri_wpn_stored_weapon = _primary_weapon;
		sleep 2;
		titleText ["  ", "PLAIN DOWN"];
		} else 
		{
		// player has weapon on back..
		// display message that weapons are being switched.
		titleText ["Switching primary weapons...", "PLAIN DOWN"];
		// remove primary weapon..
		player removeweapon _primary_weapon;
		sleep 1;
		// Add weapon to player.
		player addweapon gc_sec_pri_wpn_stored_weapon;
		// set stored weapon to none.
		gc_sec_pri_wpn_stored_weapon = _primary_weapon;
		sleep 2;
		// display message to cycle to shouldered weapon.
		titleText ["Press ""F"" to cycle to weapon.", "PLAIN DOWN"];
		sleep 3;
		// clear message on screen.
		titleText ["  ", "PLAIN DOWN"];
		};
	};


sleep 1;

// note that script is not running.
gc_sec_pri_wpn_script_active = false;

//
// ============================================================================




// ============================================================================
// Change Log

/*

v1 - Released.
v2 - 12-3-10 - Added formatting to script. Removed condition which produced an error related to adding a null weapon. Added message to press F to cycle to weapon.

*/