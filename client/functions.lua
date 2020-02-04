TAC                     = {}
TAC.CurrentRequestId    = 0
TAC.ServerCallbacks     = {}
TAC.ClientCallbacks     = {}
TAC.ClientEvents        = {}
TAC.Config              = {}
TAC.SecurityTokens      = {}

TAC.RegisterClientCallback = function(name, cb)
    TAC.ClientCallbacks[name] = cb
end

TAC.RegisterClientEvent = function(name, cb)
    TAC.ClientEvents[name] = cb
end

TAC.TriggerServerCallback = function(name, cb, ...)
    TAC.ServerCallbacks[TAC.CurrentRequestId] = cb

    local token = TAC.GetResourceToken(GetCurrentResourceName())

    TriggerServerEvent('tigoanticheat:triggerServerCallback', name, TAC.CurrentRequestId, token, ...)

    if (TAC.CurrentRequestId < 65535) then
        TAC.CurrentRequestId = TAC.CurrentRequestId + 1
    else
        TAC.CurrentRequestId = 0
    end
end

TAC.TriggerServerEvent = function(name, ...)
    local token = TAC.GetResourceToken(GetCurrentResourceName())

    TriggerServerEvent('tigoanticheat:triggerServerEvent', name, token, ...)
end

TAC.TriggerClientCallback = function(name, cb, ...)
    if (TAC.ClientCallbacks ~= nil and TAC.ClientCallbacks[name] ~= nil) then
        TAC.ClientCallbacks[name](cb, ...)
    end
end

TAC.TriggerClientEvent = function(name, ...)
    if (TAC.ClientEvents ~= nil and TAC.ClientEvents[name] ~= nil) then
        TAC.ClientEvents[name](...)
    end
end

TAC.ShowNotification = function(msg)
    AddTextEntry('tacNotification', msg)
	SetNotificationTextEntry('tacNotification')
	DrawNotification(false, true)
end

RegisterNetEvent('tigoanticheat:serverCallback')
AddEventHandler('tigoanticheat:serverCallback', function(requestId, ...)
	if (TAC.ServerCallbacks ~= nil and TAC.ServerCallbacks[requestId] ~= nil) then
		TAC.ServerCallbacks[requestId](...)
        TAC.ServerCallbacks[requestId] = nil
	end
end)