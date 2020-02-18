TAC.LoadWhitelistedIPs = function()
    local ipsContent = LoadResourceFile(GetCurrentResourceName(), 'data/ignore-ips.json')

    if (not ipsContent) then
        local newIPList = json.encode({})

        ipsContent = newIPList

        SaveResourceFile(GetCurrentResourceName(), 'data/ignore-ips.json', newIPList, -1)
    end

    local whitelistedIPs = json.decode(ipsContent)

    if (not whitelistedIPs) then
        print('-------------------!' .. _('fatal_error') .. '!------------------\n')
        print(_('failed_to_load_ips') .. '\n')
        print(_('failed_to_load_check') .. '\n')
        print('-------------------!' .. _('fatal_error') .. '!------------------\n')

        TAC.WhitelistedIPs = {}
    else
        TAC.WhitelistedIPs = whitelistedIPs
    end

    TAC.WhitelistedIPsLoaded = true
end

TAC.AddIPToWhitelist = function(ip)
    if (not TAC.ValidIP(ip)) then
        return false
    end

    local ipAlreadyAdded = false

    for _, _ip in pairs(TAC.WhitelistedIPs) do
        if (_ip == ip) then
            ipAlreadyAdded = true
        end
    end

    if (ipAlreadyAdded) then
        return true
    end

    table.insert(TAC.WhitelistedIPs, ip)

    TAC.SaveWhitelistedIPs()

    return true
end

TAC.SaveWhitelistedIPs = function()
    SaveResourceFile(GetCurrentResourceName(), 'data/ignore-ips.json', json.encode(TAC.WhitelistedIPs or {}, { indent = true }), -1)
end

TAC.GetPlayerIP = function(playerId)
    local identifiers = GetPlayerIdentifiers(playerId)
    local ip = nil

    for _, identifier in pairs(identifiers) do
        if (string.match(string.lower(identifier), 'ip:')) then
            ip = string.sub(identifier, 4)
        end
    end

    return ip
end

TAC.ValidIP = function(ip)
    if ip == nil or type(ip) ~= "string" then
        return false
    end

    local chunks = {ip:match("(%d+)%.(%d+)%.(%d+)%.(%d+)")}

    if (#chunks == 4) then
        for _,v in pairs(chunks) do
            if (tonumber(v) < 0 or tonumber(v) > 255) then
                return false
            end
        end
        return true
    else
        return false
    end

    return false
end