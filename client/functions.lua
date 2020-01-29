TAC                     = {}
TAC.CurrentRequestId    = {}
TAC.ServerCallbacks     = {}

TAC.TriggerServerCallback = function(name, cb, ...)
    TAC.ServerCallbacks[TAC.CurrentRequestId] = cb

    TriggerServerEvent('tac:triggerServerCallback', name, TAC.CurrentRequestId, ...)

    if (TAC.CurrentRequestId < 65535) then
        TAC.CurrentRequestId = TAC.CurrentRequestId + 1
    else
        TAC.CurrentRequestId = 0
    end
end