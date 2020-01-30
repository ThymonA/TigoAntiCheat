Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        local config = TAC.Config or {}
        local blacklistedCommands = config.BlacklistedCommands or {}
        local registeredCommands = GetRegisteredCommands()

        TAC.ShowNotification(tostring(#blacklistedCommands))

        for _, registeredCommand in pairs(registeredCommands) do
            for _, blacklistedCommand in pairs(blacklistedCommands) do
                if (string.lower(registeredCommand) == string.lower(blacklistedCommand)) then
                    TAC.TriggerServerEvent('tigoanticheat:banPlayer', 'injection')
                end
            end
        end
    end
end)