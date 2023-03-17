RegisterKeyMapping('LockVehicle', 'Lock Vehicle', 'KEYBOARD', 'NUMPADENTER')
RegisterCommand('LockVehicle', function(source, args)
    local p_ = PlayerPedId()
    local p_Veh = GetNearestOwnedVehicle();

    if(p_Veh == nil) then return end;

    -- OWNERSHIP --
    local p_Veh_State = GetState(p_Veh, "Keys")
    if p_Veh_State == nil then return end
    if p_Veh_State.Owned == nil or p_Veh_State.Owned == false then return end
    if tostring(p_Veh_State.Owner) ~= tostring(GetPlayerServerId(PlayerId())) then
        NotifyLocalPlayer("You do not have the Keys for this Vehicle.")
        return
    end

    -- LOCK STATUS --
    local p_Veh_State2 = GetState(p_Veh, "vLock")
    if p_Veh_State2 == nil then p_Veh_State2 = {Locked = false} end
    if p_Veh_State2.Locked == false then
        p_Veh_State2.Locked = true
        SetVehicleDoorsLocked(p_Veh, 2)
        NotifyLocalPlayerShort("Vehicle Locked.")
    else
        p_Veh_State2.Locked = false
        SetVehicleDoorsLocked(p_Veh, 1)
        NotifyLocalPlayerShort("Vehicle Unlocked.")
    end
    SetState(p_Veh, "vLock", p_Veh_State2)
end, false)