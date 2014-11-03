-- updated Auto repair function
-- new function made by CoDiEx
function AE_CrewRepair(executer, target)
	
	if scartype(executer) == ST_SQUAD and scartype(target) == ST_ENTITY then
		if Entity_IsPartOfSquad(target) then
			local __crewGroup = SGroup_CreateIfNotFound("__crewGroup")
			local __crewTarget = SGroup_CreateIfNotFound("__crewTarget")
			SGroup_Add(__crewGroup, executer)
			SGroup_Add(__crewTarget, Entity_GetSquad(target))
			
			if SGroup_IsDoingAbility(__crewGroup, BP_GetAbilityBlueprint("aef_repair_ability_vehicle_crew_mp"), ANY) == false then
				Cmd_Ability(__crewGroup, BP_GetAbilityBlueprint("aef_repair_ability_vehicle_crew_mp"), __crewTarget, nil, nil, true)
			end
			
			SGroup_Clear(__crewGroup)
			SGroup_Clear(__crewTarget)
		else
			local __crewGroup = SGroup_CreateIfNotFound("__crewGroup")
			local __crewTarget = EGroup_CreateIfNotFound("__crewTarget")
			SGroup_Add(__crewGroup, executer)
			EGroup_Add(__crewTarget, target)
			
			if SGroup_IsDoingAbility(__crewGroup, BP_GetAbilityBlueprint("aef_repair_ability_vehicle_crew_mp"), ANY) == false then
				Cmd_Ability(__crewGroup, BP_GetAbilityBlueprint("aef_repair_ability_vehicle_crew_mp"), __crewTarget, nil, nil, true)
			end
			
			SGroup_Clear(__crewGroup)
			EGroup_Clear(__crewTarget)
		end
	end
	
	-- new stuff
	local function OnRepairDone()
	
	    local __crewGroup = SGroup_CreateIfNotFound("__crewGroup")
			local __crewTarget = EGroup_CreateIfNotFound("__crewTarget")
			SGroup_Add(__crewGroup, executer)
			EGroup_Add(__crewTarget, target)
	
	    if (SGroup_IsRetreating(__crewGroup, ANY) then
	        Rule_Remove(OnRepairDone);
	    else
	        
	        if (Entity_GetHealth(target) == 100) then
	            AE_RecrewVehicle(executer, target);
	        elseif (Entity_GetHealth(target) == 0) then
	            Rule_Remove(OnRepairDone);
	        end
	        
	    end
	
	end
	
	Rule_AddInterval(OnRepairDone, 3);
	
end
