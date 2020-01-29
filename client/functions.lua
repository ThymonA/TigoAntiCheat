TAC                     = {}
TAC.CurrentRequestId    = 0
TAC.ServerCallbacks     = {}
TAC.Config              = {}

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