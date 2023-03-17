RegisterKeyMapping('RegisterVehicleKeys', 'Register Vehicle Keys', 'KEYBOARD', 'SLASH')
RegisterCommand('RegisterVehicleKeys', function()
    local p_ = PlayerPedId()
    local p_Veh = GetVehiclePedIsIn(p_, false)

    if IsEntityDead(p_) then return end
    if not DoesEntityExist(p_) then return end
    if IsEntityDead(p_Veh) then return end
    if not DoesEntityExist(p_Veh) then return end
    if p_Veh == 0 then return end
    if GetState(p_Veh, "Keys") ~= nil then
        if GetState(p_Veh, "Keys").Owned ~= nil then
            if GetState(p_Veh, "Keys").Owned == true then return end
        end
    end

    local uTable = {Owned = true, Owner = GetPlayerServerId(PlayerId())}

    SetState(p_Veh, "Keys", uTable)
    NotifyLocalPlayer("You now own the Keys for this Vehicle")
    return
end, false)

RegisterCommand('GiveVehicleKeys', function(source, args)
    local p_ = PlayerPedId()
    local p_Veh = GetNearestOwnedVehicle()
    local t_ = tonumber(args[1])
    local t_Ped = GetPlayerPed(GetPlayerFromServerId(t_))

    if p_Veh == nil then return end
    if t_Ped == nil then return end
    if t_Ped == 0 then return end
    if IsEntityDead(p_) then return end

    local v_State = GetState(p_Veh, "Keys")
    v_State.Owner = t_

    SetState(p_Veh, "Keys", v_State)
    NotifyLocalPlayer("You gave player #" .. t_ .. " the keys to your vehicle.")
    NotifyPlayer(t_, "Player #" .. GetPlayerServerId(PlayerId()) .. " gave you the keys to their vehicle.")
    return
end, false)

RegisterCommand('TakeVehicleKeys', function(source, args)
    local p_ = PlayerPedId()
    local t_ = tonumber(args[1])
    local t_Ped = GetPlayerPed(GetPlayerFromServerId(t_))
    local t_Veh = GetNearestOwnedVehicle(t_)
    local t_Dist = GetDistanceBetweenEntities(t_Ped, p_)

    if t_Veh == nil then return end
    if t_Ped == nil then return end
    if t_Ped == 0 then return end
    if t_Dist > 10.0 then return end
    if IsEntityDead(p_) then return end
    if GetVehiclePedIsIn(p_, false) ~= 0 then return end
    if GetVehiclePedIsIn(t_Ped, false) ~= 0 then return end

    local v_State = GetState(p_Veh, "Keys")
    v_State.Owner = t_

    SetState(p_Veh, "Keys", v_State)
    NotifyLocalPlayer("You took player #" .. t_ .. "'s keys.")
    NotifyPlayer(t_, "Player #" .. GetPlayerServerId(PlayerId()) .. " took your keys.")
    return
end, false)

RegisterCommand('IsMyVehicle', function(source, args)
    local p_ = PlayerPedId()
    local p_Veh = GetVehiclePedIsIn(p_, false)

    if GetState(p_Veh, "Keys") == nil then return end
    if GetState(p_Veh, "Keys").Owner == nil then return end

    if GetState(p_Veh, "Keys").Owner == GetPlayerServerId(PlayerId()) then
        print("Yes")
    else
        print("No")
    end
end, false)