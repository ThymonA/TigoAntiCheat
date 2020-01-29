Locales = {}

function _(str, ...)
    local config = Config or {}
    local locale = config.Locale or 'en'

	if Locales[locale] ~= nil then

		if Locales[locale][str] ~= nil then
			return string.format(Locales[locale][str], ...)
		else
			return 'Translation [' .. locale .. '][' .. str .. '] does not exist'
		end

	else
		return 'Locale [' .. locale .. '] does not exist'
	end

end

function _U(str, ...)
	return tostring(_(str, ...):gsub("^%l", string.upper))
end
