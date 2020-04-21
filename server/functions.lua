TAC.RegisterServerCallback = function(name, cb)
    TAC.ServerCallbacks[name] = cb
end

TAC.RegisterServerEvent = function(name, cb)
    TAC.ServerEvents[name] = cb
end

TAC.TriggerClientCallback = function(source, name, cb, ...)
    local playerId = tostring(source)

    if (TAC.ClientCallbacks == nil) then
        TAC.ClientCallbacks = {}
    end

    if (TAC.ClientCallbacks[playerId] == nil) then
        TAC.ClientCallbacks[playerId] = {}
        TAC.ClientCallbacks[playerId]['CurrentRequestId'] = 0
    end

    TAC.ClientCallbacks[playerId][tostring(TAC.ClientCallbacks[playerId]['CurrentRequestId'])] = cb

    TriggerClientEvent('tigoanticheat:triggerClientCallback', source, name, TAC.ClientCallbacks[playerId]['CurrentRequestId'], ...)

    if (TAC.ClientCallbacks[playerId]['CurrentRequestId'] < 65535) then
        TAC.ClientCallbacks[playerId]['CurrentRequestId'] = TAC.ClientCallbacks[playerId]['CurrentRequestId'] + 1
    else
        TAC.ClientCallbacks[playerId]['CurrentRequestId'] = 0
    end
end

TAC.TriggerServerCallback = function(name, source, cb, ...)
    if (TAC.ServerCallbacks ~= nil and TAC.ServerCallbacks[name] ~= nil) then
        TAC.ServerCallbacks[name](source, cb, ...)
    else
        print('[TigoAntiCheat] TriggerServerCallback => ' .. _('callback_not_found', name))
    end
end

TAC.TriggerServerEvent = function(name, source, ...)
    if (TAC.ServerEvents ~= nil and TAC.ServerEvents[name] ~= nil) then
        TAC.ServerEvents[name](source, ...)
    else
        print('[TigoAntiCheat] TriggerServerEvent => ' .. _('trigger_not_found', name))
    end
end

RegisterServerEvent('tigoanticheat:clientCallback')
AddEventHandler('tigoanticheat:clientCallback', function(requestId, ...)
    local _source = source
    local playerId = tonumber(_source)

    if (TAC.ClientCallbacks ~= nil and TAC.ClientCallbacks[playerId] ~= nil and TAC.ClientCallbacks[playerId][requestId] ~= nil) then
        TAC.ClientCallbacks[playerId][tostring(requestId)](...)
        TAC.ClientCallbacks[playerId][tostring(requestId)] = nil
    end
end)

TAC.GeneratedNewResourceName = function()
    local prefix = { 'esx_policejob', 'esx_ambulancejob', 'esx_taxijob', 'esx_bankerjob', 'esx_vigneronjob', 'esx_fuelerjob', 'esx_mecanojob', 'esx_garbagejob', 'esx_lscustom', 'esx_jobs', 'esx_joblisting', 'esx_pizza', 'esx_blanchisseur', 'esx_pilot', 'esx_carthief', 'esx_godirtyjob', 'esx_ranger', 'esx_fueldelivery', 'esx_truckerjob', 'esx_gopostaljob', 'esx_banksecurity', 'delivery', 'taxi', 'dmv', 'whoapd', 'paramedic', 'ems', 'Banca', 'Sasaki_kurier', 'neweden_garage' }
    local suffix = { 'confiscatePlayerItem', 'handcuff', 'drag', 'putInVehicle', 'OutVehicle', 'getStockItem', 'putStockItems', 'spawned', 'forceBlip', 'giveWeapon', 'setVehicleState', 'message', 'buyMod', 'refreshOwnedVehicle', 'startHarvest', 'stopHarvest', 'startHarvest2', 'stopHarvest2', 'startHarvest3', 'stopHarvest3', 'startCraft', 'stopCraft', 'startCraft2', 'stopCraft2', 'startCraft3', 'stopCraft3', 'onNPCJobMissionCompleted', 'pay', 'setJob', 'setCautionInCaseOfDrop', 'giveBackCautionInCaseOfDrop', 'startWork', 'stopWork', 'caution', 'revive', 'heal', 'placeinback', 'removeItem', 'giveItem', 'firstSpawn', 'setDeathStatus', 'success', 'startWhitening', 'withdraw', 'billPlayer', }

    math.randomseed(TAC.ToInt(os.time() / math.random(1, 99)))

    local randomInt = math.random(1, #prefix)

    math.randomseed(TAC.ToInt(os.time() / math.random(1, 99)))

    local randomInt2 = math.random(1, #suffix)

    local prefixName = prefix[randomInt]
    local suffixName = suffix[randomInt2]

    return prefixName .. '_' .. suffixName
end

TAC.ToInt = function(input)
    return math.floor(input + 0.5)
end