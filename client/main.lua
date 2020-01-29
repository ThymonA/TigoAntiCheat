Citizen.CreateThread(function()
    local configLoaded = false

    while not configLoaded do
        Citizen.Wait(100)

        TAC.TriggerServerCallback('tigoanticheat:getServerConfig', function(config)
            TAC.Config = config

            configLoaded = true
        end)
    end

    return
end)