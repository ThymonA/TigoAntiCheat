function CreateResource(name, path, originalPath, originalResource)
    local self = {}

    self.registeredEvents = {}
    self.registeredFiles = {}

    self.toInt = function(input)
        return math.floor(input + 0.5)
    end

    self.generateRandomString = function(length)
        local result = ''

        for i = 1, length do
            if ((i == 1) or (math.random(0, 100) % 2 == 0)) then
                if (math.random(0, 100) % 2 == 0) then
                    result = result .. string.char(math.random(65, 90))
                else
                    result = result .. string.char(math.random(97, 122))
                end
            else
                result = result .. string.char(math.random(48, 57))
            end
        end

        return result
    end

    self.generateRandomEvent = function(event)
        local length = math.random(11, 41)
        local newEventName = self.generateRandomString(length)

        if (self.registeredEvents ~= nil and self.registeredEvents[newEventName] ~= nil) then
            return self.generateRandomEvent()
        end

        self.registeredEvents[newEventName] = event

        return newEventName
    end

    self.path = path or 'unknown'

    self.module = string.upper(self.generateRandomString(math.random(13, 31)))
    self.resource = name or 'unknown'
    self.events = { }

    self.originalPath = originalPath or 'unknown'
    self.originalResource = originalResource or 'unknown'

    self.addEventName = function(name, encrypt)
        name = name or 'none'

        if (self.events ~= nil and self.events[name] ~= nil) then
            return
        end

        self.events[name] = encrypt
    end

    self.addEventName('tigoanticheat', self.resource)

    self.getResourceName = function()
        return self.resource
    end

    self.getPath = function()
        return self.path
    end

    self.getResourcePath = function()
        return self.path .. self.getResourceName()
    end

    self.getOriginalResourceName = function()
        return self.originalResource
    end

    self.getOriginalFilePath = function()
        return self.originalPath
    end

    self.addParameter = function(name)
        name = name or 'none'

        if (self.events ~= nil and self.events[name] ~= nil) then
            return
        end

        local newEventName = self.generateRandomEvent(name)

        self.events[name] = newEventName
    end

    self.addParameters = function(params)
        params = params or {}

        if (type(params) ~= 'table') then
            self.addParameter(params)
        else
            for _, param in pairs(params) do
                self.addParameter(param)
            end
        end
    end

    self.getParameters = function()
        local params = {}

        params['resource'] = self.resource
        params['module'] = self.module

        for newEventName, oldEventName in pairs(self.registeredEvents or {}) do
            params[oldEventName] = newEventName
        end

        return params
    end

    self.addGeneratedFiles = function(filename, order)
        table.insert(self.registeredFiles, { name = filename, order = order })
    end

    self.getGeneratedFiles = function()
        return self.registeredFiles or {}
    end

    self.getParam = function(name)
        for newEventName, oldEventName in pairs(self.registeredEvents or {}) do
            if (name == oldEventName) then
                return newEventName
            end
        end

        return name
    end

    return self
end