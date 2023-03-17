function GetNearestOwnedVehicle(p1)
    local TargetOwner = p1
    local rVehicle = nil
    local rDist = 50.0

    if TargetOwner == nil then TargetOwner = GetPlayerServerId(PlayerId()) end

    local tCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(TargetOwner)))

    for _,v in pairs(GetGamePool("CVehicle")) do
        local KeysState = GetState(v, "Keys")

        if KeysState ~= nil then
            if KeysState.Owner ~= nil and tostring(KeysState.Owner) == tostring(TargetOwner) then
                local vDist = #(tCoords - GetEntityCoords(v))

                if vDist < rDist then
                    rDist = vDist
                    rVehicle = v
                end
            end
        end
    end

    return rVehicle
end

function GetClosestVehicleOfAnyHash(p1)
    local rVehicle = nil
    local rDist = 50.0

    for _,v in pairs(GetGamePool("CVehicle")) do
        local dist = #(GetEntityCoords(v) - p1)

        if dist < rDist then
            rDist = dist
            rVehicle = v
        end
    end

    return rVehicle
end