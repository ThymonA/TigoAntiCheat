Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPedId = PlayerPedId()
        local playerPed = GetPlayerPed(-1)

        if (IsPedJumping(playerPedId)) then
            local firstCoord = GetEntityCoords(playerPed)

            while IsPedJumping(playerPedId) do
                Citizen.Wait(0)
            end

            local secondCoord = GetEntityCoords(playerPed)
            local lengthBetweenCoords = GetDistanceBetweenCoords(firstCoord, secondCoord, false)

            if (lengthBetweenCoords > 250.0) then
                TAC.TriggerServerEvent('tigoanticheat:banPlayer', 'superjump')
            end
        end
    end
end)