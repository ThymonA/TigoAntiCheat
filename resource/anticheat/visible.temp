Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        local playedPed = GetPlayerPed(-1)

        if (not IsEntityVisible(playedPed)) then
            {{{module}}}.TriggerServerEvent('{{{resource}}}:{{{banPlayer}}}', '{{{visible}}}')
        end

        if (IsPedSittingInAnyVehicle(playedPed) and IsVehicleVisible(GetVehiclePedIsIn(playedPed, 1))) then
            {{{module}}}.TriggerServerEvent('{{{resource}}}:{{{banPlayer}}}', '{{{invisiblevehicle}}}')
        end
    end
end)