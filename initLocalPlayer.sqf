private ["_assignitems","_uniformItems","_vestItems","_backpackItems","_position"];
sleep 5;
if(isNil{profileNameSpace getVariable "position3"} && isNil{profileNameSpace getVariable "items3"} && isNil{profileNameSpace getVariable "backpack3"} && isNil{profileNameSpace getVariable "vest3"} && isNil{profileNameSpace getVariable "uniform3"} && isNil{profileNameSpace getVariable "headgear3"})then{
	hint "Вы впервые у нас";
	sleep 2;
	hintSilent "";
	
	profileNameSpace setVariable ["position3",		[[]]	];
	profileNameSpace setVariable ["items3",			[[]]	];
	profileNameSpace setVariable ["backpack3",		  ""	];
	profileNameSpace setVariable ["backpackitems3", [[]]	];
	profileNameSpace setVariable ["vest3",			  ""	];
	profileNameSpace setVariable ["vestitems3",		[[]]	];
	profileNameSpace setVariable ["uniform3", 		  ""	];
	profileNameSpace setVariable ["headgear3", 		  ""	];
	profileNameSpace setVariable ["uniformitems3",	[[]]	];
	profileNameSpace setVariable ["primWepPl3",		  ""	];
	profileNameSpace setVariable ["primWepIt3",		[[]]	];
	profileNameSpace setVariable ["secWepPl3",		  ""	];
	profileNameSpace setVariable ["secWepIt3",		[[]]	];
	profileNameSpace setVariable ["handgunWepPl3",	  ""	];
	profileNameSpace setVariable ["handgunMIt3",	[[]]	];
	profileNameSpace setVariable ["binocular3",		  ""	];
	profileNameSpace setVariable ["goggles3",		  ""	];
	
}else{
/////
_assignItems = profileNameSpace getVariable "items3";
if((count _assignItems) != 0)then{
	for "_i" from 0 to (count _assignItems) do {
	player addItem (_assignItems select _i);
	player assignItem (_assignItems select _i);
	};
};
/////
if((profileNameSpace getVariable "headgear3") != "")then{
	player addHeadgear (profileNameSpace getVariable "headgear3");
};
//////
if((profileNameSpace getVariable "uniform3") != "")then{
	player addUniform (profileNameSpace getVariable "uniform3");
	_uniformItems = profileNameSpace getVariable "uniformitems3";
	if((count _uniformItems) != 0)then{
		for "_i" from 0 to (count _uniformItems) do {
		player addItemToUniform (_uniformItems select _i);
		};
	};
};
//////
if((profileNameSpace getVariable "vest3") != "")then{
	player addVest (profileNameSpace getVariable "vest3");
	_vestItems = profileNameSpace getVariable "vestitems3";
	if((count _vestItems) != 0)then{
		for "_i" from 0 to (count _vestItems) do {
		player addItemToVest (_vestItems select _i);
		};
	};
};
//////
if((profileNameSpace getVariable "backpack3") != "")then{
	player addBackpack (profileNameSpace getVariable "backpack3");
	_backpackItems = profileNameSpace getVariable "backpackitems3";
	if((count _backpackItems) != 0) then {
		for "_i" from 0 to (count _backpackItems) do {
		player addItemToBackpack (_backpackItems select _i);
		};
	};
};
///// Weapons (Primary + Pistol)
if((profileNameSpace getVariable "primWepPl3") != "")then{
	player addMagazine ((getArray (configFile / "CfgWeapons" / (profileNameSpace getVariable "primWepPl3") / "magazines")) select 0);
	player addWeapon (profileNameSpace getVariable "primWepPl3");
	if(count (profileNameSpace getVariable "primWepIt3") != 0)then{
		for "_i" from 0 to (count (profileNameSpace getVariable "primWepIt3"))do{
			player addPrimaryWeaponItem ((profileNameSpace getVariable "primWepIt3") select _i);
		};
	};
};
if((profileNameSpace getVariable "handgunWepPl3") != "")then{
	player addMagazine ((getArray (configFile / "CfgWeapons" / (profileNameSpace getVariable "handgunWepPl3") / "magazines")) select 0);
	player addWeapon (profileNameSpace getVariable "handgunWepPl3");
	if(count (profileNameSpace getVariable "secWepIt3") != 0)then{
		for "_i" from 0 to (count (profileNameSpace getVariable "handgunMIt3"))do{
			player addHandgunItem((profileNameSpace getVariable "handgunMIt3") select _i);
		};
	};
};
if((profileNameSpace getVariable "binocular3") != "")then{
	player addWeapon (profileNameSpace getVariable "binocular3");
};
if((profileNameSpace getVariable "goggles3") != "")then{
	player addGoggles (profileNameSpace getVariable "goggles3");
};
///// Weapons Secondary (Rocket Launchers)
if((profileNameSpace getVariable "secWepPl3") != "")then{
	player addMagazine ((getArray (configFile / "CfgWeapons" / (profileNameSpace getVariable "secWepPl3") / "magazines")) select 0);
	player addWeapon (profileNameSpace getVariable "secWepPl3");
	if(count (profileNameSpace getVariable "secWepIt3") != 0)then{
		for "_i" from 0 to (count (profileNameSpace getVariable "secWepIt3"))do{
			player addSecondaryWeaponItem ((profileNameSpace getVariable "secWepIt3") select _i);
		};
	};
};
/////////////
_position = profileNameSpace getVariable "position3";
player setPosATL [_position select 0, _position select 1, _position select 2];
};



while{true}do{
	profileNameSpace setVariable ["items3",			  assignedItems player];
	profileNameSpace setVariable ["backpack3",			   backpack player];
	profileNameSpace setVariable ["backpackitems3",   backpackItems player];
	profileNameSpace setVariable ["vest3",					   vest player];
	profileNameSpace setVariable ["vestitems3",			  vestItems player];
	profileNameSpace setVariable ["uniform3",			    uniform player];
	profileNameSpace setVariable ["headgear3",			   headgear player];
	profileNameSpace setVariable ["uniformitems3", 	   uniformItems player];
	profileNameSpace setVariable ["primWepPl3",	  	  primaryWeapon player];
	profileNameSpace setVariable ["primWepIt3",  primaryWeaponItems player];
	profileNameSpace setVariable ["secWepPl3",		secondaryWeapon player];
	profileNameSpace setVariable ["secWepIt3", secondaryWeaponItems player];
	profileNameSpace setVariable ["handgunWepPl3",	  handgunWeapon player];
	profileNameSpace setVariable ["handgunMIt3",	   handgunItems player];
	profileNameSpace setVariable ["binocular3",			  binocular player];
	profileNameSpace setVariable ["goggles3",				goggles player];
	profileNameSpace setVariable ["position3",			  getPosATL player];
	sleep 10;
	hint "Снаряжение и позиция сохранены";
	sleep 2;
	hintSilent "";
};