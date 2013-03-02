//	@file Version: 1.0
//	@file Name: serverVars.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [404] Pulse
//	@file Created: 20/11/2012 05:19
//	@file Args:
// --------------------------------------------------------------------------------------------------- \\
// ----------  !DO NOT CHANGE ANYTHING BELOW THIS POINT UNLESS YOU KNOW WHAT YOU ARE DOING!	---------- \\
// ----------																				---------- \\
// ----------			404Games are not responsible for anything that may happen 			---------- \\
// ----------			 as a result of unauthorised modifications to this file.			---------- \\
// --------------------------------------------------------------------------------------------------- \\
#include "setup.sqf"
if(!X_Server) exitWith {};

diag_log format["WASTELAND SERVER - Initilizing Server Vars"];

CVG_weapons = [];
CVG_weapons = CVG_rifles;
CVG_weapons = CVG_weapons + CVG_Scoped;
CVG_weapons = CVG_weapons + CVG_Heavy;
CVG_weapons = CVG_weapons + CVG_pistols;
CVG_weapons = CVG_weapons + CVG_Launchers;

#ifdef __A2NET__
missionStartTime = 0;
netTime = 0;
#endif

sideMissionPos = "";
mainMissionPos = "";

currentVehicles = [];
publicVariable "currentVehicles";
pvar_teamSwitchList = [];
publicVariable "pvar_teamSwitchList";
pvar_teamKillList = [];
publicVariable "pvar_teamKillList";
pvar_beaconListBlu = []; 
publicVariable "pvar_beaconListBlu";
pvar_beaconListRed = []; 
publicVariable "pvar_beaconListRed";
pvar_beaconListInd = [];
publicVariable "pvar_beaconListInd";
clientMissionMarkers = [];
publicVariable "clientMissionMarkers";
clientRadarMarkers = [];
publicVariable "clientRadarMarkers";
currentDate = [];
publicVariable "currentDate";
currentInvites = [];
publicVariable "currentInvites";
                  
"PlayerCDeath" addPublicVariableEventHandler {_id = (_this select 1) spawn server_playerDied};

currentStaticHelis = []; // Storage for the heli marker numbers so that we don't spawn wrecks on top of live helis

//Civilian Vehicle List - Random Spawns
civilianVehicles = ["car_hatchback",
					"car_sedan",
					"datsun1_civil_2_covered",
					"SkodaGreen",
					"Lada2",
					"V3S_Civ",
					"UralCivil",
					"VWGolf",
					"MMT_Civ",
					"Ikarus_TK_CIV_EP1",
					"Lada1_TK_CIV_EP1",
					"Old_moto_TK_Civ_EP1",
					"S1203_TK_CIV_EP1",
					"UAZ_Unarmed_TK_CIV_EP1",
					"ATV_US_EP1",
					"BAF_Offroad_W",
					"Ikarus",
					"Lada1",
					"LadaLM",
					"M1030",
					"MMT_Civ",
					"MMT_USMC",
					"Skoda",
					"SkodaBlue",
					"SkodaGreen",
					"SkodaRed",
					"TT650_Civ",
					"TT650_Gue",
					"UralCivil",
					"UralCivil2",
					"datsun1_civil_1_open",
					"datsun1_civil_3_open",
					"hilux1_civil_1_open",
					"hilux1_civil_2_covered",
					"hilux1_civil_3_open",
					"tractor",
					"Lada2_TK_CIV_EP1",
					"LandRover_CZ_EP1",
					"LandRover_TK_CIV_EP1",
					"Old_bike_TK_CIV_EP1",
					"SUV_TK_CIV_EP1",
					"Ural_TK_CIV_EP1",
					"V3S_Open_TK_CIV_EP1",
					"VolhaLimo_TK_CIV_EP1",
					"Volha_2_TK_CIV_EP1",
					"Volha_1_TK_CIV_EP1",
					"hilux1_civil_3_open_EP1",
					"S1203_ambulance_EP1"];

//Military Vehicle List - Random Spawns
militaryVehicles = ["UAZ_CDF",
					"SUV_PMC",
					"HMMWV_DES_EP1",
					"HMMWV_M1035_DES_EP1",
					"UAZ_Unarmed_TK_EP1",
					"V3S_Open_TK_EP1",
					"V3S_TK_EP1",
					"V3S_TK_GUE_EP1",
					"Kamaz",
					"KamazOpen",
					"UAZ_INS",
					"UAZ_RU",
					"UralOpen_CDF",
					"UralOpen_INS",
					"Ural_CDF",
					"Ural_INS",
					"MTVR",
					"BAF_Offroad_W",
					"HMMWV",
					"HMMWV_Ambulance",
					"S1203_ambulance_EP1",
					"GAZ_Vodnik_MedEvac"];

//Armed Military Vehicle List - Random Spawns
armedMilitaryVehicles = ["ArmoredSUV_PMC",
							"Pickup_PK_GUE",
							"UAZ_MG_TK_EP1",
							"LandRover_MG_TK_INS_EP1",
							"HMMWV_M2",
							"HMMWV_Armored",
							"HMMWV_MK19",
							"HMMWV_TOW",
							"MMWV_M1151_M2_CZ_DES_EP1",
							"HMMWV_M998_crows_M2_DES_EP1",
							"HMMWV_M998_crows_MK19_DES_EP1",
							"HMMWV_MK19_DES_EP1",
							"LandRover_MG_TK_EP1",
							"LandRover_SPG9_TK_EP1",
							"LandRover_Special_CZ_EP1",
							"Offroad_DSHKM_TK_GUE_EP1",
							"Offroad_SPG9_TK_GUE_EP1",
							"Pickup_PK_TK_GUE_EP1",
							"UAZ_AGS30_TK_EP1",
							"Offroad_DSHKM_Gue",
							"Offroad_SPG9_Gue",
							"GAZ_Vodnik"];

//Item Config
pickupList = ["Satelit",
				"EvMoney",
				"Suitcase",
				"Fuel_can"];

//Object List - Random Spawns.
objectList = ["Land_Barrel_water",
				"Land_prebehlavka",
				"Land_Misc_Cargo1E_EP1",
				"Land_Misc_Cargo1Eo_EP1",
				"Misc_cargo_cont_small_EP1",
				"Base_WarfareBContructionSite",
				"Gue_WarfareBContructionSite",
				"Land_leseni2x",
                "Fort_Crate_wood",
                "Land_CamoNet_NATO",
				"Land_CamoNet_NATO",
				"Land_Barrel_water",
				"Land_stand_small_EP1",
                "Land_stand_small_EP1",
				"Base_WarfareBBarrier10xTall",
				"Base_WarfareBBarrier10x",
				"Base_WarfareBBarrier5x",
				"Base_WarfareBBarrier5x",
				"Base_WarfareBBarrier5x",
                "Base_WarfareBBarrier10xTall",
                "Base_WarfareBBarrier10x",
                "Base_WarfareBBarrier5x",
				"Base_WarfareBBarrier5x",
				"Base_WarfareBBarrier5x",
				"Base_WarfareBBarrier5x",
				"Base_WarfareBBarrier5x",
				"Land_Misc_deerstand",
				"Fort_Barricade",
				"Concrete_Wall_EP1",
                "Concrete_Wall_EP1",
                "Land_fort_bagfence_long",
                "Land_fort_bagfence_long",
                "Land_fort_bagfence_round",
                "Land_fort_bagfence_corner",
                "Land_BagFenceLong",
                "Land_BagFenceLong",
                "Land_fort_artillery_nest",
				"Land_fortified_nest_small_EP1",
				"Land_Misc_deerstand",
                "Land_fort_rampart",
                "Land_fort_rampart_EP1",
				"Land_HBarrier_large",
                "Land_HBarrier_large",
				"Land_Misc_Scaffolding",
				"Land_Fort_Watchtower_EP1",
                "Land_Fort_Watchtower",
				"Land_fortified_nest_big",
				"RampConcrete",
				"WarfareBDepot",
				"WarfareBCamp",
                "Hedgehog",
				"SearchLight",
                "Land_ConcreteRamp",
                "Land_CncBlock_Stripes",
                "Land_Campfire_burning",
                "Land_GuardShed",
                "Land_tent_east",
				"Land_ConcreteBlock"];
                                         
//Object List - Random Spawns.
staticWeaponsList = ["M2StaticMG_US_EP1",
				"KORD_high",
				"DSHKM_TK_INS_EP1"];

//Object List - Random Helis.
staticHeliList = ["UH1H_TK_GUE_EP1",
				"Mi17_Civilian",
                "MV22",
                "CH_47F_EP1",
                "MH6J_EP1",
                "UH60M_EP1",
				"Mi171Sh_CZ_EP1",
				"UH1H_TK_GUE_EP1",
				"UH60M_MEV_EP1",
				"UH1H_TK_EP1",
				"Mi17_TK_EP1",
				"MH60S",
				"Mi17_CDF",
				"Mi17_medevac_Ins",
                "BAF_Merlin_HC3_D"];

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons = ["AK_107_kobra",
				"AK_47_M",
				"AK_47_S",
				"AK_74",
				"BAF_L85A2_RIS_ACOG",
				"bizon",
				"bizon_silenced",
				"FN_FAL",
				"G36a",
				"LeeEnfield",
				"M1014",
				"M16A2",
				"m16a4",
				"M4A1_Aim",
				"MP5A5",
				"Sa58V_EP1",
				"Saiga12K",
				"SCAR_L_CQC",
                "M9",
                "M9SD",
                "revolver_EP1",
                "Sa61_EP1",
                "UZI_EP1"];
                
MissionSpawnMarkers = [
            ["Mission_1",false],
            ["Mission_2",false],
            ["Mission_3",false],
            ["Mission_4",false],
            ["Mission_5",false],
            ["Mission_6",false],
            ["Mission_7",false],
            ["Mission_8",false],
            ["Mission_9",false],
            ["Mission_10",false],
            ["Mission_11",false],
            ["Mission_12",false],
            ["Mission_13",false],
            ["Mission_14",false],
            ["Mission_15",false],
            ["Mission_16",false],
            ["Mission_17",false],
            ["Mission_18",false],
            ["Mission_19",false],
            ["Mission_20",false],
            ["Mission_21",false],
            ["Mission_22",false],
            ["Mission_23",false],
            ["Mission_24",false],
            ["Mission_25",false],
            ["Mission_26",false],
            ["Mission_27",false],
            ["Mission_28",false],
            ["Mission_29",false],
            ["Mission_30",false],
            ["Mission_31",false],
            ["Mission_32",false],
            ["Mission_33",false],
            ["Mission_34",false],
            ["Mission_35",false],
            ["Mission_36",false],
            ["Mission_37",false],
            ["Mission_38",false],
            ["Mission_39",false],
            ["Mission_40",false],
            ["Mission_41",false],
            ["Mission_42",false],
            ["Mission_43",false],
            ["Mission_44",false],
            ["Mission_45",false],
            ["Mission_46",false],
            ["Mission_47",false],
            ["Mission_48",false],
            ["Mission_49",false],
            ["Mission_50",false]
];
CarrierMarkers = [
            ["carrier_1", false],
            ["carrier_2", false],
            ["carrier_3", false],
            ["carrier_4", false],
            ["carrier_5", false],
            ["carrier_6", false],
            ["carrier_7", false],
            ["carrier_8", false],
            ["carrier_9", false],
            ["carrier_10", false],
            ["carrier_11", false],
            ["carrier_12", false],
            ["carrier_13", false],
            ["carrier_14", false],
            ["carrier_15", false],
            ["carrier_16", false],
            ["carrier_17", false],
            ["carrier_18", false],
            ["carrier_19", false],
            ["carrier_20", false],
            ["carrier_21", false]
];