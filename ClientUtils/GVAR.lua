GVAR_ISSTEERINGENABLED = true;
GVAR_KEEPDOOROPEN = true;

RegisterCommand("ToggleKTFWT", function()
    GVAR_ISSTEERINGENABLED = not GVAR_ISSTEERINGENABLED;
    print("Set Steering Fix Enabled to: " .. tostring(GVAR_ISSTEERINGENABLED));
end)

RegisterCommand("ToggleKTFDO", function()
    GVAR_KEEPDOOROPEN = not GVAR_KEEPDOOROPEN;
    print("Set Door Fix Enabled to: " .. tostring(GVAR_KEEPDOOROPEN));
end)