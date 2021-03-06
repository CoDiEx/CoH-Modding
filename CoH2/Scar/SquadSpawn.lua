t_infantry = {"panzer_grenadier_squad_mp", "stormtrooper_squad_mp", "grenadier_squad_mp"};

function m_spawnrandomsquad()
	
	local sg_temp = SGroup_CreateIfNotFound("sg_temp");
	local Markers = {mkr_german_bonus_spawner01, mkr_german_bonus_spawner02, mkr_german_tank_spawner};
	local RandMArker = Markers[World_GetRand(1, #Markers)]; -- get random marker from the table Markers
	local bp = t_infantry[World_GetRand(1, #t_infantry)]; -- get random infantry squad from t_infantry
	
	Util_CreateSquads(player3, sg_temp, BP_GetSquadBlueprint(bp), RandMArker, nil, 1, nil, false, nil, nil, nil);
	SGroup_IncreaseVeterancyRank(sg_temp, World_GetRand(0, 3), true);

  	SGroup_Clear(sg_temp);

end
