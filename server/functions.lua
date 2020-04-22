AntiCheat.Function      = {}
AntiCheat.Random        = {}
AntiCheat.Generator     = {}
AntiCheat.Sort          = {}
AntiCheat.Check         = {}
AntiCheat.Path          = {}
AntiCheat.Cache         = {}

-----------------
-- FUNCTION
-----------------

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

    print(fullEncryptedResourcePath)

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
            scripts = '"' .. generatedFiles[i].name .. '",'
        else
            scripts = scripts .. '\n"' .. generatedFiles
            [i].name

            if (#scripts ~= i) then
                scripts = scripts .. '",'
            else
                scripts = scripts .. '"'
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
