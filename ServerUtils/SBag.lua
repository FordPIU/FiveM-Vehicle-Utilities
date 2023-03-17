RegisterNetEvent("CRVE:SETSTATE")
AddEventHandler("CRVE:SETSTATE", function(p1, p2, p3)
    local e1 = NetworkGetEntityFromNetworkId(p1)
    
    Entity(e1).state[p2] = p3
end)