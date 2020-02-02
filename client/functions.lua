TAC                     = {}
TAC.CurrentRequestId    = 0
TAC.ServerCallbacks     = {}
TAC.ClientCallbacks     = {}
TAC.ClientEvents        = {}
TAC.Config              = {}

TAC.RegisterClientCallback = function(name, cb)
    TAC.ClientCallbacks[name] = cb
end

TAC.RegisterClientEvent = function(name, cb)
    TAC.ClientEvents[name] = cb
end

TAC.TriggerServerCallback = function(name, cb, ...)
    TAC.ServerCallbacks[TAC.CurrentRequestId] = cb

    TriggerServerEvent('tigoanticheat:triggerServerCallback', name, TAC.CurrentRequestId, ...)

    if (TAC.CurrentRequestId < 65535) then
        TAC.CurrentRequestId = TAC.CurrentRequestId + 1
    else
        TAC.CurrentRequestId = 0
    end
end

TAC.TriggerServerEvent = function(name, ...)
    TriggerServerEvent('tigoanticheat:triggerServerEvent', name, ...)
end

TAC.TriggerClientCallback = function(name, cb, ...)
    if (TAC.ClientCallbacks ~= nil and TAC.ClientCallbacks[name] ~= nil) then
        TAC.ClientCallbacks[name](cb, ...)
    else
        TAC.TriggerServerEvent('tigoanticheat:logToConsole', '[TigoAntiCheat] TriggerClientCallback => ' .. _('callback_not_found', name))
    end
end

TAC.TriggerClientEvent = function(name, ...)
    if (TAC.ClientEvents ~= nil and TAC.ClientEvents[name] ~= nil) then
        TAC.ClientEvents[name](...)
    else
        TAC.TriggerServerEvent('tigoanticheat:logToConsole', '[TigoAntiCheat] TriggerClientEvent => ' .. _('trigger_not_found', name))
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