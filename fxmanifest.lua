fx_version 'adamant'

game 'gta5'

description 'This is an anti cheat made by Tigo for FiveM, this resource makes cheating on FiveM a lot harder.'
name 'TigoAntiCheat'
author 'TigoDevelopment'
contact 'me@tigodev.com'

version '2.0.0'

server_only 'yes'

server_scripts {
    '@async/async.lua',
    'shared/locale.lua',
    'libs/TigoServerPath.net.dll',

    'locales/en.lua',
    'locales/nl.lua',
    'locales/pl.lua',
    'locales/dk.lua',

    'config.lua',

    'server/generator/classes/resource.lua',

    'server/common.lua',
    'server/functions.lua',

    'libs/lustache/lustache.lua',

    'shared/functions.lua',
    'shared/ansicolors.lua',

    'server/tokenizer/main.lua',

    'server/generator/functions.lua',
    'server/generator/generators.lua',
    'server/generator/main.lua',

    'server/vpn/check.lua',

    'server/main.lua',

    --'server/anticheat/fake_events.lua',
    'server/anticheat/response.lua',

    'server/commands.lua'
}

server_exports {
	'getSharedObject'
}
