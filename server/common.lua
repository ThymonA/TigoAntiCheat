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
TAC.WhitelistedIPs          = {}
TAC.WhitelistedIPsLoaded    = false
TAC.CheckedIPs              = {}
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

    if (TAC.ValidateOrKick(_source, GetCurrentResourceName(), token)) then
        TAC.TriggerServerCallback(name, _source, function(...)
            TriggerClientEvent('tigoanticheat:serverCallback', _source, requestId, ...)
        end, ...)
    end
end)

RegisterServerEvent('tigoanticheat:triggerServerEvent')
AddEventHandler('tigoanticheat:triggerServerEvent', function(name, token, ...)
    local _source = source

    if (TAC.ValidateOrKick(_source, GetCurrentResourceName(), token)) then
        TAC.TriggerServerEvent(name, _source, ...)
    end
end)

AddEventHandler('playerConnecting', function(name, setCallback, deferrals)
    TAC.PlayerConnecting(source, setCallback, deferrals)
end)

TAC.GetConfigVariable = function(name, _type, _default)
    _type = _type or 'string'
    _default = _default or ''

    local value = GetConvar(name, _default) or _default

    if (string.lower(_type) == 'string') then
        return tostring(value)
    end

    if (string.lower(_type) == 'boolean' or
        string.lower(_type) == 'bool') then
        return (string.lower(value) == 'true' or value == true or tostring(value) == '1' or tonumber(value) == 1)
    end

    return value
end