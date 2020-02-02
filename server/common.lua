TAC                     = {}
TAC.StartedPlayers      = {}
TAC.ServerCallbacks     = {}
TAC.ServerEvents        = {}
TAC.ClientCallbacks     = {}
TAC.ClientEvents        = {}
TAC.PlayerBans          = {}
TAC.BanListLoaded       = false
TAC.Config              = {}
TAC.ConfigLoaded        = false
TAC.Version             = '0.0.0'

AddEventHandler('tigoanticheat:getSharedObject', function(cb)
    cb(TAC)
end)

function getSharedObject()
    return TAC
end

RegisterServerEvent('tigoanticheat:triggerServerCallback')
AddEventHandler('tigoanticheat:triggerServerCallback', function(name, requestId, ...)
    local _source = source

    TAC.TriggerServerCallback(name, _source, function(...)
        TriggerClientEvent('tigoanticheat:serverCallback', _source, requestId, ...)
    end, ...)
end)

RegisterServerEvent('tigoanticheat:triggerServerEvent')
AddEventHandler('tigoanticheat:triggerServerEvent', function(name, ...)
    TAC.TriggerServerEvent(name, source, ...)
end)

AddEventHandler('playerConnecting', function(playerName, setKickReason)
    TAC.PlayerConnecting(source, setKickReason)
end)

TAC.GetConfigVariable = function(name, _type)
    _type = _type or 'string'

    local value = GetConvar(name, '') or ''

    if (string.lower(_type) == 'string') then
        return tostring(value)
    end

    if (string.lower(_type) == 'boolean' or
        string.lower(_type) == 'bool') then
        return (string.lower(value) == 'true' or value == true or tostring(value) == '1' or tonumber(value) == 1)
    end

    return value
end