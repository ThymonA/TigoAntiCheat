TAC.RegisterServerCallback = function(name, cb)
    TAC.ServerCallbacks[name] = cb
end

TAC.TriggerServerCallback = function(name, requestId, source, cb, ...)
    if (TAC.ServerCallbacks ~= nil and TAC.ServerCallbacks[name] ~= nil) then
        TAC.ServerCallbacks[name](source, cb, ...)
    else
        print('[TigoAntiCheat] TriggerServerCallback => ' .. _('callback_not_found', name))
    end
end