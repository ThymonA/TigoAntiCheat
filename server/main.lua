TAC.LoadBanList = function()
    local banlistContent = LoadResourceFile(GetCurrentResourceName(), 'data/banlist.json')

    if (not banlistContent) then
        local newBanlist = json.encode({})

        banlistContent = newBanlist

        SaveResourceFile(GetCurrentResourceName(), 'data/banlist.json', newBanlist, -1)
    end

    local banlist = json.decode(banlistContent)

    if (not banlist) then
        print('-------------------!' .. _('fatal_error') .. '!------------------\n')
        print(_('failed_to_load_banlist') .. '\n')
        print(_('failed_to_load_check') .. '\n')
        print('-------------------!' .. _('fatal_error') .. '!------------------\n')

        TAC.PlayerBans = {}
    else
        TAC.PlayerBans = banlist
    end

    TAC.BanListLoaded = true
end

TAC.LoadConfig = function()
    TAC.LoadVersion()

    TAC.Config = {
        UpdateIdentifiers   = TAC.GetConfigVariable('tigoanticheat.updateidentifiers', 'boolean'),
        GodMode             = TAC.GetConfigVariable('tigoanticheat.godmode', 'boolean'),
        Webhook             = TAC.GetConfigVariable('tigoanticheat.webhook', 'string'),
        BypassEnabled       = TAC.GetConfigVariable('tigoanticheat.bypassenabled', 'boolean'),
        VPNCheck            = TAC.GetConfigVariable('tigoanticheat.VPNCheck', 'boolean', true),
        VPNKey              = TAC.GetConfigVariable('tigoanticheat.VPNKey', 'string'),
        OS                  = TAC.GetConfigVariable('tigoanticheat.os', 'string', 'win')
    }

    TAC.ConfigLoaded = true
end

TAC.LoadVersion = function()
    local currentVersion = LoadResourceFile(GetCurrentResourceName(), 'version')

    if (not currentVersion) then
        TAC.Version = '0.0.0'
    else
        TAC.Version = currentVersion
    end
end

TAC.AddBlacklist = function(data)
    local banlistContent = LoadResourceFile(GetCurrentResourceName(), 'data/banlist.json')

    if (not banlistContent) then
        local newBanlist = json.encode({})

        banlistContent = newBanlist

        SaveResourceFile(GetCurrentResourceName(), 'data/banlist.json', newBanlist, -1)
    end

    local banlist = json.decode(banlistContent)

    if (not banlist) then
        print('-------------------!' .. _('fatal_error') .. '!------------------\n')
        print(_('failed_to_load_banlist') .. '\n')
        print(_('failed_to_load_check') .. '\n')
        print('-------------------!' .. _('fatal_error') .. '!------------------\n')
        return
    end

    if (data.identifiers ~= nil and #data.identifiers > 0) then
        table.insert(banlist, data)

        TAC.PlayerBans = banlist

        TAC.LogBanToDiscord(data)

        SaveResourceFile(GetCurrentResourceName(), 'data/banlist.json', json.encode(banlist, { indent = true }), -1)
    end
end

TAC.BanPlayerByEvent = function(playerId, event)
    if (playerId == nil) then
        return
    end
    
    playerId = tonumber(playerId)
    
    if (playerId > 0 and not TAC.IgnorePlayer(source)) then
        local bannedIdentifiers = GetPlayerIdentifiers(playerId)

        if (bannedIdentifiers == nil or #bannedIdentifiers <= 0) then
            DropPlayer(playerId, _('user_ban_reason', _('unknown')))
            return
        end

        local playerBan = {
            name = GetPlayerName(playerId) or _('unknown'),
            reason = _('banlist_ban_reason', event),
            identifiers = bannedIdentifiers
        }

        TAC.AddBlacklist(playerBan)

        DropPlayer(playerId, _('user_ban_reason', playerBan.name))
    end
end

TAC.BanPlayerWithNoReason = function(playerId)
    if (playerId == nil) then
        return
    end
    
    playerId = tonumber(playerId)
    
    if (playerId > 0 and not TAC.IgnorePlayer(source)) then
        local bannedIdentifiers = GetPlayerIdentifiers(playerId)

        if (bannedIdentifiers == nil or #bannedIdentifiers <= 0) then
            DropPlayer(playerId, _('user_ban_reason', _('unknown')))
            return
        end

        local playerBan = {
            name = GetPlayerName(playerId) or _('unknown'),
            reason = '',
            identifiers = bannedIdentifiers
        }

        TAC.AddBlacklist(playerBan)

        DropPlayer(playerId, _('user_ban_reason', playerBan.name))
    end
end

TAC.BanPlayerWithReason = function(playerId, reason)
    if (playerId == nil) then
        return
    end
    
    playerId = tonumber(playerId)
    
    if (playerId > 0 and not TAC.IgnorePlayer(source)) then
        local bannedIdentifiers = GetPlayerIdentifiers(playerId)

        if (bannedIdentifiers == nil or #bannedIdentifiers <= 0) then
            DropPlayer(playerId, _('user_ban_reason', _('unknown')))
            return
        end

        local playerBan = {
            name = GetPlayerName(playerId) or _('unknown'),
            reason = reason,
            identifiers = bannedIdentifiers
        }

        TAC.AddBlacklist(playerBan)

        DropPlayer(playerId, _('user_ban_reason', playerBan.name))
    end
end

TAC.KickPlayerWithReason = function(playerId, reason)
    if (playerId == nil) then
        return
    end
    
    playerId = tonumber(playerId)
    
    if (playerId > 0 and not TAC.IgnorePlayer(source)) then
        DropPlayer(playerId, _('user_kick_reason', reason))
    end
end

TAC.PlayerConnecting = function(playerId, setCallback, deferrals)
    local vpnChecked = false

    deferrals.defer()
    deferrals.update(_U('checking'))

    Citizen.Wait(100)

    if (not TAC.BanListLoaded) then
        deferrals.done(_('banlist_not_loaded_kick_player'))
        return
    end

    if (TAC.IgnorePlayer(playerId)) then
        deferrals.done()
        return
    end

    local identifiers = GetPlayerIdentifiers(playerId)

    if (identifiers == nil or #identifiers <= 0) then
        DropPlayer(playerId, _('user_ban_reason', _('unknown')))
        return
    end

    for __, playerBan in pairs(TAC.PlayerBans) do
        if (TAC.TableContainsItem(identifiers, playerBan.identifiers, true)) then
            if (TAC.Config.UpdateIdentifiers) then
                TAC.CheckForNewIdentifiers(playerId, identifiers, playerBan.name, playerBan.reason)
            end

            deferrals.done(_('user_ban_reason', playerBan.name))
            return
        end
    end

    if (TAC.Config.VPNCheck) then
        if (TAC.IgnorePlayer(playerId)) then
            return
        end

        local playerIP = TAC.GetPlayerIP(playerId)

        if (playerIP == nil) then
            deferrals.done(_('ip_blocked'))
            return
        end

        while (not TAC.ConfigLoaded) do
            Citizen.Wait(10)
        end

        local ipInfo = {}

        if (TAC.CheckedIPs ~= nil and TAC.CheckedIPs[playerIP] ~= nil) then
            ipInfo = TAC.CheckedIPs[playerIP] or {}

            local blockIP =  ipInfo.block or 0

            if (blockIP == 1) then
                local ignoreIP = false

                if (TAC.WhitelistedIPsLoaded) then
                    for _, ip in pairs(TAC.WhitelistedIPs) do
                        if (ip == playerIP) then
                            ignoreIP = true
                        end
                    end
                end

                if (not ignoreIP) then
                    deferrals.done(_('ip_blocked'))
                    return
                end
            end

            vpnChecked = true
        else
            PerformHttpRequest('http://v2.api.iphub.info/ip/' .. playerIP, function(statusCode, response, headers)
                if (statusCode == 200) then
                    local rawData = response or '{}'
                    ipInfo = json.decode(rawData)

                    TAC.CheckedIPs[playerIP] = ipInfo

                    local blockIP =  ipInfo.block or 0

                    if (blockIP == 1) then
                        local ignoreIP = false

                        if (TAC.WhitelistedIPsLoaded) then
                            for _, ip in pairs(TAC.WhitelistedIPs) do
                                if (ip == playerIP) then
                                    ignoreIP = true
                                end
                            end
                        end

                        if (not ignoreIP) then
                            deferrals.done(_('ip_blocked'))
                            return
                        end
                    end
                end

                vpnChecked = true
            end, 'GET', '', {
                ['X-Key'] = TAC.Config.VPNKey
            })
        end
    end

    while not vpnChecked do
        Citizen.Wait(10)
    end

    deferrals.done()
end

TAC.CheckForNewIdentifiers = function(playerId, identifiers, name, reason)
    local newIdentifiers = {}

    for _, identifier in pairs(identifiers) do
        local identifierFound = false

        for _, playerBan in pairs(TAC.PlayerBans) do
            if (TAC.TableContainsItem({ identifier }, playerBan.identifiers, true)) then
                identifierFound = true
            end
        end

        if (not identifierFound) then
            table.insert(newIdentifiers, identifier)
        end
    end

    if (#newIdentifiers > 0) then
        local playerBan = {
            name = GetPlayerName(playerId) or _('unknown'),
            reason = _('new_identifiers_found', reason, name),
            identifiers = newIdentifiers
        }

        TAC.AddBlacklist(playerBan)
    end
end

TAC.LogBanToDiscord = function (data)
    if (TAC.Config.Webhook == nil or
        TAC.Config.Webhook == '') then
        return
    end

    local identifierString = ''

    for _, identifier in pairs(data.identifiers or {}) do
        identifierString = identifierString .. identifier

        if (_ ~= #data.identifiers) then
            identifierString = identifierString .. '\n '
        end
    end

    local discordInfo = {
        ["color"] = "15158332",
        ["type"] = "rich",
        ["title"] = _('discord_title'),
        ["description"] = _('discord_description', data.name, data.reason, identifierString),
        ["footer"] = {
            ["text"] = 'TigoAntiCheat | ' .. TAC.Version
        }
    }

    PerformHttpRequest(TAC.Config.Webhook, function(err, text, headers) end, 'POST', json.encode({ username = 'TigoAntiCheat', embeds = { discordInfo } }), { ['Content-Type'] = 'application/json' })
end

Citizen.CreateThread(function()
    while not TAC.BanListLoaded do
        TAC.LoadBanList()

        Citizen.Wait(10)
    end

    while not TAC.ConfigLoaded do
        TAC.LoadConfig()

        Citizen.Wait(10)
    end

    while not TAC.WhitelistedIPsLoaded do
        TAC.LoadWhitelistedIPs()

        Citizen.Wait(10)
    end

    if (TAC.GeneratedResourceName == nil) then
        while not TAC.ConfigLoaded do
            TAC.LoadConfig()

            Citizen.Wait(10)
        end

        local lastResource = TAC.GetLastGeneratedName()
        local lastResourceDeleted = false

        if (lastResource ~= nil) then
            local status = GetResourceState(lastResource)

            if (status == 'started' or status == 'starting') then
                while GetResourceState(lastResource) == 'starting' do
                    Citizen.Wait(100)
                end

                ExecuteCommand(('stop %s'):format(lastResource))
            end

            local generatedResourcePath = TAC.Generator.GetResourcePath()
            local fullPath = generatedResourcePath .. lastResource .. '/'

            TriggerEvent('path:deletePath', fullPath, function(deleted)
                if (not deleted) then
                    print(('[%s][ERROR] We were unable to remove old generated resource: %s'):format(GetCurrentResourceName(), lastResource))
                end

                lastResourceDeleted = true
            end)
        else
            lastResourceDeleted = true
        end

        while not lastResourceDeleted do
            Citizen.Wait(0)
        end

        local newResource = TAC.GenerateNewResource()

        SaveResourceFile(GetCurrentResourceName(), 'data/resource.txt', newResource.getResourceName(), -1)

        if (TAC.Generator.CanStartResource) then
            Citizen.Wait(2500)

            local status = GetResourceState(TAC.GeneratedResourceName)

            if (status ~= 'started' and status ~= 'starting') then
                ExecuteCommand('refresh')

                Citizen.Wait(2500)

                ExecuteCommand(('start %s'):format(TAC.GeneratedResourceName))
            end

            local encryptedTigoAntiCheat = newResource.getResourceName()
            local encodedParams = newResource.getParameters()

            for newEventName, oldEventName in pairs(encodedParams or {}) do
                TAC.RegisterServerEvent(encryptedTigoAntiCheat .. ':' .. newEventName, function(source, ...)
                    TAC.TriggerServerEvent(encryptedTigoAntiCheat .. ':' .. oldEventName, source, ...)
                end)

                TAC.RegisterServerCallback(encryptedTigoAntiCheat .. ':' .. newEventName, function(source, cb, ...)
                    TAC.TriggerServerCallback(encryptedTigoAntiCheat .. ':' .. oldEventName, source, cb, ...)
                end)
            end

            local triggerServerCallback = TAC.GetParamFromObject('triggerServerCallback')
            local serverCallback = TAC.GetParamFromObject('serverCallback')
            local triggerServerEvent = TAC.GetParamFromObject('triggerServerEvent')
            local clientCallback = TAC.GetParamFromObject('clientCallback')

            RegisterServerEvent(encryptedTigoAntiCheat .. ':' .. triggerServerCallback)
            AddEventHandler(encryptedTigoAntiCheat .. ':' .. triggerServerCallback, function(name, requestId, token, ...)
                local _source = source

                if (TAC.ValidateOrKick(_source, GetCurrentResourceName(), token)) then
                    TAC.TriggerServerCallback(name, _source, function(...)
                        TriggerClientEvent(encryptedTigoAntiCheat .. ':' .. serverCallback, _source, requestId, ...)
                    end, ...)
                end
            end)

            RegisterServerEvent(encryptedTigoAntiCheat .. ':' .. triggerServerEvent)
            AddEventHandler(encryptedTigoAntiCheat .. ':' .. triggerServerEvent, function(name, token, ...)
                local _source = source

                if (TAC.ValidateOrKick(_source, GetCurrentResourceName(), token)) then
                    TAC.TriggerServerEvent(name, _source, ...)
                end
            end)

            RegisterServerEvent(encryptedTigoAntiCheat .. ':' .. clientCallback)
            AddEventHandler(encryptedTigoAntiCheat .. ':' .. clientCallback, function(requestId, ...)
                local _source = source
                local playerId = tonumber(_source)

                if (TAC.ClientCallbacks ~= nil and TAC.ClientCallbacks[playerId] ~= nil and TAC.ClientCallbacks[playerId][requestId] ~= nil) then
                    TAC.ClientCallbacks[playerId][tostring(requestId)](...)
                    TAC.ClientCallbacks[playerId][tostring(requestId)] = nil
                end
            end)
        end
    end
end)

TAC.RegisterServerCallback('tigoanticheat:getServerConfig', function(source, cb)
    while not TAC.ConfigLoaded do
        Citizen.Wait(10)
    end

    if ((TAC.Config.GodMode or false) and TAC.IgnorePlayer(source)) then
        TAC.Config.GodMode = false
    end

    TAC.Config.HasBypass = TAC.IgnorePlayer(source)

    cb(TAC.Config)
end)

TAC.RegisterServerEvent('tigoanticheat:banPlayer', function(source, type, item)
    local _type = type or 'default'
    local _item = item or 'none'

    _type = string.lower(_type)

    if (_type == 'default' or TAC.GetParamFromObject('default')) then
        TAC.BanPlayerWithNoReason(source)
    elseif (_type == 'godmode' or TAC.GetParamFromObject('godmode')) then
        TAC.BanPlayerWithReason(source, _U('ban_type_godmode'))
    elseif (_type == 'injection' or TAC.GetParamFromObject('injection')) then
        TAC.BanPlayerWithReason(source, _U('ban_type_injection'))
    elseif (_type == 'blacklisted_weapon' or TAC.GetParamFromObject('blacklisted_weapon')) then
        TAC.BanPlayerWithReason(source, _U('ban_type_blacklisted_weapon', _item))
    elseif (_type == 'blacklisted_key' or TAC.GetParamFromObject('blacklisted_key')) then
        TAC.BanPlayerWithReason(source, _U('ban_type_blacklisted_key', _item))
    elseif (_type == 'hash' or TAC.GetParamFromObject('hash')) then
        TAC.BanPlayerWithReason(source, _U('ban_type_hash'))
    elseif (_type == 'esx_shared' or TAC.GetParamFromObject('esx_shared')) then
        TAC.BanPlayerWithReason(source, _U('ban_type_esx_shared'))
    elseif (_type == 'superjump' or TAC.GetParamFromObject('superjump')) then
        TAC.BanPlayerWithReason(source, _U('ban_type_superjump'))
    elseif (_type == 'event' or TAC.GetParamFromObject('event')) then
        TAC.BanPlayerByEvent(source, _item)
    end
end)

TAC.RegisterServerEvent('tigoanticheat:playerResourceStarted', function(source)
    if (TAC.StartedPlayers ~= nil and TAC.StartedPlayers[tostring(source)] ~= nil and TAC.StartedPlayers[tostring(source)]) then
        TAC.BanPlayerWithReason(source, _U('lua_executor_found'))
    end

    if (TAC.StartedPlayers[tostring(source)] == nil) then
        TAC.StartedPlayers[tostring(source)] = {
            lastResponse = os.time(os.date("!*t")),
            numberOfTimesFailed = 0
        }
    end
end)

TAC.RegisterServerEvent('tigoanticheat:logToConsole', function(source, message)
    print(message)
end)