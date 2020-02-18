TAC.Commands = {}

TAC.IsConsole = function(playerId)
    return (playerId == nil or playerId <= 0 or tostring(playerId) == '0')
end

RegisterCommand('anticheat', function(source, args, raw)
    if (not TAC.PlayerAllowed(source)) then
        TAC.Print(false, '%{reset}[%{red}' .. _('name') .. '%{reset}] %{white}' .. _('not_allowed', '%{red}/anticheat%{reset}'))
        return
    end

    local isConsole = TAC.IsConsole(source)

    if (args == nil or string.lower(type(args)) ~= 'table' or #args <= 0 or string.lower(tostring(args[1])) == 'help') then
        TAC.Commands['help'].func(isConsole, {})
        return
    end

    local command = string.lower(tostring(args[1]))

    for key, data in pairs(TAC.Commands) do
        if (string.lower(key) == command) then
            local param = args[2] or nil
            data.func(isConsole, param)
            return
        end
    end

    TAC.Print(isConsole, '%{reset}[%{red}' .. _('name') .. '%{reset}] %{white}' .. _('command') .. ' %{red}/anticheat ' .. command .. ' %{white}' .. _('command_not_found'))
end)

TAC.Commands['reload'] = {
    description = _('command_reload'),
    func = function(isConsole)
        TAC.LoadBanList()
        TAC.Print(isConsole, '%{reset}[%{red}' .. _('name') .. '%{reset}] %{white}' .. _('banlist_reloaded'))
    end
}

TAC.Commands['ip-reload'] = {
    description = _('ips_command_reload'),
    func = function(isConsole)
        TAC.LoadWhitelistedIPs()
        TAC.Print(isConsole, '%{reset}[%{red}' .. _('name') .. '%{reset}] %{white}' .. _('ips_reloaded'))
    end
}

TAC.Commands['ip-add'] = {
    description = _('ips_command_add'),
    func = function(isConsole, ip)
        if (TAC.AddIPToWhitelist(ip)) then
            TAC.Print(isConsole, '%{reset}[%{red}' .. _('name') .. '%{reset}] %{white}' .. _('ip_added', ip))
        else
            TAC.Print(isConsole, '%{reset}[%{red}' .. _('name') .. '%{reset}] %{white}' .. _('ip_invalid', ip))
        end
    end
}

TAC.Commands['total'] = {
    description = _('command_total'),
    func = function(isConsole)
        TAC.Print(isConsole, '%{reset}[%{red}' .. _('name') .. '%{reset}] %{white}' .. _('total_bans', #TAC.PlayerBans))
    end
}

TAC.Commands['help'] = {
    description = _('command_help'),
    func = function(isConsole)
        local string = '%{reset}[%{red}' .. _('name') .. '%{reset}] %{white}' .. _('available_commands') .. '\n %{black}--------------------------------------------------------------\n'

        for command, data in pairs(TAC.Commands) do
            string = string .. '%{red}/anticheat ' .. command .. ' %{black}| %{white}' .. data.description .. '\n'
        end

        string = string .. '%{black}--------------------------------------------------------------%{reset}'

        TAC.Print(isConsole, string)
    end
}

TAC.Print = function(isConsole, string)
    if (isConsole) then
        TAC.PrintToConsole(string)
    else
        TAC.PrintToUser(string)
    end
end

TAC.PlayerAllowed = function(playerId)
    local isConsole = TAC.IsConsole(playerId)

    if (isConsole) then
        return isConsole
    end

    if (IsPlayerAceAllowed(playerId, 'tigoanticheat.commands')) then
        return true
    end

    return false
end

TAC.IgnorePlayer = function(playerId)
    local isConsole = TAC.IsConsole(playerId)

    if (isConsole) then
        return isConsole
    end

    if (not TAC.Config.BypassEnabled) then
        return false
    end

    if (IsPlayerAceAllowed(playerId, 'tigoanticheat.bypass')) then
        return true
    end

    return false
end