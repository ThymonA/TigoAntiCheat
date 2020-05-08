fx_version 'adamant'

game 'gta5'

description 'A resource that detects different types of cheating'
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
    'server/fake_events.lua',

    'locales/nl.lua',
    'locales/fi.lua',	
    'locales/en.lua',
    'locales/es.lua',

    'config.lua',

    'server/functions.lua',
    'server/main.lua'
}

server_exports {
	'getSharedObject'
}

dependencies {
    'async',
    'mustache'
}
