function TurnIgnition(Up)
    local p_ = PlayerPedId()
    local p_Veh = GetVehiclePedIsIn(p_, false)

    if IsEntityDead(p_) then return end
    if p_Veh == 0 then return end
    if IsEntityDead(p_Veh) then return end

    local p_Veh_State = GetState(p_Veh, "vState")
    local p_Veh_State2 = GetState(p_Veh, "Keys")

    if p_Veh_State2 == nil then return end
    if p_Veh_State2.Owned == nil or p_Veh_State2.Owned == false then return end
    if tostring(p_Veh_State2.Owner) ~= tostring(GetPlayerServerId(PlayerId())) then
        NotifyLocalPlayer("You do not have the Keys for this Vehicle.")
        return
    end
    if p_Veh_State == nil then
        p_Veh_State = {
            Iginition = 2
        }
    end
    if p_Veh_State.Iginition == nil then
        p_Veh_State.Iginition = 2
    end

    local n_Ignition = p_Veh_State.Iginition

    if Up then
        n_Ignition = n_Ignition + 1
        if n_Ignition > 2 then return end
    else
        n_Ignition = n_Ignition - 1
        if n_Ignition < 0 then return end
    end
    
    p_Veh_State.Iginition = n_Ignition

    SetState(p_Veh, "vState", p_Veh_State)

    if n_Ignition == 0 then
        NotifyLocalPlayerShort("You turned the Vehicle Off.")
    end
    if n_Ignition == 1 then
        NotifyLocalPlayerShort("You turned the Vehicle Electricity On.")
    end
    if n_Ignition == 2 then
        NotifyLocalPlayerShort("You turned the Vehicle On.")
    end
end

RegisterKeyMapping('TurnIgnitionUp', 'Turn the Ignition Forwards', 'KEYBOARD', 'PAGEUP')
RegisterCommand('TurnIgnitionUp', function()
    TurnIgnition(true)
end, false)

RegisterKeyMapping('TurnIgnitionDown', 'Turn the Ignition Backwards', 'KEYBOARD', 'PAGEDOWN')
RegisterCommand('TurnIgnitionDown', function()
    TurnIgnition(false)
end, false)