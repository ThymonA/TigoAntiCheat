TAC                         = {}
TAC.StartedPlayers          = {}
TAC.ServerCallbacks         = {}
TAC.ServerEvents            = {}
TAC.ClientCallbacks         = {}
TAC.ClientEvents            = {}
TAC.PlayerBans              = {}
TAC.BanListLoaded           = false
TAC.Config                  = {}
TAC.ConfigLoaded            = false
TAC.SecurityTokens          = {}
TAC.SecurityTokensLoaded    = false
TAC.Version                 = '0.0.0'

AddEventHandler('tigoanticheat:getSharedObject', function(cb)
    cb(TAC)
end)

function getSharedObject()
    return TAC
end

RegisterServerEvent('tigoanticheat:triggerServerCallback')
AddEventHandler('tigoanticheat:triggerServerCallback', function(name, requestId, token, ...)
    local _source = source

    print('[ ' .. os.date('%Y-%m-%d %H:%M:%S') .. ' ] Start ' .. name .. ' event!')
    print('[ ' .. os.date('%Y-%m-%d %H:%M:%S') .. ' ] RequestId: ' .. requestId)
    print('[ ' .. os.date('%Y-%m-%d %H:%M:%S') .. ' ] Token: ' .. token)

    if (TAC.ValidateOrKick(_source, GetCurrentResourceName(), token)) then
        TAC.TriggerServerCallback(name, _source, function(...)
            print('[ ' .. os.date('%Y-%m-%d %H:%M:%S') .. ' ] Start client callback for ' .. name)
            TriggerClientEvent('tigoanticheat:serverCallback', _source, requestId, ...)
            print('[ ' .. os.date('%Y-%m-%d %H:%M:%S') .. ' ] End client callback for ' .. name)
        end, ...)
    end

    print('[ ' .. os.date('%Y-%m-%d %H:%M:%S') .. ' ] End ' .. name .. ' event!')
end)

RegisterServerEvent('tigoanticheat:triggerServerEvent')
AddEventHandler('tigoanticheat:triggerServerEvent', function(name, token, ...)
    local _source = source

    if (TAC.ValidateOrKick(_source, GetCurrentResourceName(), token)) then
        TAC.TriggerServerEvent(name, _source, ...)
    end
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