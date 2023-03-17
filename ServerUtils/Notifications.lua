RegisterNetEvent("CRVE:NP")
AddEventHandler("CRVE:NP", function(p1, p2)
    TriggerClientEvent("CRVE:NPC", p1, p2)
end)