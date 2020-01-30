AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    TAC.TriggerServerEvent('tigoanticheat:playerResourceStarted')
end)

Citizen.CreateThread(function()
    local configLoaded = false

    while not configLoaded do
        Citizen.Wait(100)

        TAC.TriggerServerCallback('tigoanticheat:getServerConfig', function(config)
            TAC.Config = config
            TAC.Config.BlacklistedWeapons = {}
            TAC.Config.BlacklistedVehicles = {}

            for _, blacklistedWeapon in pairs(Config.BlacklistedWeapons) do
                TAC.Config.BlacklistedWeapons[blacklistedWeapon] = GetHashKey(blacklistedWeapon)
            end

            for _, blacklistedVehicle in pairs(Config.BlacklistedVehicles) do
                TAC.Config.BlacklistedVehicles[blacklistedVehicle] = GetHashKey(blacklistedVehicle)
            end

            configLoaded = true
        end)
    end

    return
end)