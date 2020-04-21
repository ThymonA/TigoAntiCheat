TAC.Generator                   = {}
TAC.Generator.FileGenerators    = {}
TAC.Generator.EncryptedEvents   = {}
TAC.Generator.GeneratorsCreated = false
TAC.Generator.CanStartResource  = true

TAC.Generator.GetResourcePath = function()
    local resourceName = GetCurrentResourceName()
    local resourcePath = GetResourcePath(resourceName)

    return string.gsub(resourcePath, '/' .. resourceName, '') .. '/'
end

TAC.Generator.GetFullResourcePath = function()
    local resourceName = GetCurrentResourceName()
    local resourcePath = GetResourcePath(resourceName)

    return resourcePath .. '/'
end

TAC.Generator.RegisterFileGenerator = function(filename, cb)
    filename = string.lower(filename or 'none')

    if (filename == 'none') then
        return
    end

    TAC.Generator.FileGenerators[filename] = cb
end

TAC.Generator.TriggerResourceGenerator = function(xResource)
    if (xResource == nil or not xResource) then
        return
    end

    local tasks = {}

    for _, callback in pairs(TAC.Generator.FileGenerators or {}) do
        table.insert(tasks, function(cb)
            callback(xResource, cb)
        end)
    end

    local filesGenerated = false

    Async.parallel(tasks, function(results)
        TAC.Generator.CanStartResource = true
        filesGenerated = true

        for _, generated in pairs(results or {}) do
            if (not generated and generated == false) then
                filesGenerated = false
                TAC.Generator.CanStartResource = false
            end
        end

        if (not filesGenerated) then
            TriggerEvent('path:deletePath', xResource.getResourcePath(), function(deleted)
                filesGenerated = true
                TAC.Generator.CanStartResource = false
            end)
        end
    end)

    while not filesGenerated do
        Citizen.Wait(0)
    end

    local manifestGenereted = false

    TAC.GenerateManifest(xResource, function(generated)
        if (not generated and generated == false) then
            TAC.Generator.CanStartResource = false
        end

        TAC.GenerateConfig(xResource, function(generated)
            if (not generated and generated == false) then
                TAC.Generator.CanStartResource = false
            end

            manifestGenereted = true
        end)
    end)

    while not manifestGenereted do
        Citizen.Wait(0)
    end
end

TAC.Generator.Exists = function(name)
    if type(name) ~= "string" then
        return false
    end

    return os.rename(name,name) and true or false
end

TAC.Generator.IsFile = function(name)
    if type(name) ~= "string" then
        return false
    end

    if not TAC.Generator.Exists(name) then
        return false
    end

    local f = io.open(name)

    if f then
        f:close()
        return true
    end

    return false
end

TAC.Generator.IsDir = function(name)
    return (TAC.Generator.Exists(name) and not TAC.Generator.IsFile(name))
end