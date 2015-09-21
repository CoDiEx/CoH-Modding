import("ScarUtil.scar");
import("m01_ukf_utilities.scar");
import("m01_ukf_ui.scar");

-- TODO: Add Mortars when defending the passage
-- TODO: Add British naval bombardment ability
-- TODO: Make the beginning of the mission easier and shorter
-- TODO: Fix Luftwaffe
-- TODO: Re-add the side mission

function OnGameSetup()
	player1 = World_GetPlayerAt(1);
	player2 = World_GetPlayerAt(2);
	player3 = World_GetPlayerAt(3);
	player4 = World_GetPlayerAt(4);
	Setup_SetPlayerName(player1, "$08a0ac9c7e6144909909a02d533ce8aa:299");
	Setup_SetPlayerName(player2, "$08a0ac9c7e6144909909a02d533ce8aa:299");
	Setup_SetPlayerName(player3, "$08a0ac9c7e6144909909a02d533ce8aa:301");
	Setup_SetPlayerName(player4, "$08a0ac9c7e6144909909a02d533ce8aa:302");
end

function OnGameRestore()
	player1 = World_GetPlayerAt(1);
	player2 = World_GetPlayerAt(2);
	player3 = World_GetPlayerAt(3);
	player4 = World_GetPlayerAt(4);
	Game_DefaultGameRestore();
end

function Mission_Init()

	Mission_Objectives();
	Mission_Difficulty();
	Mission_Restrictions();
	
	--Mission_ExtraUI();
	
	AI_EnableAll(false);
	
	Rule_AddOneShot(Mission_DelayIntel, 0.65);
	
end

Scar_AddInit(Mission_Init);

function Mission_DelayIntel()
	Util_StartIntel(EVENTS.INTRO);
end

function Mission_Restrictions()

	Player_AddAbility(player3, BP_GetAbilityBlueprint("stuka_air_recon"));
	Player_AddAbility(player3, BP_GetAbilityBlueprint("stuka_bombing_strike"));
	Cmd_InstantUpgrade(player1, BP_GetUpgradeBlueprint("tommy_increased_squad_size_mp"), 1); 
	Cmd_InstantUpgrade(player1, BP_GetUpgradeBlueprint("tommy_mills_bomb_mp"), 1);
	Cmd_InstantUpgrade(player1, BP_GetUpgradeBlueprint("weapon_rack_unlock_mp"), 1);
	
	Player_SetPopCapOverride(player1, 40);
	
	Player_SetResource(player1, RT_Manpower, 0);
	Player_SetResource(player1, RT_Munition, 125);
	Player_SetResource(player1, RT_Fuel, 0);
	
	Modify_PlayerResourceRate(player1, RT_Manpower, 0.12);
	Modify_PlayerResourceRate(player1, RT_Munition, 1.25);
	Modify_PlayerResourceRate(player1, RT_Fuel, 0);
	
end

function Mission_Objectives()

	OBJ_LINK = {
	
		SetupUI = function() 
		end,
		
		OnStart = function()
		end,
		
		OnComplete = function()
		end,
		
		OnFail = function()
		end,
		
		Title = "$08a0ac9c7e6144909909a02d533ce8aa:303",
		Description = 0,
		Type = OT_Primary,
	}

	OBJ_FINDMARKET = {
		Parent = OBJ_LINK,
		SetupUI = function()
		end,
		OnStart = function()
		end,
		OnComplete = function()
		end,
		OnFail = function()
		end,
		Title = "$08a0ac9c7e6144909909a02d533ce8aa:304",
		Description = 0,
		Type = OT_Secondary,
	}
	
	OBJ_WALKER = {
		Parent = OBJ_LINK,
		SetupUI = function()
		end,
		OnStart = function()
		end,
		OnComplete = function()
		end,
		OnFail = function()
		end,
		Title = "$08a0ac9c7e6144909909a02d533ce8aa:305",
		Description = 0,
		Type = OT_Secondary,
	}
	
	Objective_Register(OBJ_LINK);
	Objective_Register(OBJ_FINDMARKET);
	Objective_Register(OBJ_WALKER);
	
	OBJ_PASSAGE = {
	
		SetupUI = function() 
		end,
		
		OnStart = function()
		end,
		
		OnComplete = function()
		end,
		
		OnFail = function()
		end,
		
		Title = "$08a0ac9c7e6144909909a02d533ce8aa:316",
		Description = 0,
		Type = OT_Primary,
	}
	
	OBJ_PASSAGEDEFEND = {
		Parent = OBJ_PASSAGE,
		SetupUI = function()
		end,
		OnStart = function()
		end,
		OnComplete = function()
		end,
		OnFail = function()
		end,
		Title = "$08a0ac9c7e6144909909a02d533ce8aa:317",
		Description = 0,
		Type = OT_Secondary,
	}
	
	Objective_Register(OBJ_PASSAGE);
	Objective_Register(OBJ_PASSAGEDEFEND);
	
	OBJ_DYNAMIC_DEFENCE = {
	
		SetupUI = function() 
		end,
		
		OnStart = function()
		end,
		
		OnComplete = function()
		end,
		
		OnFail = function()
		end,
		
		Title = "$08a0ac9c7e6144909909a02d533ce8aa:327",
		Description = 0,
		Type = OT_Primary,
	}
	
	OBJ_REACTDEFENCE = {
		Parent = OBJ_DYNAMIC_DEFENCE,
		SetupUI = function()
		end,
		OnStart = function()
		end,
		OnComplete = function()
		end,
		OnFail = function()
		end,
		Title = "$08a0ac9c7e6144909909a02d533ce8aa:328",
		Description = 0,
		Type = OT_Secondary,
	}
	
	OBJ_CASTLE_EVAC = {
		Parent = OBJ_DYNAMIC_DEFENCE,
		SetupUI = function()
		end,
		OnStart = function()
		end,
		OnComplete = function()
		end,
		OnFail = function()
		end,
		Title = "$08a0ac9c7e6144909909a02d533ce8aa:329",
		Description = 0,
		Type = OT_Secondary,
	}
	
	OBJ_BEACH_EVAC = {
		Parent = OBJ_DYNAMIC_DEFENCE,
		SetupUI = function()
		end,
		OnStart = function()
		end,
		OnComplete = function()
		end,
		OnFail = function()
		end,
		Title = "$08a0ac9c7e6144909909a02d533ce8aa:330",
		Description = 0,
		Type = OT_Secondary,
	}
	
	OBJ_BEACH_TRAP = {
		Parent = OBJ_DYNAMIC_DEFENCE,
		SetupUI = function()
		end,
		OnStart = function()
		end,
		OnComplete = function()
		end,
		OnFail = function()
		end,
		Title = "$08a0ac9c7e6144909909a02d533ce8aa:345",
		Description = 0,
		Type = OT_Secondary,
	}
	
	Objective_Register(OBJ_DYNAMIC_DEFENCE);
	Objective_Register(OBJ_REACTDEFENCE);
	Objective_Register(OBJ_BEACH_EVAC);
	Objective_Register(OBJ_CASTLE_EVAC);
	Objective_Register(OBJ_BEACH_TRAP);
	
end

function Mission_Difficulty()

	g_diff = Game_GetSPDifficulty();
	t_difficulty = {};
	
	if (g_diff == GD_EASY) then
		t_difficulty.reinforcement1 = 4;
		t_difficulty.maxstormskip = 8;
		t_difficulty.tokillofstorms = 16;
		t_difficulty.boattime = 3 * 60;
		t_difficulty.tosave = 10;
		t_difficulty.damagebegin = 0.5;
		t_difficulty.tankvuln = 3.75;
	elseif (g_diff == GD_NORMAL) then
		t_difficulty.reinforcement1 = 3;
		t_difficulty.maxstormskip = 10;
		t_difficulty.tokillofstorms = 18;
		t_difficulty.boattime = 5 * 60;
		t_difficulty.tosave = 12;
		t_difficulty.damagebegin = 0.6;
		t_difficulty.tankvuln = 2.5;
	elseif (g_diff == GD_HARD) then
		t_difficulty.reinforcement1 = 2;
		t_difficulty.maxstormskip = 12;
		t_difficulty.tokillofstorms = 20;
		t_difficulty.boattime = 7 * 60;
		t_difficulty.tosave = 14;
		t_difficulty.damagebegin = 0.75;
		t_difficulty.tankvuln = 1.25;
	end

end

function Mission_BeginObjectives()

	UI_SetCPMeterVisibility(false);
	
	Objective_Start(OBJ_LINK, false);
	Objective_Start(OBJ_FINDMARKET, true);
	
	Cmd_Move(temp1, mkr_gren01);
	Cmd_Move(temp2, mkr_gren02);
	
	Modify_Vulnerability(temp1, 2.12);
	Modify_Vulnerability(temp2, 2.12);
	
	Modify_Vulnerability(Player_GetSquads(player3), 1.45);
	Modify_WeaponDamage(Player_GetSquads(player3), "hardpoint_01", t_difficulty.damagebegin); 
	
	Util_CreateSquads(player1, SGroup_CreateIfNotFound("playerunits"), BP_GetSquadBlueprint("tommy_squad_mp"), mkr_ukf_spawn, mkr_ukf_goto, 1);
	
	Rule_AddInterval(Mission_LoseCondition1, 1);
	Rule_AddInterval(Mission_DeepCheck, 5);
	
end

function Mission_LoseCondition1()

	if (SGroup_Count(Player_GetSquads(player1)) == 0) then
		Util_StartIntel(EVENTS.LOSE1);
	end

end

function Mission_DeepCheck()

	if (SGroup_Count(temp1) == 0 and SGroup_Count(temp2) == 0) then
	
		Util_CreateSquads(player1, SGroup_CreateIfNotFound("playerunits"), BP_GetSquadBlueprint("tommy_squad_mp"), mkr_ukf_intro_reinforcements, mkr_gren01, t_difficulty.reinforcement1);
		g_markethint = HintPoint_Add(mkr_ui_helper01, true, "$08a0ac9c7e6144909909a02d533ce8aa:309", 1.25, HPAT_Objective, nil); 
		
		local sg_house = SGroup_CreateIfNotFound("sg_house");
		Util_CreateSquads(player3, sg_house, BP_GetSquadBlueprint("grenadier_squad_mp"), eg_intro_house, nil, 1);
		Modify_Vulnerability(sg_house, 1.85);
		
		Event_Proximity(Mission_DoFlyover, nil, player1, mkr_flyover, 50, ANY, 5);
		Event_Proximity(Mission_Ambush, nil, player1, mkr_progress , 15, ANY, 1);
		
		Rule_RemoveMe();
		
	end

end

function Mission_DoFlyover()
	Util_StartIntel(EVENTS.FLY);
	Cmd_Ability(player3, BP_GetAbilityBlueprint("stuka_air_recon"), mkr_flyover, Marker_GetDirection(mkr_flyover), true, false);
end

function Mission_Ambush()

	Util_StartIntel(EVENTS.HALFTRACKAMBUSH);

	local sg_half = SGroup_CreateIfNotFound("sg_half");
	
	Util_CreateSquads(player3, sg_half, BP_GetSquadBlueprint("sdkfz_251_halftrack_squad_mp"), mkr_spawnhalftrack_02, mkr_halftrack_goto0, 1);
	Util_CreateSquads(player3, SGroup_CreateIfNotFound("Temp"), BP_GetSquadBlueprint("grenadier_squad_mp"), mkr_grenadier_surp, mkr_gren03, 1);
	Util_CreateSquads(player3, SGroup_CreateIfNotFound("Temp"), BP_GetSquadBlueprint("grenadier_squad_mp"), mkr_grenadier_surp, mkr_gren04, 1);
	
	Modify_Vulnerability(sg_half, 1.35);
	
	Rule_AddInterval(Mission_AmbushKilled, 5);
	
end

function Mission_AmbushKilled()

	if (SGroup_Count(Player_GetSquads(player3)) == 0) then
		
		Objective_Complete(OBJ_FINDMARKET, true);
		Objective_Start(OBJ_WALKER, true);
		
		World_IncreaseInteractionStage();
		
		Mission_MoveUpExtension();
		
		Rule_RemoveMe();
		
	end
	
end

function Mission_MoveUpExtension()

	local sg_extmove = SGroup_CreateIfNotFound("sg_extmove");

	Util_CreateSquads(player3, sg_extmove, BP_GetSquadBlueprint("grenadier_squad_mp"), mkr_gren_extension, mkr_gren05, 1);
	Util_CreateSquads(player3, sg_extmove, BP_GetSquadBlueprint("grenadier_squad_mp"), mkr_gren_extension, mkr_gren06, 1);

	HintPoint_Remove(g_markethint);
	
	Modify_Vulnerability(sg_extmove, 0.75);
	
	Event_Proximity(Mission_SpawnLightDefence, nil, player1, mkr_trigger_attack , 15, ANY, 1);
	
end

function Mission_SpawnLightDefence()

	sg_later = SGroup_CreateIfNotFound("sg_later");
	sg_movelater = SGroup_CreateIfNotFound("sg_movelater");

	Util_CreateSquads(player2, SGroup_CreateIfNotFound("Temp"), BP_GetSquadBlueprint("tommy_squad_mp"), mkr_ukf_tommy01, nil, 1);
	Util_CreateSquads(player2, sg_later, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_ukf_tommy03, nil, 1);
	Util_CreateSquads(player2, sg_movelater, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_ukf_tommy02, nil, 1);

	sg_grenadier_light = SGroup_CreateIfNotFound("sg_grenadier_light");
	
	Util_CreateSquads(player3, sg_grenadier_light, BP_GetSquadBlueprint("grenadier_squad_mp"), mkr_gren07, nil, 1);
	Util_CreateSquads(player3, sg_grenadier_light, BP_GetSquadBlueprint("grenadier_squad_mp"), mkr_gren08, nil, 1);
	
	Modify_Vulnerability(sg_grenadier_light, 0.75);
	
	Rule_AddInterval(Mission_LightDefenceOver, 5);
	
end

function Mission_LightDefenceOver()
	if (SGroup_Count(sg_grenadier_light) == 0) then
		
		Util_StartIntel(EVENTS.TRIGGERDEFENCE);
		Mission_LightDefence2();
		
		g_protecthint = HintPoint_Add(mkr_ui_helper02, true, "$08a0ac9c7e6144909909a02d533ce8aa:315", 1.25, HPAT_Objective, nil); 
		
		Cmd_Move(sg_movelater, mkr_ukf_defence_goto);
		Cmd_Move(Player_GetSquads(player1), mkr_defence_light_target);
		Cmd_Garrison(sg_later, eg_ukf_defence_house_garrison, false, false, true); 
		
		Rule_RemoveMe();
		
	end
end

function Mission_LightDefence2()

	sg_grenadier_l2 = SGroup_CreateIfNotFound("sg_grenadier_l2");

	Util_CreateSquads(player3, sg_grenadier_l2, BP_GetSquadBlueprint("grenadier_squad_mp"), mkr_light_attack01, nil, 1);
	Util_CreateSquads(player3, sg_grenadier_l2, BP_GetSquadBlueprint("grenadier_squad_mp"), mkr_light_attack02, nil, 1);
	Cmd_AttackMove(sg_grenadier_l2, mkr_defence_light_target, false, nil, 15, nil); 
	
	Modify_Vulnerability(sg_grenadier_l2, 1.62);
	
	Rule_AddOneShot(Mission_LightDefence2_next, 45);

end

function Mission_LightDefence2_next()

	Util_CreateSquads(player3, sg_grenadier_l2, BP_GetSquadBlueprint("grenadier_squad_mp"), mkr_light_attack01, nil, 1);
	Util_CreateSquads(player3, sg_grenadier_l2, BP_GetSquadBlueprint("grenadier_squad_mp"), mkr_light_attack02, nil, 1);
	Util_CreateSquads(player3, sg_grenadier_l2, BP_GetSquadBlueprint("grenadier_squad_mp"), mkr_light_attack02, nil, 1);
	
	Cmd_AttackMove(sg_grenadier_l2, mkr_defence_light_target, false, nil, 15, nil);
	
	Modify_Vulnerability(sg_grenadier_l2, 1.62);
	
	Rule_AddInterval(Mission_LightDefence2_IsDead, 5);
	
end

function Mission_LightDefence2_IsDead()

	if (SGroup_Count(sg_grenadier_l2) == 0) then
		
		HintPoint_Remove(g_protecthint);
		
		Mission_UnlockDunkirk();
		Event_Proximity(Mission_WalkerReached, nil, player1, mkr_near_walker , 15, ANY, 0);
		
		Rule_RemoveMe();
		
	end

end

function Mission_UnlockDunkirk()

	World_IncreaseInteractionStage();

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	sg_house_garrison01 = SGroup_CreateIfNotFound("sg_house_garrison01");
	sg_house_garrison02 = SGroup_CreateIfNotFound("sg_house_garrison02");
	sg_house_garrison03 = SGroup_CreateIfNotFound("sg_house_garrison03");
	sg_house_garrison04 = SGroup_CreateIfNotFound("sg_house_garrison04");
	sg_house_garrison05 = SGroup_CreateIfNotFound("sg_house_garrison05");
	sg_house_garrison06 = SGroup_CreateIfNotFound("sg_house_garrison06");
	sg_house_garrison07 = SGroup_CreateIfNotFound("sg_house_garrison07");
	sg_house_garrison08 = SGroup_CreateIfNotFound("sg_house_garrison08");
	sg_house_garrison09 = SGroup_CreateIfNotFound("sg_house_garrison09");
	sg_house_garrison10 = SGroup_CreateIfNotFound("sg_house_garrison10");
	sg_passage01 = SGroup_CreateIfNotFound("sg_passage01");
	sg_passage02 = SGroup_CreateIfNotFound("sg_passage02");
	sg_passage03 = SGroup_CreateIfNotFound("sg_passage03");
	sg_passage04 = SGroup_CreateIfNotFound("sg_passage04");
	sg_passage05 = SGroup_CreateIfNotFound("sg_passage05");
	sg_passage06 = SGroup_CreateIfNotFound("sg_passage06");
	sg_walker = SGroup_CreateIfNotFound("sg_walker");
	sg_support01 = SGroup_CreateIfNotFound("sg_support01");
	sg_support02 = SGroup_CreateIfNotFound("sg_support02");
	sg_support03 = SGroup_CreateIfNotFound("sg_support03");
	sg_support04 = SGroup_CreateIfNotFound("sg_support04");
	sg_support05 = SGroup_CreateIfNotFound("sg_support05");
	sg_support06 = SGroup_CreateIfNotFound("sg_support06");
	sg_support07 = SGroup_CreateIfNotFound("sg_support07");
	sg_support08 = SGroup_CreateIfNotFound("sg_support08");
	sg_support09 = SGroup_CreateIfNotFound("sg_support09");
	sg_support10 = SGroup_CreateIfNotFound("sg_support10");
	sg_support11 = SGroup_CreateIfNotFound("sg_support11");
	sg_support12 = SGroup_CreateIfNotFound("sg_support12");
	sg_support13 = SGroup_CreateIfNotFound("sg_support13");
	sg_support14 = SGroup_CreateIfNotFound("sg_support14");
	sg_support15 = SGroup_CreateIfNotFound("sg_support15");
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	t_beach_lines = { mkr_beach_safe01, mkr_beach_safe02, mkr_beach_safe03, mkr_beach_safe04, mkr_beach_safe05, mkr_beach_safe06, mkr_beach_safe07, mkr_beach_safe08 };
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Util_CreateSquads(player2, sg_house_garrison01, BP_GetSquadBlueprint("tommy_squad_mp"), eg_garrison01, nil, 1);
	Util_CreateSquads(player2, sg_house_garrison02, BP_GetSquadBlueprint("tommy_squad_mp"), eg_garrison02, nil, 1);
	Util_CreateSquads(player2, sg_house_garrison03, BP_GetSquadBlueprint("tommy_squad_mp"), eg_garrison03, nil, 1);
	Util_CreateSquads(player2, sg_house_garrison04, BP_GetSquadBlueprint("tommy_squad_mp"), eg_garrison04, nil, 1);
	Util_CreateSquads(player2, sg_house_garrison05, BP_GetSquadBlueprint("tommy_squad_mp"), eg_garrison05, nil, 1);
	Util_CreateSquads(player2, sg_house_garrison06, BP_GetSquadBlueprint("tommy_squad_mp"), eg_garrison06, nil, 1);
	Util_CreateSquads(player2, sg_house_garrison07, BP_GetSquadBlueprint("tommy_squad_mp"), eg_garrison07, nil, 1);
	Util_CreateSquads(player2, sg_house_garrison08, BP_GetSquadBlueprint("tommy_squad_mp"), eg_garrison08, nil, 1);
	Util_CreateSquads(player2, sg_house_garrison09, BP_GetSquadBlueprint("tommy_squad_mp"), eg_garrison09, nil, 1);
	Util_CreateSquads(player2, sg_house_garrison10, BP_GetSquadBlueprint("tommy_squad_mp"), eg_garrison10, nil, 1);
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Util_CreateSquads(player2, sg_passage01, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_ally_defend_spawner, mkr_passage_defend01, 1);
	Util_CreateSquads(player2, sg_passage02, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_ally_defend_spawner, mkr_passage_defend02, 1);
	Util_CreateSquads(player2, sg_passage03, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_ally_defend_spawner, mkr_passage_defend03, 1);
	Util_CreateSquads(player2, sg_passage04, BP_GetSquadBlueprint("british_machine_gun_squad_mp"), mkr_ally_defend_spawner, mkr_passage_defend04, 1);
	Util_CreateSquads(player2, sg_passage05, BP_GetSquadBlueprint("british_machine_gun_squad_mp"), mkr_ally_defend_spawner, mkr_passage_defend05, 1);
	Util_CreateSquads(player2, sg_passage06, BP_GetSquadBlueprint("british_machine_gun_squad_mp"), mkr_ally_defend_spawner, mkr_passage_defend06, 1);
	Util_CreateSquads(player2, sg_walker, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_walker_guard01, nil, 1);
	Util_CreateSquads(player2, sg_walker, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_walker_guard02, nil, 1);
	Util_CreateSquads(player2, sg_walker, BP_GetSquadBlueprint("forward_observation_squad_mp"), mkr_walker_spawn, nil, 1);
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Objective_AddUIElements(OBJ_WALKER, SGroup_GetPosition(sg_walker), true, "$08a0ac9c7e6144909909a02d533ce8aa:305", true, 1.7); 
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Util_CreateSquads(player2, sg_support01, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_support_infantry01, nil, 1);
	Util_CreateSquads(player2, sg_support02, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_support_infantry02, nil, 1);
	Util_CreateSquads(player2, sg_support03, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_support_infantry03, nil, 1);
	Util_CreateSquads(player2, sg_support04, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_support_infantry04, nil, 1);
	Util_CreateSquads(player2, sg_support05, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_support_infantry05, nil, 1);
	Util_CreateSquads(player2, sg_support06, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_support_infantry06, nil, 1);
	Util_CreateSquads(player2, sg_support07, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_support_infantry07, nil, 1);
	Util_CreateSquads(player2, sg_support08, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_support_infantry08, nil, 1);
	Util_CreateSquads(player2, sg_support09, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_support_infantry09, nil, 1);
	Util_CreateSquads(player2, sg_support10, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_support_infantry10, nil, 1);
	Util_CreateSquads(player2, sg_support11, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_support_infantry11, nil, 1);
	Util_CreateSquads(player2, sg_support12, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_support_infantry12, nil, 1);
	Util_CreateSquads(player2, sg_support13, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_support_infantry13, nil, 1);
	Util_CreateSquads(player2, sg_support14, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_support_infantry14, nil, 1);
	Util_CreateSquads(player2, sg_support15, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_support_infantry15, nil, 1);
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	EGroup_InstantCaptureStrategicPoint(eg_munition, player2); 
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
end

function Mission_WalkerReached()
	
	Objective_Complete(OBJ_WALKER, true);
	Objective_Complete(OBJ_LINK, true);
	
	Util_StartIntel(EVENTS.OPENPASSAGE);
	
	Mission_BeachReinforcements();
	
	Rule_AddInterval(Mission_LoseCondition2, 5);
	
end

function Mission_LoseCondition2()

	if (EGroup_IsCapturedByPlayer(eg_harbour1, player3, ANY) == true and EGroup_IsCapturedByPlayer(eg_harbour2, player3, ANY) == true) then
		Util_StartIntel(EVENTS.LOSE2);
	end

end

function Mission_WalkerMove()

	Objective_Start(OBJ_PASSAGE, false);
	Objective_Start(OBJ_PASSAGEDEFEND, true);

	sg_passage_unit01 = SGroup_CreateIfNotFound("sg_passage01");
	sg_assault_squads = SGroup_CreateIfNotFound("sg_assault_squads");
	
	Util_CreateSquads(player2, sg_passage_unit01, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_passage_spawn, mkr_passage_safe_trigger, 1);
	
	t_spawners_passages = { mkr_passage_attack_spawn01, mkr_passage_attack_spawn02, mkr_passage_attack_spawn03, mkr_passage_attack_spawn04 };
	t_attack_passages = { mkr_passage_defend01, mkr_passage_defend02, mkr_passage_defend03, mkr_passage_defend04, mkr_passage_defend05, mkr_passage_defend06 };
	
	g_savedsoldiers = 0;
	
	Rule_AddInterval(Mission_UpdatePassage, 15);
	Rule_AddInterval(Mission_PassageAssault, 20);
	Rule_AddInterval(Mission_UpdatePassageExit, 2);
	--Rule_AddOneShot(Mission_EndPassage, 5 * 60);
	
end

function Mission_BeachReinforcements()

	sg_new_reinforcements = SGroup_CreateIfNotFound("sg_new_reinforcements");

	Util_CreateSquads(player1, sg_new_reinforcements, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_new_reinforcement01, mkr_reinforcement_goto01, 3);
	Util_CreateSquads(player1, sg_new_reinforcements, BP_GetSquadBlueprint("universal_carrier_squad_mp"), mkr_new_reinforcement01, mkr_reinforcement_goto01, 1);
	
	Cmd_Move(sg_new_reinforcements, mkr_reinforcement_goto02, true);
	
	SGroup_Clear(sg_new_reinforcements);
	
end

function Mission_UpdatePassage()

	if (SGroup_Count(sg_passage_unit01) == 0) then
		Util_CreateSquads(player2, sg_passage_unit01, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_passage_spawn, mkr_passage_safe_trigger, 1);
		SGroup_DisableCombatPlans(sg_passage_unit01);
		g_playerpassagedefend = Objective_AddUIElements(OBJ_PASSAGEDEFEND, sg_passage_unit01, true, "$08a0ac9c7e6144909909a02d533ce8aa:349", true, 1.7);
		Modify_Vulnerability(sg_passage_unit01, 2.25); 
	end
	
end

function Mission_UpdatePassageExit()

	if (Prox_AreSquadsNearMarker(sg_passage_unit01, mkr_passage_safe_trigger, ANY, 15)) then
		Cmd_Move(sg_passage_unit01, t_beach_lines[World_GetRand(1, #t_beach_lines)]);
		Objective_RemoveUIElements(OBJ_PASSAGEDEFEND, g_playerpassagedefend);
		g_savedsoldiers = g_savedsoldiers + 1;
		Objective_SetCounter(OBJ_PASSAGEDEFEND, g_savedsoldiers, t_difficulty.tosave);
		if (g_savedsoldiers == t_difficulty.tosave) then
			Mission_EndPassage();
		end
		SGroup_Clear(sg_passage_unit01);
	end

end

function Mission_PassageAssault()

	local max = World_GetRand(0, 4);
	for i=1, max do
		local index = World_GetRand(1, #t_spawners_passages);
		local i2 = World_GetRand(1, #t_attack_passages);
		Util_CreateSquads(player3, sg_assault_squads, BP_GetSquadBlueprint("stormtrooper_squad_mp"), t_spawners_passages[index], t_attack_passages[i2], 1, nil, true);
	end

end

function Mission_EndPassage()

	Objective_Complete(OBJ_PASSAGEDEFEND, false);
	Objective_Complete(OBJ_PASSAGE, true);
	
	Rule_Remove(Mission_UpdatePassageExit);
	Rule_Remove(Mission_UpdatePassage);
	Rule_Remove(Mission_PassageAssault);

	Util_StartIntel(EVENTS.DYNAMIC);
	
	Objective_Start(OBJ_DYNAMIC_DEFENCE, true);
	Objective_Start(OBJ_REACTDEFENCE, false);
	
	Player_SetPopCapOverride(player1, 150);
	
	Mission_BeginMainDefence();
	
end

function Mission_BeginMainDefence()

	t_directions =
	{
		{ui = mkr_ui_front01, target = mkr_attack_target01, event = EVENTS.PATH3, spawner = {mkr_extra_spawner01, mkr_extra_spawner02, mkr_halftrack_spawn, mkr_passage_attack_spawn01}},
		{ui = mkr_ui_front02, target = mkr_attack_target02, event = EVENTS.PATH2, spawner = {mkr_extra_spawner02, mkr_passage_attack_spawn01, mkr_passage_attack_spawn02, mkr_extra_spawner03}},
		{ui = mkr_ui_front03, target = mkr_attack_target03, event = EVENTS.PATH1, spawner = {mkr_extra_spawner03, mkr_extra_spawner04, mkr_extra_spawner05}},
	};

	t_assault_vehicle_list =
	{
		BP_GetSquadBlueprint("sdkfz_251_halftrack_squad_mp"), BP_GetSquadBlueprint("mechanized_250_halftrack_grenadiers_mp"), BP_GetSquadBlueprint("stug_iii_e_squad_mp"), BP_GetSquadBlueprint("scoutcar_sdkfz222_mp")
	}
	
	assault_tank = BP_GetSquadBlueprint("panzer_iv_stubby_squad_mp");
	
	t_assault_infantry_list =
	{
		BP_GetSquadBlueprint("grenadier_squad_mp"), BP_GetSquadBlueprint("assault_grenadier_squad_mp"), BP_GetSquadBlueprint("stormtrooper_squad_mp")
	}
	
	sg_direction_target = SGroup_CreateIfNotFound("sg_direction_target");
	sg_direction_storm = SGroup_CreateIfNotFound("sg_direction_storm");
	
	g_direction = t_directions[World_GetRand(1, #t_directions)];
	
	g_direction_hint = HintPoint_Add(g_direction.ui, true, "$08a0ac9c7e6144909909a02d533ce8aa:350", 1.25, HPAT_Objective, nil); 
	UI_CreateMinimapBlip(g_direction.ui, 15, BT_DefendHere); 
	
	g_spawnstormtroopers = 0;
	g_killedtroops = 0;
	g_stormleave = nil;
	g_skipstorms = 0;
	g_spawnvehicle = 0;
	g_spawntank = 0;
	g_lastunitamount = SGroup_Count(Player_GetSquads(player1));
	
	sg_trapped = SGroup_CreateIfNotFound("sg_trapped");
	
	Timer_Start("AssaultTimer", 15 * 60);
	
	Rule_AddInterval(Mission_UpdateDirection, 140);
	Rule_AddInterval(Mission_UpdateAttack, 30);
	Rule_AddInterval(Mission_QuickAttackEnd, 5);

	Rule_AddOneShot(Mission_TriggerSideMission, 7 * 60);
	
end

function Mission_TriggerSideMission()
	
	Util_StartIntel(EVENTS.WRONGSIDE);
	
	World_IncreaseInteractionStage();
	
	Util_CreateSquads(player2, sg_trapped, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_beach_wrong_direction, nil, 1);
	Util_CreateSquads(player2, sg_trapped, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_beach_wrong_direction1, nil, 1);
	Util_CreateSquads(player2, sg_trapped, BP_GetSquadBlueprint("tommy_squad_mp"), mkr_beach_wrong_direction2, nil, 1);
	
	Util_SpawnGarrison(player3, eg_beach_holdout, SGroup_CreateIfNotFound("sg_trapped_a"), BP_GetSquadBlueprint("grenadier_squad_mp"), 1);
	--Util_SpawnGarrison(player3, eg_holdout_mg, SGroup_CreateIfNotFound("sg_trapped_b"), BP_GetSquadBlueprint("mg42_heavy_machine_gun_squad_mp"), 1);
	
	Objective_Start(OBJ_BEACH_TRAP, true);
	Event_Proximity(Mission_SavedTrapped, nil, player1, mkr_beach_escort_reach, 25, ANY, 0);
	
end

function Mission_SavedTrapped()

	Objective_Complete(OBJ_BEACH_TRAP, true);
	SGroup_SetPlayerOwner(sg_trapped, player1); 

end

function Mission_QuickAttackEnd()

	if (Timer_GetRemaining("AssaultTimer") <= 1) then
		
		Mission_ForceEndAttack();
		
		Rule_RemoveMe();
		
	end
	
end

function Mission_ForceEndAttack()

	Objective_Complete(OBJ_REACTDEFENCE, true);
	Objective_Start(OBJ_CASTLE_EVAC, true);
	
	Cmd_Retreat(sg_direction_target, mkr_passage_spawn, mkr_passage_spawn, false, false, true); 
	
	Util_StartIntel(EVENTS.RUINSTRIGGER);
	
	if (Objective_IsComplete(OBJ_BEACH_TRAP) == false) then
		Objective_Fail(OBJ_BEACH_TRAP, true);
	end
	
	HintPoint_Remove(g_direction_hint);
	
	Rule_AddOneShot(Mission_BeginRuins, 12);
	Rule_Remove(Mission_UpdateAttack);
	Rule_Remove(Mission_UpdateDirection);
	
end

function Mission_UpdateDirection()

	g_direction = t_directions[World_GetRand(1, #t_directions)];
	Util_StartIntel(g_direction.event);
	
	if (g_direction_hint ~= nil) then
		HintPoint_Remove(g_direction_hint);
	end
	
	g_direction_hint = HintPoint_Add(g_direction.ui, true, "$08a0ac9c7e6144909909a02d533ce8aa:350", 1.25, HPAT_Objective, nil); 
	UI_CreateMinimapBlip(g_direction.ui, 15, BT_DefendHere); 
	
	g_spawntank = g_spawntank + 2.5;
	g_spawnvehicle = g_spawnvehicle + 1;
	
	if (SGroup_Count(Player_GetSquads(player1)) < g_lastunitamount) then
		Timer_Add("AssaultTimer", 2 * 60 );
	end
	
	g_lastunitamount = SGroup_Count(Player_GetSquads(player1));
	
	SGroup_Clear(sg_direction_target);
	
end

function Mission_UpdateAttack()

	if (g_direction ~= nil) then
		
		if (SGroup_Count(sg_direction_target) < 12) then
			Util_CreateSquads(player3, sg_direction_target, t_assault_infantry_list, g_direction.spawner[World_GetRand(1, #g_direction.spawner)], g_direction.target, World_GetRand(1, 3), nil, true);
		end
		
		if (g_spawnvehicle >= 6) then
			Util_CreateSquads(player3, sg_direction_target, t_assault_vehicle_list, g_direction.spawner[World_GetRand(1, #g_direction.spawner)], g_direction.target, 1, nil, true);
			g_spawnvehicle = 0;
		else
			g_spawnvehicle = g_spawnvehicle + 1;
		end
		
		if (g_spawntank >= 10) then
			Util_CreateSquads(player3, sg_direction_target, assault_tank, g_direction.spawner[World_GetRand(1, #g_direction.spawner)], g_direction.target, 1, nil, true);
			Modify_Vulnerability(sg_direction_target, t_difficulty.tankvuln);
			g_spawntank = 0;
		else
			g_spawntank = g_spawntank + 0.5;
		end
		
	end

end

function Mission_BeginRuins()

	sg_valentine = SGroup_CreateIfNotFound("sg_valentine");

	Util_CreateSquads(player1, sg_valentine, BP_GetSquadBlueprint("valentine_observation_mp"), mkr_new_reinforcement01, nil, 1);
	Util_CreateSquads(player1, SGroup_Temp(), BP_GetSquadBlueprint("tommy_squad_mp"), mkr_new_reinforcement01, nil, 2);
	
	Modify_ReceivedDamage(sg_valentine, 0.75); 
	Modify_WeaponDamage(sg_valentine, "hardpoint_01", 1.75); 
	
	Cmd_Move(Player_GetSquads(player1), mkr_reinforcement_goto03);
	
	Objective_AddUIElements(OBJ_CASTLE_EVAC, mkr_castle_defend, true, "$08a0ac9c7e6144909909a02d533ce8aa:315", true, 1.7); 
	
	Cmd_Ability(player3, BP_GetAbilityBlueprint("stuka_bombing_strike"), mkr_blow01, nil, true, false);
	Cmd_Ability(player3, BP_GetAbilityBlueprint("stuka_bombing_strike"), mkr_blow02, nil, true, false);	
	
	sg_panzer_assault = SGroup_CreateIfNotFound("sg_panzer_assault");
	sg_halftrack_assault01 = SGroup_CreateIfNotFound("sg_halftrack_assault01");
	sg_halftrack_assault02 = SGroup_CreateIfNotFound("sg_halftrack_assault02");
	sg_infantry_assault01 = SGroup_CreateIfNotFound("sg_infantry_assault01");
	sg_infantry_assault02 = SGroup_CreateIfNotFound("sg_infantry_assault02");
	sg_infantry_assault03 = SGroup_CreateIfNotFound("sg_infantry_assault03");
	sg_infantry_assault04 = SGroup_CreateIfNotFound("sg_infantry_assault04");
	sg_infantry_assault05 = SGroup_CreateIfNotFound("sg_infantry_assault05");
	sg_infantry_assault06 = SGroup_CreateIfNotFound("sg_infantry_assault06");
	
	Rule_AddInterval(Mission_UpdateRuins, 15);
	Rule_AddInterval(Mission_UpdateCityAI, 30);
	Rule_AddInterval(Mission_DecidePanzer, 1);
	Rule_AddOneShot(Mission_BeachDefence, 7 * 60);
	
end

function Mission_UpdateRuins()

	if (SGroup_Count(sg_infantry_assault01) == 0) then
		Util_CreateSquads(player3, sg_infantry_assault01, BP_GetSquadBlueprint("stormtrooper_squad_mp"), mkr_extra_spawner05, mkr_attack_target03, World_GetRand(1, 2), nil, true);
	end
	
	if (SGroup_Count(sg_infantry_assault02) == 0) then
		Util_CreateSquads(player3, sg_infantry_assault02, BP_GetSquadBlueprint("stormtrooper_squad_mp"), mkr_extra_spawner04, mkr_attack_target03, World_GetRand(1, 2), nil, true);
	end

	if (SGroup_Count(sg_infantry_assault03) == 0) then
		Util_CreateSquads(player3, sg_infantry_assault03, BP_GetSquadBlueprint("stormtrooper_squad_mp"), mkr_passage_attack_spawn02, mkr_attack_target03, World_GetRand(1, 2), nil, true);
	end
	
	if (SGroup_Count(sg_halftrack_assault01) == 0) then
		Util_CreateSquads(player3, sg_halftrack_assault01, BP_GetSquadBlueprint("sdkfz_251_halftrack_squad_mp"), mkr_extra_spawner03, mkr_attack_target03, 1, nil, true);
	end
	
end

function Mission_UpdateCityAI()

	if (SGroup_Count(sg_infantry_assault04) == 0) then
		Util_CreateSquads(player3, sg_infantry_assault04, BP_GetSquadBlueprint("stormtrooper_squad_mp"), mkr_passage_attack_spawn01, mkr_reinforcement_goto01, World_GetRand(1, 2), nil, true);
	end
	
	if (SGroup_Count(sg_infantry_assault05) == 0) then
		Util_CreateSquads(player3, sg_infantry_assault05, BP_GetSquadBlueprint("stormtrooper_squad_mp"), mkr_passage_attack_spawn02, mkr_reinforcement_goto01, World_GetRand(1, 2), nil, true);
	end

	if (SGroup_Count(sg_infantry_assault06) == 0) then
		Util_CreateSquads(player3, sg_infantry_assault06, BP_GetSquadBlueprint("stormtrooper_squad_mp"), mkr_passage_spawn, mkr_reinforcement_goto01, World_GetRand(1, 2), nil, true);
	end
	
	if (SGroup_Count(sg_halftrack_assault02) == 0) then
		Util_CreateSquads(player3, sg_halftrack_assault02, BP_GetSquadBlueprint("sdkfz_251_halftrack_squad_mp"), mkr_passage_spawn, mkr_reinforcement_goto01, 1, nil, true);
	end
	
	if (SGroup_Count(sg_panzer_assault) == 0) then
		Util_CreateSquads(player3, sg_panzer_assault, BP_GetSquadBlueprint("panzer_iv_stubby_squad_mp"), mkr_passage_spawn, mkr_reinforcement_goto01, 1, nil, true);
	end
	
end

function Mission_DecidePanzer()

	if (Prox_AreSquadsNearMarker(sg_panzer_assault, mkr_panzer_decide_where, ANY, 15)) then
		local direction = World_GetRand(1, 3);
		if (direction == 3) then
			Cmd_Stop(sg_panzer_assault);
			Cmd_AttackMove(sg_panzer_assault, mkr_reinforcement_goto03);
		end
	end

end

function Mission_BeachDefence()

	Objective_Complete(OBJ_CASTLE_EVAC, true);
	Util_StartIntel(EVENTS.BEACHRETREAT);
	Objective_Start(OBJ_BEACH_EVAC, true);

	sg_vehicles_beach = SGroup_CreateIfNotFound("sg_vehicles_beach");
	sg_infantry_beach = SGroup_CreateIfNotFound("sg_infantry_beach");
	t_vehicles = {BP_GetSquadBlueprint("panzer_iv_stubby_squad_mp"), BP_GetSquadBlueprint("sdkfz_251_halftrack_squad_mp"), BP_GetSquadBlueprint("stug_iii_e_squad_mp"), BP_GetSquadBlueprint("scoutcar_sdkfz222_mp")};
	t_infantry = {BP_GetSquadBlueprint("stormtrooper_squad_mp"), BP_GetSquadBlueprint("grenadier_squad_mp")};
	
	Rule_AddInterval(Mission_LuftwaffeTarget, 70);
	Rule_AddInterval(Mission_SendFullForce, 15);
	
	Timer_Start("BoatRescue", t_difficulty.boattime);
	
	Rule_Add(Mission_UpdateUI);
	
	Rule_Remove(Mission_UpdateRuins);
	Rule_Remove(Mission_UpdateCityAI);
	
end

function Mission_LuftwaffeTarget()

	sg_lastattacker = SGroup_CreateIfNotFound("sg_lastattacker");

	SGroup_GetLastAttacker(sg_vehicles_beach, sg_lastattacker); 

	if (SGroup_Count(sg_vehicles_beach) > 0) then
		Cmd_Ability(player3, BP_GetAbilityBlueprint("stuka_bombing_strike"), SGroup_GetPosition(sg_lastattacker), nil, true, false);	
	end
	
	SGroup_Clear(sg_lastattacker);
	
end

function Mission_SendFullForce()

	if (SGroup_Count(sg_vehicles_beach) < 3) then
		Util_CreateSquads(player3, sg_vehicles_beach, t_vehicles, mkr_passage_spawn, nil, 1);
		Cmd_SquadPath(sg_vehicles_beach, "vehicle_road", true, LOOP_NONE, false, 0, nil, false, true);
	end
	
	if (SGroup_Count(sg_infantry_beach) < 12) then
		Util_CreateSquads(player3, sg_infantry_beach, t_infantry, mkr_passage_spawn, nil, 1);
		Cmd_SquadPath(sg_infantry_beach, "vehicle_road", true, LOOP_NONE, false, 0, nil, false, true);
	end

end

function Mission_UpdateUI()

	Obj_ShowProgress2("$08a0ac9c7e6144909909a02d533ce8aa:343", Timer_GetRemaining("BoatRescue") / t_difficulty.boattime);

	if (Timer_GetRemaining("BoatRescue") < 1) then
		Objective_Complete(OBJ_BEACH_EVAC, true);
		Codiex_EndGame("british", true);
		Rule_RemoveMe();
	end
	
end
