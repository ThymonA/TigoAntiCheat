TAC.RegisterClientEvent('tigoanticheat:storeSecurityToken', function(newToken)
    if (TAC.SecurityTokens == nil) then
        TAC.SecurityTokens = {}
    end

    TAC.SecurityTokens[newToken.name] = newToken

    TAC.TriggerServerEvent('tigoanticheat:storeSecurityToken', newToken.name)
end)

TAC.GetResourceToken = function(resource)
    if (resource ~= nil) then
        local securityTokens = TAC.SecurityTokens or {}
        local resourceToken = securityTokens[resource] or {}
        local token = resourceToken.token or nil

        return token
    end

    return nil
end