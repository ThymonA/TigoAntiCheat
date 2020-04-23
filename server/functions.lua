AntiCheat.Random        = {}
AntiCheat.Generator     = {}
AntiCheat.Sort          = {}
AntiCheat.Check         = {}
AntiCheat.Path          = {}
AntiCheat.Cache         = {}
AntiCheat.Ban           = {}
AntiCheat.Discord       = {}
AntiCheat.Locale        = {}
AntiCheat.Config        = {}
AntiCheat.Event         = {}
AntiCheat.VPN           = {}
AntiCheat.IP            = {}
AntiCheat.Player        = {}

-----------------
-- RANDOM
-----------------

-- Creates a new resource name
AntiCheat.Random.GeneratedNewResourceName = function()
    local prefix = { 'esx_policejob', 'esx_ambulancejob', 'esx_taxijob', 'esx_bankerjob', 'esx_vigneronjob', 'esx_fuelerjob', 'esx_mecanojob', 'esx_garbagejob', 'esx_lscustom', 'esx_jobs', 'esx_joblisting', 'esx_pizza', 'esx_blanchisseur', 'esx_pilot', 'esx_carthief', 'esx_godirtyjob', 'esx_ranger', 'esx_fueldelivery', 'esx_truckerjob', 'esx_gopostaljob', 'esx_banksecurity', 'delivery', 'taxi', 'dmv', 'whoapd', 'paramedic', 'ems', 'Banca', 'Sasaki_kurier', 'neweden_garage' }
    local suffix = { 'confiscatePlayerItem', 'handcuff', 'drag', 'putInVehicle', 'OutVehicle', 'getStockItem', 'putStockItems', 'spawned', 'forceBlip', 'giveWeapon', 'setVehicleState', 'message', 'buyMod', 'refreshOwnedVehicle', 'startHarvest', 'stopHarvest', 'startHarvest2', 'stopHarvest2', 'startHarvest3', 'stopHarvest3', 'startCraft', 'stopCraft', 'startCraft2', 'stopCraft2', 'startCraft3', 'stopCraft3', 'onNPCJobMissionCompleted', 'pay', 'setJob', 'setCautionInCaseOfDrop', 'giveBackCautionInCaseOfDrop', 'startWork', 'stopWork', 'caution', 'revive', 'heal', 'placeinback', 'removeItem', 'giveItem', 'firstSpawn', 'setDeathStatus', 'success', 'startWhitening', 'withdraw', 'billPlayer' }

    math.randomseed(os.clock()^5)
    local randomInt = math.random(1, #prefix)

    math.randomseed(os.clock()^7)
    local randomInt2 = math.random(1, #suffix)

    local prefixName = prefix[randomInt]
    local suffixName = suffix[randomInt2]

    local currentResourceName = GetCurrentResourceName()
    local newName = prefixName .. '_' .. suffixName

    AntiCheat.EncryptedResourceParams[newName] = currentResourceName
    AntiCheat.AlradyEncryptedParams[string.lower(currentResourceName)] = newName
    AntiCheat.AlradyEncryptedParams['resource'] = newName
    AntiCheat.EncryptedResourceName = newName
end

-----------------
-- GENERATOR
-----------------

-- Generate a new resource
AntiCheat.Generator.GenerateNewResource = function()
    AntiCheat.Generator.GenerateGeneratorsAll()

    while not AntiCheat.FileGeneratorsGenerated do
        Citizen.Wait(0)
    end

    local tasks = {}

    for _, callback in pairs(AntiCheat.FileGenerators or {}) do
        table.insert(tasks, function(cb)
            callback.callback(cb, callback.params)
        end)
    end

    local allFilesGenerated = false

    Async.series(tasks, function(results)
        AntiCheat.Generator.GenerateManifest(function()
            allFilesGenerated = true
        end)
    end)

    while not allFilesGenerated do
        Citizen.Wait(0)
    end
end

-- Generate all generators from `AntiCheat.Generators` in `Config.lua`
AntiCheat.Generator.GenerateGeneratorsAll = function()
    AntiCheat.FileGeneratorsGenerated = false

    if (AntiCheat.IsNullOrDefault(AntiCheat.Generators, 'table', true)) then
        print(AntiCheat.Render("[{{{resource}}}][ERROR] No generators registered, TigoAntiCheat can't started", {
            resource = GetCurrentResourceName()
        }))
        return
    end

    if (AntiCheat.AlradyEncryptedParams ~= nil and AntiCheat.AlradyEncryptedParams['module'] == nil) then
        local encryptedModuleName = string.upper(AntiCheat.GenerateRandomString(math.random(7,14)))

        AntiCheat.EncryptedResourceParams[encryptedModuleName] = 'module'
        AntiCheat.AlradyEncryptedParams['module'] = encryptedModuleName
    end

    if (AntiCheat.AlradyEncryptedParams ~= nil and AntiCheat.AlradyEncryptedParams['resource'] == nil) then
        AntiCheat.EncryptedResourceParams[AntiCheat.EncryptedResourceName] = 'resource'
        AntiCheat.AlradyEncryptedParams['resource'] = AntiCheat.EncryptedResourceName
    end

    table.sort(AntiCheat.Generators, AntiCheat.Sort.SortByOrder)

    for _, generator in pairs(AntiCheat.Generators) do
        local name = generator.name or nil
        local params = generator.params or {}
        local dir = generator.dir or ''
        local order = generator.order or 99
        local enabled = generator.enabled or false
        local operationSystem = AntiCheat.Path.GetOS()

        if (AntiCheat.IsNullOrDefault(name, 'string', true)) then
            print(AntiCheat.Render("[{{{resource}}}][ERROR] Try to regsiter a generator without name, please check your Config", {
                resource = GetCurrentResourceName()
            }))
        else
            if (AntiCheat.IsNullOrDefault(params, 'table', true)) then
                params = {}
            end

            if (AntiCheat.IsNullOrDefault(dir, 'string', true)) then
                dir = ''
            end

            if (AntiCheat.IsNullOrDefault(order, 'number', true)) then
                order = 99
            end

            if (AntiCheat.IsNullOrDefault(enabled, 'boolean', true)) then
                enabled = false
            end

            if (params ~= nil and #params > 0) then
                for _, param in pairs(params) do
                    local encryptedParam = AntiCheat.Generator.EncryptNewParam(param)

                    AntiCheat.EncryptedResourceParams[encryptedParam] = param
                    AntiCheat.AlradyEncryptedParams[param] = encryptedParam
                end
            end

            AntiCheat.Generator.RegisterFileGenerator(name, AntiCheat.Generator.TriggerGenerator, {
                name = name,
                params = params,
                dir = dir,
                order = order,
                enabled = enabled,
                operationSystem = operationSystem
            })
        end
    end

    AntiCheat.FileGeneratorsGenerated = true
end

-- Trigger generator event
AntiCheat.Generator.TriggerGenerator = function(cb, params)
    local resourcePath = AntiCheat.Path.ResourcePath() .. GetCurrentResourceName() .. '/'
    local generatorFilePath = AntiCheat.Render("resource{{{dir}}}/{{{name}}}.temp", params)

    if (not AntiCheat.Path.IsFile(resourcePath .. generatorFilePath)) then
        print(AntiCheat.Render("[{{{resource}}}][ERROR] File {{{name}}}.temp doesn't exits in @{{{resource}}}/{{{filepath}}}", {
            resource = GetCurrentResourceName(),
            name = params.name,
            filepath = resourcePath .. generatorFilePath
        }))
        cb(false)
        return
    end

    local fileContent = LoadResourceFile(GetCurrentResourceName(), generatorFilePath)

    if (not fileContent) then
        print(AntiCheat.Render("[{{{resource}}}][ERROR] File {{{name}}}.temp can't be read in @{{{resource}}}/{{{filepath}}}", {
            resource = GetCurrentResourceName(),
            name = params.name,
            filepath = resourcePath .. generatorFilePath
        }))
        cb(false)
        return
    end

    local encryptedFilename = AntiCheat.Generator.EncryptNewParam(params.name)
    local encryptedParams = AntiCheat.Generator.GetEncryptedParams()
    local encryptedFileContent = AntiCheat.Render(fileContent, encryptedParams)
    local encryptedResourcePath = AntiCheat.Path.GetNewResourcePath()
    local fullEncryptedResourcePath = AntiCheat.Render("{{{resourcepath}}}/client/{{{filename}}}.lua", {
        resourcepath = encryptedResourcePath,
        filename = encryptedFilename
    })

    fullEncryptedResourcePath = AntiCheat.Path.MakeValid(fullEncryptedResourcePath, params.operationSystem)

    TriggerEvent('path:createPath', fullEncryptedResourcePath, function(created)
        if (created) then
            TriggerEvent('path:writeFile', fullEncryptedResourcePath, encryptedFileContent, function(fileSaved)
                table.insert(AntiCheat.GeneratedFiles, { name = encryptedFilename, order = params.order })
                cb(true)
            end)
        else
            print(AntiCheat.Render("[{{{resource}}}][ERROR] File {{{name}}}.temp can't be saved in @{{{encryptedResourcePath}}}", {
                resource = GetCurrentResourceName(),
                name = params.name,
                encryptedResourcePath = encryptedResourcePath
            }))
            cb(false)
        end
    end)
end

-- Generate manifest.lua
AntiCheat.Generator.GenerateManifest = function(cb)
    local name = 'fxmanifest'
    local resourcePath = AntiCheat.Path.ResourcePath() .. GetCurrentResourceName() .. '/'
    local generatorFilePath = AntiCheat.Render("resource/{{{name}}}.temp", {
        name = name
    })

    if (not AntiCheat.Path.IsFile(resourcePath .. generatorFilePath)) then
        print(AntiCheat.Render("[{{{resource}}}][ERROR] File {{{name}}}.temp doesn't exits in @{{{resource}}}/{{{filepath}}}", {
            resource = GetCurrentResourceName(),
            name = name,
            filepath = resourcePath .. generatorFilePath
        }))
        cb(false)
        return
    end

    local fileContent = LoadResourceFile(GetCurrentResourceName(), generatorFilePath)

    if (not fileContent) then
        print(AntiCheat.Render("[{{{resource}}}][ERROR] File {{{name}}}.temp can't be read in @{{{resource}}}/{{{filepath}}}", {
            resource = GetCurrentResourceName(),
            name = name,
            filepath = resourcePath .. generatorFilePath
        }))
        cb(false)
        return
    end

    local generatedFiles = AntiCheat.GeneratedFiles or {}

    table.sort(generatedFiles, AntiCheat.Sort.SortByOrder)

    local scripts = nil

    for i = 1, #generatedFiles, 1 do
        if (scripts == nil) then
            scripts = '"client/' .. generatedFiles[i].name .. '.lua",'
        else
            scripts = scripts .. '\n"client/' .. generatedFiles[i].name

            if (#scripts ~= i) then
                scripts = scripts .. '.lua",'
            else
                scripts = scripts .. '.lua"'
            end
        end
    end

    local operationSystem = AntiCheat.Path.GetOS()
    local encryptedFilename = name
    local encryptedFileContent = AntiCheat.Render(fileContent, {
        scripts = scripts
    })
    local encryptedResourcePath = AntiCheat.Path.GetNewResourcePath()
    local fullEncryptedResourcePath = AntiCheat.Render("{{{resourcepath}}}/{{{filename}}}.lua", {
        resourcepath = encryptedResourcePath,
        filename = encryptedFilename
    })
    fullEncryptedResourcePath = AntiCheat.Path.MakeValid(fullEncryptedResourcePath, operationSystem)

    TriggerEvent('path:createPath', fullEncryptedResourcePath, function(created)
        if (created) then
            TriggerEvent('path:writeFile', fullEncryptedResourcePath, encryptedFileContent, function(fileSaved)
                cb(true)
            end)
        else
            print(AntiCheat.Render("[{{{resource}}}][ERROR] File {{{name}}}.temp can't be saved in @{{{encryptedResourcePath}}}", {
                resource = GetCurrentResourceName(),
                name = name,
                encryptedResourcePath = encryptedResourcePath
            }))
            cb(false)
        end
    end)
end

-- Register file generator
AntiCheat.Generator.RegisterFileGenerator = function(name, cb, params)
    if (AntiCheat.IsNullOrDefault(name, 'string', true)) then
        print(AntiCheat.Render("[{{{resource}}}][ERROR] Try to regsiter a generator without name", {
            resource = GetCurrentResourceName()
        }))
        return
    end

    name = string.lower(name)

    AntiCheat.FileGenerators[name] = {
        callback = cb,
        params = params
    }
end

-- Encrypt new param
AntiCheat.Generator.EncryptNewParam = function(param)
    return AntiCheat.GenerateEvent(param, true)
end

-- Get a list of encrypted params
AntiCheat.Generator.GetEncryptedParams = function()
    return AntiCheat.AlradyEncryptedParams or {}
end

-- Returns te latest saved generated resource name
AntiCheat.Generator.GetLastGeneratedResource = function()
    local cacheKey = 'oldResourceName'

    if (AntiCheat.Cache.Exists(cacheKey)) then
        return AntiCheat.Cache.Read(cacheKey)
    end

    local savedResourceName = LoadResourceFile(GetCurrentResourceName(), 'data/resource.txt')

    if (not savedResourceName) then
        return nil
    end

    AntiCheat.Cache.Write(cacheKey, savedResourceName)

    return savedResourceName
end

-- Update te latest saved generated resource name
AntiCheat.Generator.UpdateLastGeneratedResource = function(resource)
    local cacheKey = 'oldResourceName'

    AntiCheat.Cache.Write(cacheKey, resource)

    SaveResourceFile(GetCurrentResourceName(), 'data/resource.txt', resource, -1)
end

-----------------
-- SORT
-----------------

-- Sort table by order asc
AntiCheat.Sort.SortByOrder = function(generator1, generator2)
    local order = generator1.order or 0
    local order2 = generator2.order or 0

    return order < order2
end

-----------------
-- PATH
-----------------

-- Get current full resource path
AntiCheat.Path.ResourcePath = function()
    local cacheKey = 'resourcePath'

    if (AntiCheat.Cache.Exists(cacheKey)) then
        return AntiCheat.Cache.Read(cacheKey)
    end

    local resourceName = GetCurrentResourceName()
    local resourcePath = GetResourcePath(resourceName)
    local path = AntiCheat.Render('{{{path}}}/', {
        path = string.gsub(resourcePath, AntiCheat.Render('/{{{resource}}}', {
            resource = resourceName
        }), '')
    })

    AntiCheat.Cache.Write(cacheKey, path)

    return path
end

-- Returns new resource path
AntiCheat.Path.GetNewResourcePath = function()
    local cacheKey = 'newResourcePath'

    if (AntiCheat.Cache.Exists(cacheKey)) then
        return AntiCheat.Cache.Read(cacheKey)
    end

    while AntiCheat.EncryptedResourceName == nil do
        Citizen.Wait(0)
    end

    local currentResourcePath = AntiCheat.Path.ResourcePath()
    local newResourceName = AntiCheat.EncryptedResourceName

    AntiCheat.Cache.Write(cacheKey, (currentResourcePath .. newResourceName))

    return (currentResourcePath .. newResourceName)
end

-- Returns os from Config
AntiCheat.Path.GetOS = function()
    local cacheKey = 'operationSystem'

    if (AntiCheat.Cache.Exists(cacheKey)) then
        return AntiCheat.Cache.Read(cacheKey)
    end

    local operationSystem = AntiCheat.RunningOS or 'win'

    if (AntiCheat.IsNullOrDefault(operationSystem, 'string', true)) then
        operationSystem = 'win'
    end

    operationSystem = string.lower(operationSystem)

    if (operationSystem == 'lux') then
        operationSystem = 'lux'
    else
        operationSystem = 'win'
    end

    AntiCheat.Cache.Write(cacheKey, operationSystem)

    return operationSystem
end

-- Check if path exists
AntiCheat.Path.Exists = function(name)
    if type(name) ~= "string" then
        return false
    end

    return os.rename(name,name) and true or false
end

-- Check if file exists
AntiCheat.Path.IsFile = function(name)
    if type(name) ~= "string" then
        return false
    end

    if not AntiCheat.Path.Exists(name) then
        return false
    end

    local f = io.open(name)

    if f then
        f:close()
        return true
    end

    return false
end

-- Check if directory exists
AntiCheat.Path.IsDir = function(name)
    return (AntiCheat.Path.Exists(name) and not AntiCheat.Path.IsFile(name))
end

-- Make path valid
AntiCheat.Path.MakeValid = function(path, operationSystem)
    if (AntiCheat.IsNullOrDefault(operationSystem, 'string', true)) then
        operationSystem = 'win'
    end

    operationSystem = string.lower(operationSystem)

    if (operationSystem == 'win') then
        path = string.gsub(path, '/', '\\\\')
        path = string.gsub(path, '\\\\\\\\', '\\\\')
    end

    return path
end

-----------------
-- CACHE
-----------------

-- Read object from cache
AntiCheat.Cache.Read = function(key)
    if (AntiCheat.IsNullOrDefault(key, 'string', true)) then
        return nil
    end

    key = string.lower(key)

    if (AntiCheat.Caches ~= nil and AntiCheat.Caches[key] ~= nil) then
        return AntiCheat.Caches[key]
    end

    return nil
end

-- Write object to cache
AntiCheat.Cache.Write = function(key, value)
    if (AntiCheat.IsNullOrDefault(key, 'string', true) or AntiCheat.IsNullOrDefault(value)) then
        return
    end

    key = string.lower(key)

    if (AntiCheat.Caches ~= nil) then
        AntiCheat.Caches[key] = value
    end
end

-- Checks if cache exists
AntiCheat.Cache.Exists = function(key)
    if (AntiCheat.IsNullOrDefault(key, 'string', true)) then
        return false
    end

    key = string.lower(key)

    return (AntiCheat.Caches ~= nil and AntiCheat.Caches[key] ~= nil)
end

-----------------
-- BAN
-----------------

-- Load bans from data/banlist.json into AntiCheat.Bans
AntiCheat.Ban.LoadList = function()
    AntiCheat.BanlistIsLoaded = false
    local banlistContent = LoadResourceFile(GetCurrentResourceName(), 'data/banlist.json')

    if (not banlistContent) then
        banlistContent = '[]'

        SaveResourceFile(GetCurrentResourceName(), 'data/banlist.json', banlistContent, -1)
    end

    local banList = json.decode(banlistContent)

    if (not banList) then
        print(AntiCheat.Render("[{{{resource}}}][ERROR] Fail to load bans, invalid json: @{{{resource}}}/data/banlist.json", {
            resource = GetCurrentResourceName()
        }))

        AntiCheat.Bans = {}

        AntiCheat.BanlistIsLoaded = true
    else
        local bans = {}

        for _, ban in pairs(banList or {}) do
            table.insert(bans, {
                name = ban.name or 'Unknown',
                reason = AntiCheat.Locale.Translate('empty_reason'),
                identifiers = ban.identifiers or {},
                matchingIdentifiers = ban.matchingIdentifiers or {}
            })
        end

        AntiCheat.Bans = bans

        AntiCheat.BanlistIsLoaded = true
    end

    while not AntiCheat.BanlistIsLoaded do
        Citizen.Wait(0)
    end
end

-- Save bans in AntiCheat.Bans to data/banlist.json
AntiCheat.Ban.SaveList = function()
    while not AntiCheat.BanlistIsLoaded do
        Citizen.Wait(0)
    end

    SaveResourceFile(GetCurrentResourceName(), 'data/banlist.json', json.encode(AntiCheat.Bans, { indent = true }), -1)
end

-- Add a ban to AntiCheat.Bans
AntiCheat.Ban.AddBan = function(name, reason, identifiers, matchingIdentifiers)
    name = name or 'Unknown'
    reason = reason or AntiCheat.Locale.Translate('empty_reason')
    identifiers = identifiers or {}
    matchingIdentifiers = matchingIdentifiers or {}

    AntiCheat.Ban.LoadList()

    if (#identifiers > 0) then
        local newBan = {
            name = name,
            reason = reason,
            identifiers = identifiers,
            matchingIdentifiers = matchingIdentifiers
        }

        table.insert(AntiCheat.Bans, newBan)

        AntiCheat.Discord.LogBan(newBan)
        AntiCheat.Ban.SaveList()
    end
end

-----------------
-- Discord
-----------------

-- Log ban to discord
AntiCheat.Discord.LogBan = function(banInfo)
    if (AntiCheat.IsNullOrDefault(AntiCheat.DiscordWebhook, 'string', true)) then
        return
    end

    banInfo.name = banInfo.name or 'Unknown'
    banInfo.reason = banInfo.reason or AntiCheat.Locale.Translate('empty_reason')
    banInfo.identifiers = banInfo.identifiers or {}
    banInfo.matchingIdentifiers = banInfo.matchingIdentifiers or {}

    local color = 16750848
    local identifierString = nil
    local matchingIdentifierString = nil

    for i = 1, #banInfo.identifiers, 1 do
        if (identifierString == nil) then
            identifierString = banInfo.identifiers[i]
        else
            identifierString = AntiCheat.Render("{{{identifierString}}}\n{{{identifier}}}", {
                identifierString = identifierString,
                identifier = banInfo.identifiers[i]
            })
        end
    end

    for i = 1, #banInfo.matchingIdentifiers, 1 do
        if (matchingIdentifierString == nil) then
            matchingIdentifierString = banInfo.matchingIdentifiers[i]
        else
            matchingIdentifierString = AntiCheat.Render("{{{matchingIdentifierString}}}\n{{{identifier}}}", {
                matchingIdentifierString = matchingIdentifierString,
                identifier = banInfo.matchingIdentifiers[i]
            })
        end
    end

    if (identifierString == nil) then
        return
    end

    if (matchingIdentifierString == nil) then
        color = 15158332
        matchingIdentifierString = AntiCheat.Locale.Translate('none')
    end

    AntiCheat.Discord.SendMessage(
        AntiCheat.DiscordWebhook,
        AntiCheat.Locale.Translate('discord_title'),
        AntiCheat.Locale.Translate('discord_description', {
            name = banInfo.name,
            reason = banInfo.reason,
            identifiers = identifierString,
            matchingIdentifiers = matchingIdentifierString
        }),
        AntiCheat.Discord.GenerateFooter(),
        color)
end

-- Send discord message
AntiCheat.Discord.SendMessage = function(webhook, title, description, footer, color)
    local discordInfo = {
        ["color"] = tostring(color),
        ["type"] = "rich",
        ["title"] = title,
        ["description"] = description,
        ["footer"] = {
            ["text"] = footer
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = 'TigoAntiCheat', embeds = { discordInfo } }), { ['Content-Type'] = 'application/json' })
end

-- Generate discord footer with current time
AntiCheat.Discord.GenerateFooter = function(prefix)
    local date_table = os.date("*t")
    local hour, minute, second = date_table.hour, date_table.min, date_table.sec
    local year, month, day = date_table.year, date_table.month, date_table.day

    if (tonumber(month) < 10) then
        month = '0' .. tostring(month)
    end

    if (tonumber(day) < 10) then
        day = '0' .. tostring(day)
    end

    if (tonumber(hour) < 10) then
        hour = '0' .. tostring(hour)
    end

    if (tonumber(minute) < 10) then
        minute = '0' .. tostring(minute)
    end

    if (tonumber(second) < 10) then
        second = '0' .. tostring(second)
    end

    local timestring = ''

    if (string.lower(AntiCheat.Language or 'en') == 'nl') then
        timestring = string.format("%d-%d-%d %d:%d:%d", day, month, year, hour, minute, second)
    else
        timestring = string.format("%d-%d-%d %d:%d:%d", year, month, day, hour, minute, second)
    end

    prefix = prefix or nil

    if (prefix == nil) then
        return AntiCheat.Render("TigoAntiCheat | {{{version}}} @ {{{time}}}", {
            version = AntiCheat.Config.GetCurrentVersion(),
            time = timestring
        })
    else
        return AntiCheat.Render("{{{prefix}}} | {{{version}}} @ {{{time}}}", {
            prefix = prefix,
            version = AntiCheat.Config.GetCurrentVersion(),
            time = timestring
        })
    end
end

-----------------
-- Locale
-----------------

-- Translate key to language string
AntiCheat.Locale.Translate = function(key, params)
    local locale = string.lower(AntiCheat.Language or 'en')

    key = string.lower(key or '')
    params = params or {}

    if (AntiCheat.Locales ~= nil and AntiCheat.Locales[locale] ~= nil and AntiCheat.Locales[locale][key] ~= nil) then
        local str = AntiCheat.Locales[locale][key]

        return AntiCheat.Render(str, params)
    else
        return ''
    end
end

-----------------
-- CONFIG
-----------------

-- Returns current version of TigoAntiCheat
AntiCheat.Config.GetCurrentVersion = function()
    local cacheKey = 'version'

    if (AntiCheat.Cache.Exists(cacheKey)) then
        return AntiCheat.Cache.Read(cacheKey)
    end

    local resourceVersion = LoadResourceFile(GetCurrentResourceName(), 'version')

    if (not resourceVersion) then
        AntiCheat.Cache.Write(cacheKey, 'Unspecified')

        return 'Unspecified'
    end

    AntiCheat.Cache.Write(cacheKey, resourceVersion)

    return resourceVersion
end

-----------------
-- EVENT
-----------------

-- Trigger this event when a player is connecting
AntiCheat.Event.PlayerConnecting = function(playerId, setCallback, deferrals)
    playerId = playerId or nil

    deferrals.defer()
    deferrals.update(AntiCheat.Locale.Translate('checking'))

    if (playerId == nil) then
        deferrals.done(AntiCheat.Locale.Translate('unknown_error'))
        return
    end

    Citizen.Wait(100)

    if (not AntiCheat.ResourceIsLoaded) then
        deferrals.update(AntiCheat.Locale.Translate('resource_starting'))

        while not AntiCheat.ResourceIsLoaded do
            Citizen.Wait(0)
        end
    end

    if (AntiCheat.IsPlayerBypassed(playerId)) then
        deferrals.done()
        return
    end

    local identifiers = GetPlayerIdentifiers(playerId)

    if (identifiers == nil or #identifiers <= 0) then
        deferrals.done(AntiCheat.Locale.Translate('unknown_error'))
        return
    end

    local ip = AntiCheat.Player.GetIP(playerId)

    if (ip == nil) then
        deferrals.done(AntiCheat.Locale.Translate('unknown_error'))
        return
    end

    if (not AntiCheat.VPN.IsIPAllowedToJoin(ip)) then
        local countryWhitelistEnabled = AntiCheat.EnableCountryWhitelist or false

        if (countryWhitelistEnabled and not AntiCheat.VPN.IsIPFromAllowedCountry(ip)) then
            deferrals.done(AntiCheat.Locale.Translate('country_not_allowed', {
                country = AntiCheat.VPN.GetIPInfo(ip).countryName or 'Unknown'
            }))
            return
        else
            deferrals.done(AntiCheat.Locale.Translate('blocked_ip'))
            return
        end
    end

    local isPlayerBanned, accountName, reason = AntiCheat.Player.PlayerIsBanned(playerId)

    if (not isPlayerBanned) then
        deferrals.done()
        return
    end

    local updateNewIdentifiers = AntiCheat.UpdateIdentifiers or false

    if (updateNewIdentifiers) then
        local newIdentifiers, matchingIdentifiers = AntiCheat.Player.PlayerNewIdentifiers(playerId)

        if (#newIdentifiers > 0) then
            AntiCheat.Ban.AddBan(GetPlayerName(playerId), AntiCheat.Render("{{{reason}}} - {{{new}}}", {
                reason = reason,
                new = AntiCheat.Locale.Translate('new_identifiers')
            }), newIdentifiers, matchingIdentifiers)
        end
    end

    deferrals.done(AntiCheat.Locale.Translate('banned', {
        username = accountName
    }))
end

-- Ban player event
AntiCheat.Event.BanPlayer = function(source, type, item)
    local _type = type or 'default'
    local _item = item or 'none'

    _type = string.lower(_type)

    if (AntiCheat.TrimAndLower(tostring(_type)) == 'default' or AntiCheat.TrimAndLower(tostring(_type)) == AntiCheat.TrimAndLower(AntiCheat.GenerateEvent('default', true))) then
        AntiCheat.BanPlayerWithNoReason(source)
    elseif (AntiCheat.TrimAndLower(tostring(_type)) == 'godmode' or AntiCheat.TrimAndLower(tostring(_type)) == AntiCheat.TrimAndLower(AntiCheat.GenerateEvent('godmode', true))) then
        AntiCheat.BanPlayerWithReason(source, AntiCheat.Locale.Translate('ban_type_godmode'))
    elseif (AntiCheat.TrimAndLower(tostring(_type)) == 'injection'  or AntiCheat.TrimAndLower(tostring(_type)) == AntiCheat.TrimAndLower(AntiCheat.GenerateEvent('injection', true))) then
        AntiCheat.BanPlayerWithReason(source, AntiCheat.Locale.Translate('ban_type_injection'))
    elseif (AntiCheat.TrimAndLower(tostring(_type)) == 'blacklisted_weapon' or AntiCheat.TrimAndLower(tostring(_type)) == AntiCheat.TrimAndLower(AntiCheat.GenerateEvent('blacklisted_weapon', true))) then
        AntiCheat.BanPlayerWithReason(source, AntiCheat.Locale.Translate('ban_type_blacklisted_weapon', { item = _item }))
    elseif (AntiCheat.TrimAndLower(tostring(_type)) == 'blacklisted_key' or AntiCheat.TrimAndLower(tostring(_type)) == AntiCheat.TrimAndLower(AntiCheat.GenerateEvent('blacklisted_key', true))) then
        AntiCheat.BanPlayerWithReason(source, AntiCheat.Locale.Translate('ban_type_blacklisted_key', { item = _item }))
    elseif (AntiCheat.TrimAndLower(tostring(_type)) == 'hash' or AntiCheat.TrimAndLower(tostring(_type)) == AntiCheat.TrimAndLower(AntiCheat.GenerateEvent('hash', true))) then
        AntiCheat.BanPlayerWithReason(source, AntiCheat.Locale.Translate('ban_type_hash'))
    elseif (AntiCheat.TrimAndLower(tostring(_type)) == 'esx_shared' or AntiCheat.TrimAndLower(tostring(_type)) == AntiCheat.TrimAndLower(AntiCheat.GenerateEvent('esx_shared', true))) then
        AntiCheat.BanPlayerWithReason(source, AntiCheat.Locale.Translate('ban_type_esx_shared'))
    elseif (AntiCheat.TrimAndLower(tostring(_type)) == 'superjump' or AntiCheat.TrimAndLower(tostring(_type)) == AntiCheat.TrimAndLower(AntiCheat.GenerateEvent('superjump', true))) then
        AntiCheat.BanPlayerWithReason(source, AntiCheat.Locale.Translate('ban_type_superjump'))
    elseif (AntiCheat.TrimAndLower(tostring(_type)) == 'event' or AntiCheat.TrimAndLower(tostring(_type)) == AntiCheat.TrimAndLower(AntiCheat.GenerateEvent('event', true))) then
        AntiCheat.BanPlayerByEvent(source, _item)
    else
        AntiCheat.BanPlayerWithNoReason(source)
    end
end

-----------------
-- VPN
-----------------

-- Get ip info from iphub.info
AntiCheat.VPN.GetIPInfo = function(ip)
    ip = ip or nil

    if (ip == nil) then
        return nil
    end

    local apiKey = AntiCheat.VPNAPIKey or nil

    if (apiKey == nil) then
        print(AntiCheat.Render("[{{{resource}}}][ERROR] API Key has not been set in: @{{{resource}}}/config.lua (AntiCheat.VPNAPIKey)", {
            resource = GetCurrentResourceName()
        }))

        return nil
    end

    local cacheKey = AntiCheat.Render("{{{ip}}}_vpn", {
        ip = ip
    })

    if (AntiCheat.Cache.Exists(cacheKey)) then
        return AntiCheat.Cache.Read(cacheKey)
    end

    local ipInfo = nil
    local apiResponded = false

    PerformHttpRequest('https://v2.api.iphub.info/ip/' .. ip, function(statusCode, response, headers)
        if (statusCode == 200) then
            local rawData = response or '{}'

            local jsonData = json.decode(rawData)

            if (not (not rawData)) then
                ipInfo = {
                    ip = jsonData.ip or ip,
                    countryCode = jsonData.countryCode or 'UNKNOWN',
                    countryName = jsonData.countryName or 'Unknown',
                    asn = jsonData.asn or 0,
                    isp = jsonData.isp or 'UNKNOWN',
                    block = jsonData.block or 0,
                    hostname = jsonData.hostname or 'unknown'
                }

                if (ipInfo.block == 1 and AntiCheat.IP.IsIPWhitelisted(ipInfo.ip)) then
                    ipInfo.block = 0
                end
            end
        end

        apiResponded = true
    end, 'GET', '', {
        ['X-Key'] = apiKey
    })

    while not apiResponded do
        Citizen.Wait(0)
    end

    if (ipInfo ~= nil) then
        AntiCheat.Cache.Write(cacheKey, ipInfo)
    end

    return ipInfo
end

-- Check if IP is from whitelisted country
AntiCheat.VPN.IsIPFromAllowedCountry = function(ip)
    local countryWhitelistEnabled = AntiCheat.EnableCountryWhitelist or false

    ip = ip or nil

    if (ip == nil) then
        return false
    end

    if (countryWhitelistEnabled) then
        local ipInfo = AntiCheat.VPN.GetIPInfo(ip)

        if (ipInfo == nil) then
            return false
        end

        for _, country in pairs(AntiCheat.CountryWhitelist or {}) do
            if (string.lower(country) == string.lower(ipInfo.countryCode) or string.lower(ipInfo.countryCode) == 'zz') then
                return true
            end
        end

        return false
    end

    return true
end

-- Check if IP is allowed to join
AntiCheat.VPN.IsIPAllowedToJoin = function(ip)
    local allowedToJoin = true
    local VPNCheckEnabled = AntiCheat.VPNCheckEnabled or false

    ip = ip or nil

    if (ip == nil) then
        return false
    end

    if (VPNCheckEnabled) then
        local ipInfo = AntiCheat.VPN.GetIPInfo(ip)

        if (ipInfo == nil) then
            allowedToJoin = false
        else
            allowedToJoin = ipInfo.block ~= 1
        end
    end

    if (not allowedToJoin) then
        return false
    end

    allowedToJoin = AntiCheat.VPN.IsIPFromAllowedCountry(ip)

    return allowedToJoin
end

-----------------
-- IP
-----------------

-- Check if given IP is whitelisted
AntiCheat.IP.IsIPWhitelisted = function(ip)
    ip = ip or nil

    if (ip == nil) then
        return false
    end

    for _, whitelistedIP in pairs(AntiCheat.IPWhitelist or {}) do
        if (whitelistedIP == ip) then
            return true
        end
    end

    return false
end

-- Load whitelisted IP's
AntiCheat.IP.LoadList = function()
    AntiCheat.WhitelistedIPsLoaded = false

    local ipListContent = LoadResourceFile(GetCurrentResourceName(), 'data/ignore-ips.json')

    if (not ipListContent) then
        ipListContent = '[]'

        SaveResourceFile(GetCurrentResourceName(), 'data/ignore-ips.json', ipListContent, -1)
    end

    local ipList = json.decode(ipListContent)

    if (not ipList) then
        print(AntiCheat.Render("[{{{resource}}}][ERROR] Fail to load ignore-ips, invalid json: @{{{resource}}}/data/ignore-ips.json", {
            resource = GetCurrentResourceName()
        }))

        AntiCheat.IPWhitelist = {}

        AntiCheat.WhitelistedIPsLoaded = true
    else
        for _, ip in pairs(ipList or {}) do
            table.insert(AntiCheat.IPWhitelist, ip)
        end

        AntiCheat.WhitelistedIPsLoaded = true
    end

    while not AntiCheat.WhitelistedIPsLoaded do
        Citizen.Wait(0)
    end
end

-----------------
-- PLAYER
-----------------

-- Get player's IP
AntiCheat.Player.GetIP = function(playerId)
    playerId = playerId or nil

    if (playerId == nil) then
        return nil
    end

    local identifiers = GetPlayerIdentifiers(playerId)

    if (identifiers == nil or #identifiers <= 0) then
        return nil
    end

    for _, identifier in pairs(identifiers) do
        if (string.match(string.lower(identifier), 'ip:')) then
            return string.sub(identifier, 4)
        end
    end

    return nil
end

-- Check if player has banned identifier
AntiCheat.Player.PlayerIsBanned = function(playerId)
    local playerIdentifiers = AntiCheat.Player.GetPlayerIdentifiers(playerId)

    if (#playerIdentifiers <= 0) then
        return false, 'Unknown', AntiCheat.Locale.Translate('empty_reason')
    end

    for _, ban in pairs(AntiCheat.Bans or {}) do
        if (ban.identifiers ~= nil and #ban.identifiers > 0) then
            if (AntiCheat.TableContainsAnyItem(playerIdentifiers, ban.identifiers, true)) then
                return true, (ban.name or 'Unknown'), (ban.reason or AntiCheat.Locale.Translate('empty_reason'))
            end
        end
    end

    return false, 'Unknown', AntiCheat.Locale.Translate('empty_reason')
end

-- Ban player from server
AntiCheat.Player.BanPlayer = function(playerId, reason)
    local playerIdentifiers = AntiCheat.Player.GetPlayerIdentifiers(playerId)

    if (#playerIdentifiers <= 0 or AntiCheat.IsPlayerBypassed(playerId)) then
        return
    end

    local playerName = GetPlayerName(playerId) or 'Unknown'

    AntiCheat.Ban.AddBan(playerName, reason, playerIdentifiers, {})

    DropPlayer(playerId, AntiCheat.Locale.Translate('banned', {
        username = playerName
    }))
end

-- Player new identifiers
AntiCheat.Player.PlayerNewIdentifiers = function(playerId)
    local playerIdentifiers = AntiCheat.Player.GetPlayerIdentifiers(playerId)

    if (#playerIdentifiers <= 0) then
        return {}, {}
    end

    local matchedIdentifiers = {}
    local newIdentifiers = {}

    for _, ban in pairs(AntiCheat.Bans or {}) do
        if (ban.identifiers ~= nil and #ban.identifiers > 0) then
            for _, playerIdentifier in pairs(playerIdentifiers or {}) do
                if (AntiCheat.TableContainsItem(playerIdentifier, ban.identifiers, true) and
                    not AntiCheat.TableContainsItem(playerIdentifier, matchedIdentifiers, true)) then
                    table.insert(matchedIdentifiers, playerIdentifier)
                elseif(not AntiCheat.TableContainsItem(playerIdentifier, newIdentifiers, true)) then
                    table.insert(newIdentifiers, playerIdentifier)
                end
            end
        end
    end

    return newIdentifiers, matchedIdentifiers
end

-- Get all player identifiers whit whitelist filter
AntiCheat.Player.GetPlayerIdentifiers = function(playerId)
    playerId = playerId or nil

    if (playerId == nil) then
        return {}
    end

    local identifiers, steamIdentifier = GetPlayerIdentifiers(playerId)

    if (identifiers == nil or #identifiers <= 0) then
        return {}
    end

    local license = nil
    local xbl = nil
    local live = nil
    local discord = nil
    local fivem = nil
    local ip = nil

    for _, identifier in pairs(identifiers) do
        if (string.match(string.lower(identifier), 'steam:')) then
            steamIdentifier = identifier
        elseif (string.match(string.lower(identifier), 'license:')) then
            license = string.sub(identifier, 9)
        elseif (string.match(string.lower(identifier), 'xbl:')) then
            xbl = string.sub(identifier, 5)
        elseif (string.match(string.lower(identifier), 'live:')) then
            live = string.sub(identifier, 6)
        elseif (string.match(string.lower(identifier), 'discord:')) then
            discord = string.sub(identifier, 9)
        elseif (string.match(string.lower(identifier), 'fivem:')) then
            fivem = string.sub(identifier, 7)
        elseif (string.match(string.lower(identifier), 'ip:')) then
            ip = string.sub(identifier, 4)
        end
    end

    local ipIsWhitelisted = AntiCheat.IP.IsIPWhitelisted(ip)
    local playerIdentifiers = {}

    if (steamIdentifier ~= nil) then
        table.insert(playerIdentifiers, steamIdentifier)
    end

    if (license ~= nil) then
        table.insert(playerIdentifiers, AntiCheat.Render("license:{{{license}}}", {
            license = license
        }))
    end

    if (xbl ~= nil) then
        table.insert(playerIdentifiers, AntiCheat.Render("xbl:{{{xbl}}}", {
            xbl = xbl
        }))
    end

    if (live ~= nil) then
        table.insert(playerIdentifiers, AntiCheat.Render("live:{{{live}}}", {
            live = live
        }))
    end

    if (discord ~= nil) then
        table.insert(playerIdentifiers, AntiCheat.Render("discord:{{{discord}}}", {
            discord = discord
        }))
    end

    if (fivem ~= nil) then
        table.insert(playerIdentifiers, AntiCheat.Render("fivem:{{{fivem}}}", {
            fivem = fivem
        }))
    end

    if (ip ~= nil and not ipIsWhitelisted) then
        table.insert(playerIdentifiers, AntiCheat.Render("ip:{{{ip}}}", {
            ip = ip
        }))
    end

    if (playerIdentifiers == nil or #playerIdentifiers <= 0) then
        return {}
    end

    return playerIdentifiers
end