Citizen.CreateThread(function()
	while true do
		Wait(100)
        local playerped = PlayerPedId();
        local currentvehicle = GetVehiclePedIsIn(playerped, false)

		if IsPedInAnyVehicle(playerped, false) then
			SetPedConfigFlag(playerped, 184, true)

			if GetIsTaskActive(playerped, 165) then

				local seat = 0

				if GetPedInVehicleSeat(currentvehicle, -1) == playerped then
					seat = -1
				end

				SetPedIntoVehicle(playerped, currentvehicle, seat)
			end
		end
	end
end)