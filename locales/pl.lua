Locales['pl'] = {
    -- Name
    ['name'] = 'TigoAntiCheat',

    -- General
    ['unknown'] = 'Nieznany',
    ['fatal_error'] = 'FATAL ERROR',

    -- Resource strings
    ['callback_not_found'] = '[%s] nie został znaleziony',
    ['trigger_not_found'] = '[%s] nie został znaleziony',

    -- Ban strings
    ['user_ban_reason'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Zostałeś zbanowany ( 𝗨𝘀𝗲𝗿𝗻𝗮𝗺𝗲: %s )',
    ['user_kick_reason'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Zostałeś wyrzucony z serwera ( 𝗥𝗲𝗮𝘀𝗼𝗻: %s )',
    ['banlist_ban_reason'] = 'Gracz próbował wywołać \'%s\' event',
    ['banlist_not_loaded_kick_player'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Nasza baza banów nie została załadowana, poczekaj parę sekund. Spróbuj ponownie później!',
    ['new_identifiers_found'] = '%s, nowe identyfikatory znalezione - oryginalny ban %s',
    ['failed_to_load_banlist'] = '[TigoAntiCheat] Błąd wczytywania ban listy!',
    ['failed_to_load_tokenlist'] = '[TigoAntiCheat] Błąd wczytywania token listy!',
    ['failed_to_load_check'] = '[TigoAntiCheat] Sprawdź błąd później, bany *nie będą* działać!',
    ['ban_type_godmode'] = 'Godmode został wykryty u gracza',
    ['lua_executor_found'] = 'Lua executor wykryty u gracza',
    ['ban_type_injection'] = 'Gracz zainjectował komendy (Injection)',
    ['ban_type_blacklisted_weapon'] = 'Player miał broń z blacklisty: %s',
    ['ban_type_blacklisted_key'] = 'Player nacisnął klawisz z blacklisty %s',
    ['ban_type_hash'] = 'Gracz zmodyfikował hash',
    ['ban_type_esx_shared'] = 'Gracz próbował wywołać \'esx:getSharedObject\'',
    ['ban_type_superjump'] = 'Gracz zmodyfikował wysokość skoku',
    ['ban_type_client_files_blocked'] = 'Gracz nie odpowiada po 5 razach requesting jeżeli jest dostępny (Client Files Blocked)',
    ['kick_type_security_token'] = 'Nie możemy stworzyć nowego security token',
    ['kick_type_security_mismatch'] = 'Twój security token nie pasuje',

    -- Commands
    ['command'] = 'Komenda',
    ['available_commands'] = 'Dostępne komendy ',
    ['command_reload'] = 'Przeładuj listę banów',
    ['command_help'] = 'Zwróć wszystkie komendy anticheata',
    ['command_total'] = 'Zwróć liczbę banów w liście',
    ['total_bans'] = 'Mamy %s ban(ów) na naszej liście',
    ['command_not_found'] = 'nie istnieje',
    ['banlist_reloaded'] = 'Wszystkie bany anticheata zostały przeładowane z banlist.json',
    ['not_allowed'] = 'Nie masz wystarczających uprawnień do %s',

    -- Discord
    ['discord_title'] = '[TigoAntiCheat] Zablokował gracza za oszukiwanie',
    ['discord_description'] = '**Nazwa:** %s\n **Powód:** %s\n **Identifiers:**\n %s'
}
