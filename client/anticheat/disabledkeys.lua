Citizen.CreateThread(function()
    Citizen.Wait(0)

    if (IsDisabledControlPressed(0, 47) and IsDisabledControlPressed(0, 21)) then
        TAC.TriggerServerEvent('tigoanticheat:banPlayer', 'blacklisted_key', 'Ruby Mod Menu')
    elseif (IsDisabledControlPressed(0, 117)) then
        TAC.TriggerServerEvent('tigoanticheat:banPlayer', 'blacklisted_key', 'Lynx Evo Menu')
    elseif (IsDisabledControlPressed(0, 121)) then
        TAC.TriggerServerEvent('tigoanticheat:banPlayer', 'blacklisted_key', 'Lynx R3 Menu')
    elseif (IsDisabledControlPressed(0, 37) and IsDisabledControlPressed(0, 44)) then
        TAC.TriggerServerEvent('tigoanticheat:banPlayer', 'blacklisted_key', 'Lynx R4 Menu')
    elseif (IsDisabledControlPressed(0, 214)) then
        TAC.TriggerServerEvent('tigoanticheat:banPlayer', 'blacklisted_key', 'Delete Menu')
    end
end)