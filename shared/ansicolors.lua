local keys = {
    reset     = '^7',
    black     = '^8',
    red       = '^1',
    green     = '^2',
    yellow    = '^3',
    blue      = '^4',
    cyan      = '^5',
    pink      = '^6',
    white     = '^7',
}

function IsWindows()
    return type(package) == 'table' and type(package.config) == 'string' and package.config:sub(1,1) == '\\'
end

local supported = not IsWindows()

if IsWindows() then
    supported = os.getenv("ANSICON")
end

local escapeString = string.char(27) .. '[%dm'

function EscapeNumber(number)
    return escapeString:format(number)
end

function EscapeKeys(str)
    if not supported then
        return ""
    end

    local buffer = {}
    local number

    for word in str:gmatch("%w+") do
        number = keys[word]
        assert(number, "Unknown key: " .. word)
        table.insert(buffer, number )
    end

    return table.concat(buffer)
end

function ReplaceCodes(str)
    str = string.gsub(str,"(%%{(.-)})", function(_, str) return EscapeKeys(str) end )

    return str
end

function Ansicolors( str )
    str = tostring(str or '')

    return ReplaceCodes('%{reset}' .. str .. '%{reset}')
end

function AnsiConsole( str )
    str = tostring(str or '')
    str = string.gsub(str,"(%%{(.-)})", '')

    return str
end