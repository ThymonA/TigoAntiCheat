TAC                     = {}
TAC.Players             = {}
TAC.ServerCallbacks     = {}
TAC.PlayerBans          = {}
TAC.BanListLoaded       = false

AddEventHandler('tac:getSharedObject', function(cb)
    cb(TAC)
end)

function getSharedObject()
    return TAC
end

RegisterServerEvent('tac:triggerServerCallback')
AddEventHandler('tac:triggerServerCallback', function(name, requestId, ...)
    local _source = source

    TAC.TriggerServerCallback(name, requestId, _source, function(...)
        TriggerClientEvent('tac:serverCallback', _source, ...)
    end, ...)
end)

AddEventHandler('playerConnecting', function(playerName, setKickReason)
    TAC.PlayerConnecting(source, setKickReason)
end)