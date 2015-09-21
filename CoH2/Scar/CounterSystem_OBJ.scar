function Objective_MultipleCaptureCounterTemplate_Init() -- Initialise
 
        OBJ_CAPS = {
       
                SetupUI = function()
                        OBJ_CAPS.points = -- It's easy to do this with a table
                        {
                                {eg = eg_point1, ui = Objective_AddUIElements(OBJ_CAPS, eg_point1, true, Util_CreateLocString("Capture this point!"), true, 1.7, nil, nil, nil), captured = false}, -- point 1
                                {eg = eg_point2, ui = Objective_AddUIElements(OBJ_CAPS, eg_point2, true, Util_CreateLocString("Capture this point!"), true, 1.7, nil, nil, nil), captured = false}, -- point 2
                                {eg = eg_point3, ui = Objective_AddUIElements(OBJ_CAPS, eg_point3, true, Util_CreateLocString("Capture this point!"), true, 1.7, nil, nil, nil), captured = false} -- point 3
                        }
                end,
               
                OnStart = function()
                        Objective_SetCounter(OBJ_CAPS, 0, #OBJ_CAPS.points); -- Set the counter on start (0/3); (When you use the hash tag in front of a table you get the amount of objects it contains, in this case it's 3)
                        Rule_AddInterval(Checker, 5); -- Check every fifth second
                end,
               
                OnComplete = function()
                end,
               
                OnFail = function()
                end,
               
                Title = Util_CreateLocString("Capture points"),
                Description = 0,
                Type = OT_Primary,
               
                capturedpoints = 0,
               
        }
 
        Objective_Register(OBJ_CAPS);
 
end
 
function Checker() -- call this with an interval
 
        for i=1, #OBJ_CAPS.points do -- For each element in the table
                if (OBJ_CAPS.points[i].captured == false) then -- Check this one if it has not been captured
                        if (EGroup_IsCapturedByPlayer(OBJ_CAPS.points[i].eg, player1, ANY)) then -- Is captured?
                                OBJ_CAPS.points[i].captured = true; -- Set it to true so we wont count it any more
                                capturedpoints = capturedpoints + 1; -- Add it to the amount of captured points
                                Objective_RemoveUIElements(OBJ_CAPS, OBJ_CAPS.points[i].ui); -- Remove the UI
                        end
                end
        end
 
        Objective_SetCounter(OBJ_CAPS, capturedpoints, #OBJ_CAPS.points); -- Update the counter
       
        if (capturedpoints == #OBJ_CAPS.points) then -- Do we have them all?
                Objective_Complete(OBJ_CAPS, true); -- Complete the objective
                Rule_RemoveMe(); -- Remove me
        end
       
end
