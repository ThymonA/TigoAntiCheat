TAC.GetLastGeneratedName = function()
    local lastName = LoadResourceFile(GetCurrentResourceName(), 'data/resource.txt')

    if (not lastName) then
        return nil
    else
        return lastName
    end
end

TAC.GenerateNewResource = function()
    if (not TAC.Generator.GeneratorsCreated) then
        TAC.Generator.GenerateAllGenerators()

        TAC.Generator.GeneratorsCreated = true
    end

    while not TAC.Generator.GeneratorsCreated do
        Citizen.Wait(0)
    end

    local path = TAC.Generator.GetResourcePath()
    local currentPath = TAC.Generator.GetFullResourcePath()
    local currentResourceName = GetCurrentResourceName()
    local newResourceName = TAC.RandomString(math.random(8, 24))

    local resoruce = CreateResource(newResourceName, path, currentPath, currentResourceName)

    TAC.Generator.TriggerResourceGenerator(resoruce)

    TAC.GeneratedResourceObject = resoruce
    TAC.GeneratedResourceName = resoruce.getResourceName()

    return resoruce
end

TAC.GenerateManifest = function(xResource, cb)
    local anticheatPath = xResource.getOriginalFilePath()
    local filePath = 'client/__resource.temp'
    local isWindows = string.lower(TAC.Config.OS) == 'win' or string.lower(TAC.Config.OS) == 'windows'

    if (not TAC.Generator.IsFile(anticheatPath .. filePath)) then
        cb(false)
        return
    end

    local fileContent = LoadResourceFile(xResource.getOriginalResourceName(), filePath)

    if (not fileContent) then
        cb(false)
        return
    end

    local scripts = xResource.getGeneratedFiles()

    table.insert(scripts, { name = 'config.lua', order = 0 })

    table.sort(scripts, function(script1, script2)
        local order = script1.order or 0
        local order2 = script2.order or 0

        return order < order2
    end)

    local rawScripts = nil

    for i = 1, #scripts, 1 do
        if (rawScripts == nil) then
            rawScripts = '"' .. scripts[i].name .. '",'
        else
            rawScripts = rawScripts .. '\n"' .. scripts[i].name

            if (#scripts ~= i) then
                rawScripts = rawScripts .. '",'
            else
                rawScripts = rawScripts .. '"'
            end
        end
    end

    local encryptedFile = Lustache.Renderer(fileContent, {
        scripts = rawScripts
    })
    local resourceFolder = xResource.getResourcePath()
    local finalFilePath = resourceFolder .. '/__resource.lua'

    if (isWindows) then
        finalFilePath = string.gsub(finalFilePath, '/', '\\\\')
        finalFilePath = string.gsub(finalFilePath, '\\\\\\\\', '\\\\')
    end

    TriggerEvent('path:createPath', finalFilePath, function(created)
        if (created) then
            TriggerEvent('path:writeFile', finalFilePath, encryptedFile, function(fileSaved)
                cb(true)
            end)
        else
            cb(false)
        end
    end)
end

TAC.GenerateConfig = function(xResource, cb)
    local anticheatPath = xResource.getOriginalFilePath()
    local filePath = 'config.lua'
    local isWindows = string.lower(TAC.Config.OS) == 'win' or string.lower(TAC.Config.OS) == 'windows'

    if (not TAC.Generator.IsFile(anticheatPath .. filePath)) then
        cb(false)
        return
    end

    local fileContent = LoadResourceFile(xResource.getOriginalResourceName(), filePath)

    if (not fileContent) then
        cb(false)
        return
    end

    local encryptedFile = Lustache.Renderer(fileContent, {})
    local resourceFolder = xResource.getResourcePath()
    local finalFilePath = resourceFolder .. '/config.lua'

    if (isWindows) then
        finalFilePath = string.gsub(finalFilePath, '/', '\\\\')
        finalFilePath = string.gsub(finalFilePath, '\\\\\\\\', '\\\\')
    end

    TriggerEvent('path:createPath', finalFilePath, function(created)
        if (created) then
            TriggerEvent('path:writeFile', finalFilePath, encryptedFile, function(fileSaved)
                xResource.addGeneratedFiles('config.lua', 0)
                cb(true)
            end)
        else
            cb(false)
        end
    end)
end