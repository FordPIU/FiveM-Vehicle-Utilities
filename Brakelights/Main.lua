Citizen.CreateThread(function()
    while true do
        Wait(10);

        local p = PlayerPedId();
        local pv = GetVehiclePedIsIn(p, false);

        if(pv ~= 0) then
            if(GetEntitySpeed(pv) <= 0.04) then
                SetVehicleBrakeLights(pv, true)
            end
        end
    end
end)