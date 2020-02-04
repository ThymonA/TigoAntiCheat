TAC.LoadSecurityTokens = function()
    local tokenContent = LoadResourceFile(GetCurrentResourceName(), 'data/token.json')

    if (not tokenContent) then
        local newTokenList = json.encode({})

        tokenContent = newTokenList

        SaveResourceFile(GetCurrentResourceName(), 'data/token.json', newTokenList, -1)
    end

    local storedTokens = json.decode(tokenContent)

    if (not storedTokens) then
        print('-------------------!' .. _('fatal_error') .. '!------------------\n')
        print(_('failed_to_load_tokenlist') .. '\n')
        print(_('failed_to_load_check') .. '\n')
        print('-------------------!' .. _('fatal_error') .. '!------------------\n')

        TAC.SecurityTokens = {}
    else
        TAC.SecurityTokens = storedTokens
    end

    TAC.SecurityTokensLoaded = true
end

TAC.SaveSecurityTokens = function()
    SaveResourceFile(GetCurrentResourceName(), 'data/token.json', json.encode(TAC.SecurityTokens or {}, { indent = true }), -1)
end

TAC.GetSteamIdentifier = function(source)
    if (source == nil) then
        return ''
    end

    local playerId = tonumber(source)

    if (playerId <= 0) then
        return ''
    end

    local identifiers, steamIdentifier = GetPlayerIdentifiers(source)

    for _, identifier in pairs(identifiers) do
        if (string.match(string.lower(identifier), 'steam:')) then
            steamIdentifier = identifier
        end
    end

    return steamIdentifier
end

TAC.GetClientSecurityToken = function(source, resource)
    if (TAC.SecurityTokens ~= nil and TAC.SecurityTokens[tostring(source)] ~= nil) then
        local steamIdentifier = TAC.GetSteamIdentifier(source)

        for _, resourceToken in pairs(TAC.SecurityTokens[tostring(source)]) do
            if (resourceToken.name == resource and resourceToken.steam == steamIdentifier) then
                return resourceToken
            elseif (resourceToken.name == resource) then
                table.remove(TAC.SecurityTokens[tostring(source)], _)
            end
        end
    end

    return nil
end

TAC.GenerateSecurityToken = function(source, resource)
    local currentToken = TAC.GetClientSecurityToken(source, resource)

    if (currentToken == nil) then
        local newResourceToken = {
            name = resource,
            token = TAC.RandomString(Config.TokenLength),
            time = os.time(),
            steam = TAC.GetSteamIdentifier(source),
            shared = false
        }

        if (TAC.SecurityTokens == nil) then
            TAC.SecurityTokens = {}
        end

        if (TAC.SecurityTokens[tostring(source)] == nil) then
            TAC.SecurityTokens[tostring(source)] = {}
        end

        table.insert(TAC.SecurityTokens[tostring(source)], newResourceToken)

        TAC.SaveSecurityTokens()

        return newResourceToken
    end

    return nil
end

TAC.GetCurrentSecurityToken = function(source, resource)
    local currentToken = TAC.GetClientSecurityToken(source, resource)

    if (currentToken == nil) then
        local newToken = TAC.GenerateSecurityToken(source, resource)

        if (not newToken.shared) then
            TAC.TriggerClientEvent(source, 'tigoanticheat:storeSecurityToken', newToken)
        end

        if (newToken == nil) then
            TAC.KickPlayerWithReason(source, _U('kick_type_security_token'))
            return nil
        else
            return newToken
        end
    end

    return currentToken
end

TAC.ValidateToken = function(source, resource, token)
    local currentToken = TAC.GetCurrentSecurityToken(source, resource)

    if (currentToken == nil and token == nil) then
        return true
    elseif(currentToken ~= nil and not currentToken.shared and token == nil) then
        return true
    elseif(currentToken ~= nil and currentToken.token == token) then
        return true
    end

    return false
end

TAC.ValidateOrKick = function(source, resource, token)
    if (not TAC.ValidateToken(source, resource, token)) then
        TAC.KickPlayerWithReason(_U('kick_type_security_mismatch'))
        return false
    end

    return true
end

TAC.RegisterServerEvent('tigoanticheat:storeSecurityToken', function(source, resource)
    if (TAC.SecurityTokens ~= nil and TAC.SecurityTokens[tostring(source)] ~= nil) then
        local steamIdentifier = TAC.GetSteamIdentifier(source)

        for _, resourceToken in pairs(TAC.SecurityTokens[tostring(source)]) do
            if (resourceToken.name == resource and resourceToken.steam == steamIdentifier) then
                resourceToken.shared = true
                TAC.SecurityTokens[tostring(source)][_].shared = true
            elseif (resourceToken.name == resource) then
                table.remove(TAC.SecurityTokens[tostring(source)], _)
            end
        end

        TAC.SaveSecurityTokens()
    end
end)