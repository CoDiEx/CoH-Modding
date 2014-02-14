------- Events

function StartIntel()
	if (intelFirstShot == true) then
		Camera_SetInputEnabled(false)
		Game_SetMode(UI_Cinematic)
		Camera_MoveTo(eg_call_in_point, true, 2, true, true )
		Util_StartIntel(Events.StartingIntel01)
	end
end

function NextIntel() 
	if (intelFirstShot == true) then
		Camera_MoveTo(eg_outpost_armor_depot, true, 2, true, true )
		Util_StartIntel(Events.StartingIntel02)
	end
end

function NextIntel02()
	if (intelFirstShot == true) then
		Camera_MoveTo(eg_radio, true, 2, true, true )
		Util_StartIntel(Events.StartingIntel03)
	end
end

Events = {}

Events.StartingIntel01 = function()

	if (intelFirstShot == true) then
		
		CTRL.Actor_PlaySpeech(ACTOR.Russian_Commissar, IntelStart01)
		CTRL.WAIT()
		CTRL.Actor_PlaySpeech(ACTOR.Russian_Commissar, IntelStart02)
		CTRL.WAIT()
		CTRL.Actor_PlaySpeech(ACTOR.Russian_Commissar, IntelStart03)
		CTRL.WAIT()

		NextIntel()

	end

end

Events.StartingIntel02 = function()

	if (intelFirstShot == true) then

		CTRL.Actor_PlaySpeech(ACTOR.Russian_Commissar, IntelStart04)
		CTRL.WAIT()
		CTRL.Actor_PlaySpeech(ACTOR.Russian_Commissar, IntelStart05)
		CTRL.WAIT()
		CTRL.Actor_PlaySpeech(ACTOR.Russian_Commissar, IntelStart06)
		CTRL.WAIT()

		NextIntel02()

	end

end

Events.StartingIntel03 = function()

	if (intelFirstShot == true) then

		CTRL.Actor_PlaySpeech(ACTOR.Russian_Commissar, IntelStart07)
		CTRL.WAIT()
		CTRL.Actor_PlaySpeech(ACTOR.Russian_Commissar, IntelStart08)
		CTRL.WAIT()
		CTRL.Actor_PlaySpeech(ACTOR.Russian_Commissar, IntelStart09)
		CTRL.WAIT()

		intelFirstShot = false
		Camera_SetInputEnabled(true)
		StartObjectives = true
		Game_SetMode(UI_Normal)

	end

end
