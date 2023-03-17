function NotifyLocalPlayer(p1)
    exports["CR-Core"]:crANotify(p1, 1, 2, true)
end
function NotifyLocalPlayerShort(p1)
    exports["CR-Core"]:crANotify(p1, 1, 1, false)
end
function NotifyPlayer(p1, p2)
    TriggerServerEvent("CRVE:NP", p1, p2)
end
RegisterNetEvent("CRVE:NPC")
AddEventHandler("CRVE:NPC", function(p1)
    NotifyLocalPlayer(p1)
end)