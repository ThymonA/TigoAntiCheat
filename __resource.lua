resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

name 'TigoAntiCheat'
author 'TigoDevelopment'
contact 'me@tigodev.com'
version '0.0.1'

description 'This is an anti cheat made by Tigo for FiveM, this resource makes cheating on FiveM a lot harder.'

server_scripts {
    'shared/locale.lua',

    'locales/en.lua',
    'locales/nl.lua',

    'config.lua',

    'server/common.lua',
    'server/functions.lua',

    'shared/functions.lua',
    'shared/ansicolors.lua',

    'server/main.lua',

    'server/anticheat/esx_fake_events.lua',

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

    'client/main.lua',

    'client/anticheat/godmode.lua',
    'client/anticheat/lynx_inject.lua',
    'client/anticheat/weapons.lua',
    'client/anticheat/disabledkeys.lua',
    'client/anticheat/vehicle.lua',
    'client/anticheat/superjump.lua'
}

exports {
	'getSharedObject'
}

server_exports {
	'getSharedObject'
}