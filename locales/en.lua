Locales['en'] = {
    -- Name
    ['name'] = 'TigoAntiCheat',

    -- General
    ['unknown'] = 'unknown',
    ['fatal_error'] = 'FATAL ERROR',

    -- Resource strings
    ['callback_not_found'] = '[%s] has not been found',
    ['trigger_not_found'] = '[%s] has not been found',

    -- Ban strings
    ['checking'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | You are currently being checked...',
    ['user_ban_reason'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | You have been banned from this server ( 𝗨𝘀𝗲𝗿𝗻𝗮𝗺𝗲: %s )',
    ['user_kick_reason'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | You have been kicked ( 𝗥𝗲𝗮𝘀𝗼𝗻: %s )',
    ['banlist_ban_reason'] = 'Player has tried to trigger \'%s\' event',
    ['banlist_not_loaded_kick_player'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Our bans hasn\'t loaded, you\'ll have to wait a couple of seconds. Try again later!',
    ['ip_not_found'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | We couldn\'t find your IP',
    ['ip_blocked'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | You have a VPN active, disable it to join the server | Wrong? Contact the server owners',
    ['new_identifiers_found'] = '%s, new identifier(s) found - original ban %s',
    ['failed_to_load_banlist'] = '[TigoAntiCheat] Failed to load Banlist!',
    ['failed_to_load_tokenlist'] = '[TigoAntiCheat] Failed to load Tokenlist!',
    ['failed_to_load_ips'] = '[TigoAntiCheat] Failed to load IPs!',
    ['failed_to_load_check'] = '[TigoAntiCheat] Please check this error soon, Bans *will not* work!',
    ['ban_type_godmode'] = 'Godmode detected on player',
    ['lua_executor_found'] = 'Lua executor found on player',
    ['ban_type_injection'] = 'Player has injected some commands (Injection)',
    ['ban_type_blacklisted_weapon'] = 'Player had a blacklisted weapon: %s',
    ['ban_type_blacklisted_key'] = 'Player had pressed a blacklisted key for %s',
    ['ban_type_hash'] = 'Player had modify a hash',
    ['ban_type_esx_shared'] = 'Player has tried to trigger \'esx:getSharedObject\'',
    ['ban_type_superjump'] = 'Player had modified there jump height',
    ['ban_type_client_files_blocked'] = 'Player didn\'t response after 5 times requesting if he\'s alive (Client Files Blocked)',
    ['kick_type_security_token'] = 'Because we couldn\'t create a new secret token',
    ['kick_type_security_mismatch'] = 'Because your secret token didn\'t match',

    -- Commands
    ['command'] = 'Command',
    ['available_commands'] = 'Available commands ',
    ['command_reload'] = 'Reload the list of bans',
    ['ips_command_reload'] = 'Reload the list of whitelisted IPs',
    ['ips_command_add'] = 'Add IP to the list of whitelisted IPs',
    ['command_help'] = 'Returns all anticheat commands',
    ['command_total'] = 'Returns the number of bans in list',
    ['total_bans'] = 'We currently have %s ban(s) in our list',
    ['command_not_found'] = 'does not exist',
    ['banlist_reloaded'] = 'All bans in anticheat has been reloaded from banlist.json',
    ['ips_reloaded'] = 'All IPs has been reloaded from ignore-ips.json',
    ['ip_added'] = 'IP: %s, has been added to the whitelist',
    ['ip_invalid'] = 'IP: %s, is not a valid IP, it should look like this, for example: 0.0.0.0',
    ['not_allowed'] = 'You don\'t have permission to execute %s',

    -- Discord
    ['discord_title'] = '[TigoAntiCheat] Has banned a player',
    ['discord_description'] = '**Name:** %s\n **Reason:** %s\n **Identifiers:**\n %s',
}
