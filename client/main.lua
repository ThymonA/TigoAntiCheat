TAC.ServerConfigLoaded = false

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    TAC.TriggerServerEvent('tigoanticheat:playerResourceStarted')
end)

Citizen.CreateThread(function()
    TAC.LaodServerConfig()

    Citizen.Wait(1000)

    while not TAC.ServerConfigLoaded do
        Citizen.Wait(1000)

        TAC.LaodServerConfig()
    end

    return
end)

TAC.LaodServerConfig = function()
    if (not TAC.ServerConfigLoaded) then
        TAC.TriggerServerCallback('tigoanticheat:getServerConfig', function(config)
            TAC.Config = config
            TAC.Config.BlacklistedWeapons = {}
            TAC.Config.BlacklistedVehicles = {}
            TAC.Config.HasBypass = TAC.Config.HasBypass or false

            for _, blacklistedWeapon in pairs(Config.BlacklistedWeapons) do
                TAC.Config.BlacklistedWeapons[blacklistedWeapon] = GetHashKey(blacklistedWeapon)
            end

            for _, blacklistedVehicle in pairs(Config.BlacklistedVehicles) do
                TAC.Config.BlacklistedVehicles[blacklistedVehicle] = GetHashKey(blacklistedVehicle)
            end

            TAC.ServerConfigLoaded = true
        end)
    end
end
