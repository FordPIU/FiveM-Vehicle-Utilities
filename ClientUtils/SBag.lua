function GetState(p_Entity, p_Folder)
    local c_State = Entity(p_Entity).state[p_Folder]
    return c_State
end

function SetState(p_Entity, p_Folder, p_Value)
    TriggerServerEvent("CRVE:SETSTATE", NetworkGetNetworkIdFromEntity(p_Entity), p_Folder, p_Value)
end