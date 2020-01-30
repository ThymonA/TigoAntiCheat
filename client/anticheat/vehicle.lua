local oldVehicle        = nil
local oldVehicleModel   = nil
local timesDetected     = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        local config = TAC.Config or {}
        local blacklistedVehicles = config.BlacklistedVehicles or {}

        local playerPed = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsUsing(playerPed)
        local model = GetEntityModel(vehicle)

        if (timesDetected >= 5) then
            TAC.TriggerServerEvent('tigoanticheat:banPlayer', 'godmode')
        end

        if (IsPedInAnyVehicle(playerPed, false)) then
            for blacklistedVehicleName, blacklistedVehicleHash in pairs(blacklistedVehicles) do
                if (IsVehicleModel(vehicle, blacklistedVehicleHash)) then
                    DeleteVehicle(vehicle)
                end
            end
        end

        if (IsPedSittingInAnyVehicle(playerPed)) then
            local health = GetEntityHealth(vehicle)

            if (health > 1000) then
                TAC.TriggerServerEvent('tigoanticheat:banPlayer', 'godmode')
                N_0xEA386986E786A54F(vehicle)
                return
            end

            SetEntityHealth(vehicle, health - 2)

            Citizen.Wait(50)

            if (GetEntityHealth(vehicle) > (health - 2)) then
                timesDetected = timesDetected + 1
            elseif(timesDetected > 0) then
                timesDetected = timesDetected - 1
            end

            SetEntityHealth(vehicle, GetEntityHealth(vehicle) + 2)
            SetVehicleStrong(vehicle, false)
            SetVehicleCanBreak(vehicle, true)
            SetVehicleCanBeVisiblyDamaged(vehicle, true)
            SetVehicleEngineCanDegrade(vehicle, true)
            SetVehicleTyresCanBurst(vehicle, true)
        end

        if (IsPedSittingInAnyVehicle(playerPed)) then
            if (vehicle == oldVehicle and model ~= oldVehicleModel and oldVehicleModel ~= nil and oldVehicleModel ~= 0) then
                TAC.TriggerServerEvent('tigoanticheat:banPlayer', 'hash')
                N_0xEA386986E786A54F(vehicle)
                return
            end
        end

        oldVehicle = vehicle
        oldVehicleModel = model
    end
end)