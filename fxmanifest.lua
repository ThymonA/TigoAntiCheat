fx_version 'adamant'

game 'gta5'

description 'This is an anti cheat made by Tigo for FiveM, this resource makes cheating on FiveM a lot harder.'
name 'TigoAntiCheat'
author 'TigoDevelopment'
contact 'me@tigodev.com'

version '0.0.1'

server_scripts {
    'shared/locale.lua',
    'locales/en.lua',
    'locales/nl.lua',
    'config.lua',
    'server/common.lua',
    'server/functions.lua',
    'shared/functions.lua',
    'shared/ansicolors.lua',
    'server/tokenizer/main.lua',
    'server/main.lua',
    'server/anticheat/esx_fake_events.lua',
    'server/anticheat/response.lua',
    'server/commands.lua'
}

client_scripts {
    'shared/locale.lua',
    'locales/en.lua',
    'locales/nl.lua',
    'config.lua',
    'client/common.lua',
    'client/functions.lua',
    'shared/functions.lua',
    'shared/ansicolors.lua',
    'client/tokenizer/main.lua',
    'client/main.lua',
    'client/anticheat/godmode.lua',
    'client/anticheat/lynx_inject.lua',
    'client/anticheat/weapons.lua',
    'client/anticheat/disabledkeys.lua',
    'client/anticheat/vehicle.lua',
    'client/anticheat/superjump.lua',
    'client/anticheat/response.lua',
}

exports {
	'getSharedObject'
}

server_exports {
	'getSharedObject'
}
