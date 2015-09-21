function Util_DoRaceIntel(race, intelfunction)

	for i=1, World_GetPlayerCount() do
			
		player = World_GetPlayerAt(i)

		if (Player_GetRaceName(player) == race) then
			Util_StartIntel(intelfunction)
		end
	
	end

	print("showing intel for the: " ..race .."s")

end
