Locales['dk'] = {
    -- Name
    ['name'] = 'TigoAntiCheat',

    -- General
    ['unknown'] = 'ukendt',
    ['fatal_error'] = 'FATAL FEJL',

    -- Resource strings
    ['callback_not_found'] = '[%s] er ikke fundet',
    ['trigger_not_found'] = '[%s] er ikke fundet',

    -- Ban strings
    ['checking'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Du kontrolleres i øjeblikket...',
    ['user_ban_reason'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Du er blevet bannet fra denne server ( Brugernavn: %s )',
    ['user_kick_reason'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Du er blevet smidt ud ( Grund: %s )',
    ['banlist_ban_reason'] = 'Player has tried to trigger \'%s\' event',
    ['banlist_not_loaded_kick_player'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Vores banliste er ikke loadet ind, du skal vente et par sekunder med at joine!',
    ['ip_not_found'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Vi kunne ikke finde din IP',
    ['ip_blocked'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Du har en VPN aktiv, deaktiver den for at tilslutte sig serveren Forkert? Kontakt serverejerne',
    ['new_identifiers_found'] = '%s, ny identifikation er fundet - originalt forbud %s',
    ['failed_to_load_banlist'] = '[TigoAntiCheat] Fejlet at loade Blacklist!',
    ['failed_to_load_tokenlist'] = '[TigoAntiCheat] Fejlet at loade Tokenlist!',
    ['failed_to_load_ips'] = '[TigoAntiCheat] Fejlet at loade IPs!',
    ['failed_to_load_check'] = '[TigoAntiCheat] Vær venlig og tjekke denne fejl, Bans *vil ikke* virke!',
    ['ban_type_godmode'] = 'Godmode opdaget på en spiller',
    ['lua_executor_found'] = 'Lua executor opdaget på en spiller',
    ['ban_type_injection'] = 'Spilleren har injiceret nogle kommandoer (Injection)',
    ['ban_type_blacklisted_weapon'] = 'Spilleren havde et blacklisted våben: %s',
    ['ban_type_blacklisted_key'] = 'Spilleren havde brugt en blacklisted key for %s',
    ['ban_type_hash'] = 'Spilleren havde ændret en hash',
    ['ban_type_esx_shared'] = 'Spilleren har forsøgt at udløse \'esx:getSharedObject\'',
    ['ban_type_superjump'] = 'Spilleren har modificerede deres hoppe-styrke',
    ['ban_type_client_files_blocked'] = 'Spilleren svarede ikke efter 5 gange med anmodning om, han var i live (Client Files Blocked)',
    ['kick_type_security_token'] = 'Fordi vi ikke kunne oprette en ny sikkerhedstoken (Secret token)',
    ['kick_type_security_mismatch'] = 'Din sikkerhedstoken passer ikke',

    -- Commands
    ['command'] = 'Kommando',
    ['available_commands'] = 'Tilgængelige kommandoer ',
    ['command_reload'] = 'Genlæs banlisten',
    ['ips_command_reload'] = 'Genlæs listen over hvidlistede IP\'er',
    ['ips_command_add'] = 'Føj IP til listen over hvidlistede IP\'er',
    ['command_help'] = 'Returnerer alle anticheat-kommandoer',
    ['command_total'] = 'Returnerer antallet af ban på listen',
    ['total_bans'] = 'Vi har i øjeblikket bannet %s person(er)',
    ['command_not_found'] = 'eksisterer ikke',
    ['banlist_reloaded'] = 'Alle bans mod anticheat er blevet genindlæst fra banlist.json',
    ['ips_reloaded'] = 'Alle IP\'er er blevet genindlæst fra ignor-ips.json',
    ['ip_added'] = 'IP: %s, er føjet til hvidlisten',
    ['ip_invalid'] = 'IP: %s, er ikke en gyldig IP, den skal se sådan ud, for eksempel: 0.0.0.0',
    ['not_allowed'] = 'You don\'t have permission to execute %s',

    -- Discord
    ['discord_title'] = '[TigoAntiCheat] en spiller er blevet bannet',
    ['discord_description'] = '**Navn:** %s\n **Grund:** %s\n **identifikatorer:**\n %s'
}
