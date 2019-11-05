ClicksPerSecond = 0; //Sets a value to the variable
lastlogging = 0; //Sets value to the last logging
clickingstarted = false; // Default value

(findDisplay 46) displayAddEventHandler ["MouseButtonDown",{
_this spawn {
ClicksPerSecond = ClicksPerSecond + 1; clickingstarted = true; //Ups the clicks per second
if(ClicksPerSecond < 0) then {ClicksPerSecond = 0;}; //Just to make sure the value doesn't go below 0
uisleep 1; ClicksPerSecond = ClicksPerSecond - 1; // Reduces value after 1 second (helps getting clicks per second)
if(ClicksPerSecond >= 20 && clickingstarted) then { //If clicks per second is equal or above 20 it runs this
  clickingstarted = false;
  ////////////////
	disableUserInput true;
	wuxsPosUjf3Bd8gQGapUZIAHJ5BoLN766t8W3NYq = 0;
	xEkmMHy4w5uZ26hTkPM5Bf81NqCSsiUl699SuaRG = 0;
	TPWXtV9E7HhGDGATmnhohNhm4B9PSZLaQmrjTTaG = 0;
	[0] call mav_ttm_fnc_clientSendUpdateToServer;
	[1] call mav_ttm_fnc_clientSendUpdateToServer;
	[2] call mav_ttm_fnc_clientSendUpdateToServer;
	[3] call mav_ttm_fnc_clientSendUpdateToServer; 
	[] call SOCK_fnc_syncData;
  ////////////////
  if((lastLogging + 20) < time) then { // if its been 15 seconds since last time it logged it, it will log it again
    lastLogging = time;  // resets the time before it logs it again
	_uid = getPlayerUID player;
	_name = name player;
	[_name,_uid,ClicksPerSecond] remoteExec ["life_fnc_autoclicker",2];
  };
};
if(ClicksPerSecond < 0) then {ClicksPerSecond = 0;}; //Just to make sure the value doesn't go below 0
}}];





