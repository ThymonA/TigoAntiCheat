TAC.RegisterServerCallback = function(name, cb)
    TAC.ServerCallbacks[name] = cb
end

TAC.RegisterServerEvent = function(name, cb)
    TAC.ServerEvents[name] = cb
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