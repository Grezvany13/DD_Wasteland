//	@file Version: 1.0
//	@file Name: mission_AirWreck.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 15:19
//	@file Args:
#include "setup.sqf"
#include "sideMissionDefines.sqf";

if(!isServer) exitwith {};

private ["_result","_missionMarkerName","_missionType","_startTime","_returnData","_randomPos","_randomIndex","_vehicleClass","_box","_box2","_vehicle","_picture","_vehicleName","_hint","_currTime","_playerPresent","_unitsAlive"];

//Mission Initialization.
_result = 0;
_missionMarkerName = "AirWreck_Marker";
_missionType = "Aircraft Wreck";
_missionRewardRadius = 1000;
_reward = 300;

#ifdef __A2NET__
_startTime = floor(netTime);
#else
_startTime = floor(time);
#endif



diag_log format["WASTELAND SERVER - Side Mission Started: %1",_missionType];

//Get Mission Location
_returnData = call createMissionLocation;
_randomPos = _returnData select 0;
_randomIndex = _returnData select 1;

diag_log format["WASTELAND SERVER - Side Mission Waiting to run: %1",_missionType];
[sideMissionDelayTime] call createWaitCondition;
diag_log format["WASTELAND SERVER - Side Mission Resumed: %1",_missionType];

[_missionMarkerName,_randomPos,_missionType] call createClientMarker;

//Vehicle Class, Posistion, Fuel, Ammo, Damage
_vehicle = ["C130J_US_EP1",[(_randomPos select 0) + 50, (_randomPos select 1) + 50,0],0,0,1,"NONE"] call createMissionVehicle;

_box = createVehicle ["USLaunchersBox",[(_randomPos select 0), (_randomPos select 1),0],[], 0, "NONE"];
[_box,"mission_Side_USLaunchers"] call fn_refillbox;

_box2 = createVehicle ["USSpecialWeaponsBox",[(_randomPos select 0), (_randomPos select 1) - 10,0],[], 0, "NONE"];
[_box2,"mission_Side_USSpecial"] call fn_refillbox;

_picture = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Side Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t>, has come down under enemy fire!</t>", _missionType, _picture, _vehicleName, sideMissionColor, subTextColor];
[nil,nil,rHINT,_hint] call RE;

CivGrpM1 = createGroup civilian;
[CivGrpM1,_randomPos] execVM "server\missions\factoryMethods\createUnits\securityaGroup.sqf";
CivGrpM2 = createGroup civilian;
[CivGrpM2,_randomPos] execVM "server\missions\factoryMethods\createUnits\securitybGroup.sqf";
CivGrpM3 = createGroup civilian;
[CivGrpM3,_randomPos] execVM "server\missions\factoryMethods\createUnits\securitybGroup.sqf";

diag_log format["WASTELAND SERVER - Side Mission Waiting to be Finished: %1",_missionType];
#ifdef __A2NET__
_startTime = floor(netTime);
#else
_startTime = floor(time);
#endif
waitUntil
{
    sleep 1; 
	_playerPresent = false;
	#ifdef __A2NET__
	_currTime = floor(netTime);
	#else
    _currTime = floor(time);
	#endif
    if(_currTime - _startTime >= sideMissionTimeout) then {_result = 1;};
    {if((isPlayer _x) AND (_x distance _box <= missionRadiusTrigger)) then {_playerPresent = true};}forEach playableUnits;
    _Group1Alive = ({alive _x} count units CivGrpM1);
    _Group2Alive = ({alive _x} count units CivGrpM2);
    _Group3Alive = ({alive _x} count units CivGrpM3);

    _UnitsAlive = _Group1Alive + _Group2Alive + _Group3Alive;
    (_result == 1) OR ((_playerPresent) AND (_unitsAlive < 1)) OR ((damage _box) == 1)
};

if(_result == 1) then
{
	//Mission Failed.
    deleteVehicle _box;
    deleteVehicle _box2;
    deleteVehicle _vehicle;
    {deleteVehicle _x;}forEach units CivGrpM1;
    {deleteVehicle _x;}forEach units CivGrpM2;
    {deleteVehicle _x;}forEach units CivGrpM3;
    deleteGroup CivGrpM1;
    deleteGroup CivGrpM2;
    deleteGroup CivGrpM3;
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
	[nil,nil,rHINT,_hint] call RE;
    diag_log format["WASTELAND SERVER - Side Mission Failed: %1",_missionType];
} else {
	//Mission Complete.
    deleteVehicle _vehicle;
    deleteGroup CivGrpM1;
    deleteGroup CivGrpM2;
    deleteGroup CivGrpM3;

    //Cash Reward
    {
        if ((_x distance _randomPos) <= _missionRewardRadius) then {
            _x setVariable ["cmoney", (_x getVariable "cmoney")+ _reward, true];
        };
    } forEach playableUnits;

    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The ammo caches have been collected well done team</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
	[nil,nil,rHINT,_hint] call RE;
    diag_log format["WASTELAND SERVER - Side Mission Success: %1",_missionType];
};

//Reset Mission Spot.
MissionSpawnMarkers select _randomIndex set[1, false];
[_missionMarkerName] call deleteClientMarker;