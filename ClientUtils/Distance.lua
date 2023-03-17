function GetDistanceBetweenEntities(p1, p2)
    local d1 = GetEntityCoords(p1)
    local d2 = GetEntityCoords(p2)

    return #(d1 - d2)
end