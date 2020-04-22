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
    '@mustache/mustache.lua',

    'TigoAntiCheat.net.dll',

    'server/common.lua',

    'config.lua',

    'server/functions.lua',
    'server/main.lua'
}

server_exports {
	'getSharedObject'
}

dependencies {
    'mustache'
}
