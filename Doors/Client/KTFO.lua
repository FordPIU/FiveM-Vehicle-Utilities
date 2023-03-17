Citizen.CreateThread(function()
    while true do
        Wait(0)
        if(GVAR_KEEPDOOROPEN) then
            DisableControlAction(0, 75, true)

            local Seated = LocalPlayer.state.IsSeated;
            local Cuffed = LocalPlayer.state.IsCuffed;
            if(Seated == nil) then Seated = false end;
            if(Cuffed == nil) then Cuffed = false end;

            -- EXIT --
            if IsDisabledControlJustReleased(0, 75) and (Seated == false and Cuffed == false) then
                local p_Veh = GetVehiclePedIsIn(PlayerPedId(), false)

                if p_Veh ~= 0 then
                    if GetState(p_Veh, "vLock") == nil or GetState(p_Veh, "vLock").Locked == false then
                        if GetIsVehicleEngineRunning(p_Veh) then
                            TaskLeaveVehicle(PlayerPedId(), p_Veh, 256)
                        else
                            TaskLeaveVehicle(PlayerPedId(), p_Veh, 1)
                        end
                    end
                end
            end
        end
    end
end)