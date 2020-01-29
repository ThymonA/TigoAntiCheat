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

    table.insert(banlist, data)

    TAC.PlayerBans = banlist

    SaveResourceFile(GetCurrentResourceName(), 'data/banlist.json', json.encode(banlist, { indent = true }), -1)
end

TAC.BanPlayerByEvent = function(playerId, event)
    if (playerId ~= nil and playerId > 0) then
        local bannedIdentifiers = GetPlayerIdentifiers(playerId)
        local playerBan = {
            name = GetPlayerName(playerId) or _('unkown'),
            reason = _('banlist_ban_reason', event),
            identifiers = bannedIdentifiers
        }

        TAC.AddBlacklist(playerBan)

        DropPlayer(playerId, _('user_ban_reason', playerBan.name))
    end
end

TAC.PlayerConnecting = function(playerId, setKickReason)
    if (not TAC.BanListLoaded) then
        setKickReason(_('banlist_not_loaded_kick_player'))
        CancelEvent()
        return
    end

    local identifiers = GetPlayerIdentifiers(playerId)

    for __, playerBan in pairs(TAC.PlayerBans) do
        if (TAC.TableContainsItem(identifiers, playerBan.identifiers, true)) then
            TAC.CheckForNewIdentifiers(playerId, identifiers, playerBan.name, playerBan.reason)

            print(playerBan.name)

            setKickReason(_('user_ban_reason', playerBan.name))
            CancelEvent()
            return
        end
    end
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
            name = GetPlayerName(playerId) or _('unkown'),
            reason = _('new_identifiers_found', reason, name),
            identifiers = newIdentifiers
        }

        TAC.AddBlacklist(playerBan)
    end
end

Citizen.CreateThread(function()
    while not TAC.BanListLoaded do
        TAC.LoadBanList()

        Citizen.Wait(10)
    end
end)