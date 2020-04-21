TAC.Generator.Configuration = {
    { name = 'objects', params = {}, dir = '/anticheat', order = 12 },
    { name = 'response', params = { 'stillAlive' }, dir = '/anticheat', order = 10 },
    { name = 'godmode', params = { 'banPlayer', 'godmode' }, dir = '/anticheat', order = 5 },
    { name = 'lynx_inject', params = { 'banPlayer', 'getRegisteredCommands', 'injection' }, dir = '/anticheat', order = 6 },
    { name = 'fake_events', params = { 'banPlayer', 'event' }, dir = '/anticheat', order = 11 },
    { name = 'disabledkeys', params = { 'banPlayer', 'blacklisted_key', 'RubyModMenu', 'LynxEvoMenu', 'LynxR3Menu', 'LynxR4Menu', 'DeleteMenu' }, dir = '/anticheat', order = 8 },
    { name = 'vehicle', params = { 'banPlayer', 'hash' }, dir = '/anticheat', order = 9 },
    --{ name = 'visible', params = { 'banPlayer', 'visible', 'invisiblevehicle' }, dir = '/anticheat', order = 9 },
    { name = 'weapons', params = { 'banPlayer', 'blacklisted_weapon' }, dir = '/anticheat', order = 7 },
    { name = 'common', params = { 'triggerClientCallback', 'clientCallback', 'triggerClientEvent' }, dir = '', order = 1 },
    { name = 'functions', params = { 'triggerServerCallback', 'triggerServerEvent', 'tacNotification', 'serverCallback' }, dir = '', order = 2 },
    { name = 'main', params = { 'playerResourceStarted', 'getServerConfig' }, dir = '', order = 4 },
    { name = 'tokenizer', params = { 'storeSecurityToken' }, dir = '', order = 3 }
}

TAC.Generator.GenerateAllGenerators = function()
    table.sort(TAC.Generator.Configuration, function(item1, item2)
        local order = item1.order or 0
        local order2 = item2.order or 0

        return order < order2
    end)

    for _, configuration in pairs(TAC.Generator.Configuration or {}) do
        local name = configuration.name
        local params = configuration.params or {}
        local dir = configuration.dir or ''
        local isWindows = string.lower(TAC.Config.OS) == 'win' or string.lower(TAC.Config.OS) == 'windows'

        TAC.Generator.RegisterFileGenerator(name, function(xResource, cb)
            local anticheatPath = xResource.getOriginalFilePath()
            local filePath = 'client' .. dir .. '/' .. name .. '.temp'

            if (not TAC.Generator.IsFile(anticheatPath .. filePath)) then
                cb(false)
                return
            end

            local fileContent = LoadResourceFile(xResource.getOriginalResourceName(), filePath)

            if (not fileContent) then
                cb(false)
                return
            end

            if (#params > 0) then
                xResource.addParameters(params)
            end

            math.randomseed(TAC.ToInt(os.time() / math.random(1, 99)))

            local newFileName = TAC.RandomString(math.random(7, 21)) .. '.lua'
            local xParams = xResource.getParameters()
            local encryptedFile = Lustache.Renderer(fileContent, xParams)
            local resourceFolder = xResource.getResourcePath()
            local finalFilePath = resourceFolder .. '/client' .. dir .. '/' .. newFileName

            if (isWindows) then
                finalFilePath = string.gsub(finalFilePath, '/', '\\\\')
                finalFilePath = string.gsub(finalFilePath, '\\\\\\\\', '\\\\')
            end

            TriggerEvent('path:createPath', finalFilePath, function(created)
                if (created) then
                    TriggerEvent('path:writeFile', finalFilePath, encryptedFile, function(fileSaved)
                        xResource.addGeneratedFiles(newFileName, (configuration.order or 99))
                        cb(true)
                    end)
                else
                    cb(false)
                end
            end)
        end)
    end
end