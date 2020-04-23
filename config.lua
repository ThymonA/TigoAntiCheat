AntiCheat.Language                  = 'nl' -- language used in TigoAntiCheat
AntiCheat.UpdateIdentifiers         = true -- `true` When a banned players joined with new identifiers is also immediately banned as soon one identifier match banned identifiers
AntiCheat.BypassEnabled             = true -- `true` Players that has the permission `tigoanticheat.bypass` will never be banned by TigoAntiCheat
AntiCheat.DiscordWebhook            = 'https://discordapp.com/api/webhooks/672127596837994496/tkfKt64wgSN6jtVq-SqMtWXkSyVk3Qq2Zfv_-_NqGNl8m-L3NEzjBGJt802zzyAvvX0F' -- Webhook to report new bans to
AntiCheat.VPNCheckEnabled           = true -- `true` Determines if player's IP is possibly VPN and blocks access to your server.
AntiCheat.VPNAPIKey                 = 'ODU0NDpuU1lTREFiTzRQVWRLQkVzS0RUOUp1Mmlad29uNW1NZA==' -- https://iphub.info/apiKey/newFree Generate an API key to use VPN Check in TigoAntiCheat
AntiCheat.RunningOS                 = 'win' -- For OS specific operations, options: `win` for 'Windows' and `lux` for `Linux`
AntiCheat.BypassAce                 = 'tigoanticheat.bypass' -- The permission ace a player must have to be ignored (example: add_ace group.admin tigoanticheat.bypass allow)
AntiCheat.EnableCountryWhitelist    = false -- When `true` only IP's from countries described in CountryWhitelist can join
AntiCheat.CountryWhitelist          = { 'EN', 'NL' } -- Alpha-2 country codes -> https://www.iban.com/country-codes

AntiCheat.Generators = {
    { name = 'config',          params = { 'BlacklistedCommands', 'BlacklistedWeapons', 'BlacklistedVehicles', 'BlacklistedObjects' },                  dir = '',           order = 0,  enabled = true  },
    { name = 'common',          params = { 'triggerClientCallback', 'clientCallback', 'triggerClientEvent' },                                           dir = '',           order = 1,  enabled = true  },
    { name = 'functions',       params = { 'triggerServerCallback', 'triggerServerEvent', 'tacNotification', 'serverCallback' },                        dir = '',           order = 2,  enabled = true  },
    { name = 'tokenizer',       params = { 'storeSecurityToken' },                                                                                      dir = '',           order = 3,  enabled = true  },
    { name = 'main',            params = { 'playerResourceStarted', 'getServerConfig', 'BlacklistedWeapons', 'BlacklistedVehicles' },                   dir = '',           order = 4,  enabled = true  },
    { name = 'godmode',         params = { 'banPlayer', 'godmode' },                                                                                    dir = '/anticheat', order = 5,  enabled = true  },
    { name = 'lynx_inject',     params = { 'banPlayer', 'injection', 'BlacklistedCommands' },                                                           dir = '/anticheat', order = 6,  enabled = true  },
    { name = 'weapons',         params = { 'banPlayer', 'blacklisted_weapon', 'BlacklistedWeapons' },                                                   dir = '/anticheat', order = 7,  enabled = true  },
    { name = 'disabledkeys',    params = { 'banPlayer', 'blacklisted_key', 'RubyModMenu', 'LynxEvoMenu', 'LynxR3Menu', 'LynxR4Menu', 'DeleteMenu' },    dir = '/anticheat', order = 8,  enabled = true  },
    { name = 'vehicle',         params = { 'banPlayer', 'hash', 'BlacklistedVehicles' },                                                                dir = '/anticheat', order = 9,  enabled = true  },
    { name = 'visible',         params = { 'banPlayer', 'visible', 'invisiblevehicle' },                                                                dir = '/anticheat', order = 10, enabled = false },
    { name = 'response',        params = { 'stillAlive' },                                                                                              dir = '/anticheat', order = 11, enabled = true  },
    { name = 'fake_events',     params = { 'banPlayer', 'event' },                                                                                      dir = '/anticheat', order = 12, enabled = true  },
    { name = 'objects',         params = { 'BlacklistedObjects' },                                                                                      dir = '/anticheat', order = 13, enabled = true  },
}