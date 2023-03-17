local lastAngle = 0.0
local function DisableDriving()
    DisableControlAction(0, 71, true)
    DisableControlAction(0, 72, true)
end

function Every100()

end

function EveryFrame(p_Veh_State, p_Veh)
    if p_Veh_State.Iginition == 0 then
        DisableDriving()
    end
    if p_Veh_State.Iginition == 1 then
        DisableDriving()
    end
    if p_Veh_State.Iginition == 2 then
    end
end
function EveryFrame2(p_Veh_State, p_Veh)
    if p_Veh_State.Iginition == 0 then
        if IsControlPressed(0, 63) or IsControlPressed(0, 64) then else
            if(GVAR_ISSTEERINGENABLED) then
                SetVehicleSteeringAngle(p_Veh, lastAngle)
            end
        end
        SetVehicleEngineOn(p_Veh, false, true, true)
    end
    if p_Veh_State.Iginition == 1 then
        if IsControlPressed(0, 63) or IsControlPressed(0, 64) then else
            if(GVAR_ISSTEERINGENABLED) then
                SetVehicleSteeringAngle(p_Veh, lastAngle)
            end
        end
        SetVehicleEngineOn(p_Veh, true, true, true)
    end
    if p_Veh_State.Iginition == 2 then
        SetVehicleEngineOn(p_Veh, true, true, true)

        if GetEntitySpeed(p_Veh) < 0.1 then
            if IsControlPressed(0, 63) or IsControlPressed(0, 64) then else
                if(GVAR_ISSTEERINGENABLED) then
                    SetVehicleSteeringAngle(p_Veh, lastAngle)
                end
            end
        end
    end
    lastAngle = GetVehicleSteeringAngle(p_Veh)
end

Citizen.CreateThread(function()
    local LastGameTimer = GetGameTimer()

    while true do
        Wait(0)

        local p_ = PlayerPedId()
        local p_Veh = GetVehiclePedIsIn(p_, false)
        local p_Veh_State = GetState(p_Veh, "vState")

        if p_Veh_State ~= nil then

            EveryFrame(p_Veh_State, p_Veh)

            if GetGameTimer() > LastGameTimer then
                LastGameTimer = GetGameTimer() + 100

                Every100()
            end
        end

        local p_Veh2 = GetVehiclePedIsIn(p_, true)
        local p_Veh_State2 = GetState(p_Veh2, "vState")

        if p_Veh_State2 ~= nil then

            EveryFrame2(p_Veh_State2, p_Veh2)

            if GetGameTimer() > LastGameTimer then
                LastGameTimer = GetGameTimer() + 100

                Every100()
            end
        end
    end
end)