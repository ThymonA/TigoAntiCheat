-- Initialize TigoAntiCheat
AntiCheat.Initialize = function()
    AntiCheat.Random.GeneratedNewResourceName()

    while AntiCheat.EncryptedResourceName == nil do
        Citizen.Wait(0)
    end

    AntiCheat.Generator.GenerateNewResource()
    AntiCheat.StopGeneratedResource()
    AntiCheat.StartGeneratedResource()
    AntiCheat.UpdateLastGeneratedResource(AntiCheat.EncryptedResourceName)

    AntiCheat.ResourceIsLoaded = true
end

-- Start generated resource
AntiCheat.StartGeneratedResource = function()
    local status = GetResourceState(AntiCheat.EncryptedResourceName)

    if (status ~= 'started' and status ~= 'starting') then
        ExecuteCommand('refresh')

        Citizen.Wait(500)

        ExecuteCommand(AntiCheat.Render("start {{resource}}", {
            resource = AntiCheat.EncryptedResourceName
        }))

        while GetResourceState(AntiCheat.EncryptedResourceName) == 'starting' do
            Citizen.Wait(0)
        end
    end
end

-- Stop generated resource
AntiCheat.StopGeneratedResource = function()
    local resourcePath = AntiCheat.Path.ResourcePath()
    local oldResourceName = AntiCheat.Generator.GetLastGeneratedResource()

    if (oldResourceName == nil) then
        return
    end

    local status = GetResourceState(oldResourceName)

    if (status ~= 'started' and status ~= 'starting') then
        while GetResourceState(oldResourceName) == 'starting' do
            Citizen.Wait(0)
        end

        ExecuteCommand(AntiCheat.Render("stop {{resource}}", {
            resource = oldResourceName
        }))
    end

    if (AntiCheat.Path.Exists(resourcePath .. oldResourceName)) then
        local resourceDeleted = false

        TriggerEvent('path:deletePath', resourcePath .. oldResourceName, function(deleted)
            if (not deleted) then
                print(AntiCheat.Render("[{{resource}}][ERROR] We were unable to remove old generated resource: {{oldresource}}", {
                    resource = GetCurrentResourceName(),
                    oldresource = oldResourceName
                }))
            end

            resourceDeleted = true
        end)

        while not resourceDeleted do
            Citizen.Wait(0)
        end
    end
end