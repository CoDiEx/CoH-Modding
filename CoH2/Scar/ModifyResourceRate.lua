function OnInit()

  g_manpowerrate = Modify_PlayerResourceRate(player1, RT_Manpower, 0, MUT_Multiplication);
  g_fuelrate = Modify_PlayerResourceRate(player1, RT_Fuel, 0, MUT_Multiplication);
  g_munitionrate = Modify_PlayerResourceRate(player1, RT_Munition, 0, MUT_Multiplication);

  Rule_AddOneShot(First, 5);
  Rule_AddOneShot(Second, 10);

end

Scar_AddInit(OnInit);

function First()

  Modifier_Remove(g_manpowerrate);
  Modifier_Remove(g_fuelrate);
  Modifier_Remove(g_munitionrate);

  g_manpowerrate = Modify_PlayerResourceRate(player1, RT_Manpower, 5, MUT_Multiplication);
  g_fuelrate = Modify_PlayerResourceRate(player1, RT_Fuel, 5, MUT_Multiplication);
  g_munitionrate = Modify_PlayerResourceRate(player1, RT_Munition, 5, MUT_Multiplication);

end

function Second()
  
  Modifier_Remove(g_manpowerrate);
  Modifier_Remove(g_fuelrate);
  Modifier_Remove(g_munitionrate);
  
  g_manpowerrate = Modify_PlayerResourceRate(player1, RT_Manpower, 10, MUT_Multiplication);
  g_fuelrate = Modify_PlayerResourceRate(player1, RT_Fuel, 10, MUT_Multiplication);
  g_munitionrate = Modify_PlayerResourceRate(player1, RT_Munition, 10, MUT_Multiplication);
  
end

-- First the resource rate is 0, then it changes to 5 after 5 seconds and ends with 10 after 10 seconds
