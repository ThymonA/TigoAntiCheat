Locales['fi'] = {
    -- Nimi
    ['name'] = 'TigoAntiCheat',

    -- Yleiset
    ['unknown'] = 'järjestelmävirhe',
    ['fatal_error'] = 'palautumaton virhe',

    -- Resurssi stringit
    ['callback_not_found'] = '[%s] ei ole löytynyt',
    ['trigger_not_found'] = '[%s] ei ole löytynyt',

    -- Porttikielto Stringit
    ['checking'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Sinua tarkistetaan para-aikaan...',
    ['user_ban_reason'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Olet saanut porttikiellon ( Käyttäjänimi: %s )',
    ['user_kick_reason'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Sinut on heitetty ulos kaupungista ( Syy: %s )',
    ['banlist_ban_reason'] = 'Pelaaja on laukaissut \'%s\' tapahtuman',
    ['banlist_not_loaded_kick_player'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Porttikiellot eivät ole vielä latautuneet, sinun pitää oottaa hetki!',
    ['ip_not_found'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Emme valitettavasti löytänyt ip-osoitettasi',
    ['ip_blocked'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Sinulla on VPN yhteys päällä, ota se pois päältä tai ota yhteyttä ylläpitäjään.',
    ['new_identifiers_found'] = '%s, uudet käyttäjätiedot löydetty - muutokset %s',
    ['failed_to_load_banlist'] = '[TigoAntiCheat] Porttikielto listaa ei ladattu onnistuneest!',
    ['failed_to_load_tokenlist'] = '[TigoAntiCheat] Tokenlistan lastaus epäonnistui!',
    ['failed_to_load_ips'] = '[TigoAntiCheat] IP-osoitteiden lataus epäonnistui!',
    ['failed_to_load_check'] = '[TigoAntiCheat] Ole hyvä ja tarkista virheviesti, porttikiellot ei toimi!',
    ['ban_type_godmode'] = 'Jumala tila havaittu pelaajalla',
    ['lua_executor_found'] = 'Lua executor löydetty pelaajalta',
    ['ban_type_injection'] = 'Pelaaja on injektoinut komentoja',
    ['ban_type_blacklisted_weapon'] = 'Pelaajalla oli estettyjä aseita: %s',
    ['ban_type_blacklisted_key'] = 'Pelaaja painoi kielettyä nappia: %s',
    ['ban_type_hash'] = 'Pelaajalla oli muokattu arvo',
    ['ban_type_esx_shared'] = 'Pelajaa on laukaissut \'esx:getSharedObject\'',
    ['ban_type_superjump'] = 'Pelaaja on muokannut hyppykorkeutta',
    ['ban_type_client_files_blocked'] = 'Pelaaja ei vastannut 5 pyynnön jälkeen onko hengissä (Client Files Blocked)',
    ['kick_type_security_token'] = 'Emme pystyneet luomaan salaista tokenia',
    ['kick_type_security_mismatch'] = 'Salainen tokenisi ei vastaa meidän tokenia',

    -- Komennot
    ['command'] = 'Komento',
    ['available_commands'] = 'Saatavilla olevat komennot ',
    ['command_reload'] = 'Päivitä porttikielto lista',
    ['ips_command_reload'] = 'Päivitä lista sallituista ip-osoiteista',
    ['ips_command_add'] = 'Lisää ip-osoite salittuihin ip-osoitteisiin',
    ['command_help'] = 'Palauta kaikki anticheat komennot',
    ['command_total'] = 'Palauttaa porttikieltojen määrän',
    ['total_bans'] = 'Meillä tällä hetkellä on %s porttikieltoa tietokannassa',
    ['command_not_found'] = 'Ei ole saatavilla',
    ['banlist_reloaded'] = 'Kaikkia porttikiellot on päivitetty banlist.json tiedostosta',
    ['ips_reloaded'] = 'Kaikki ip-osoitteet on päivitetty tiedostosta ignore-ips.json',
    ['ip_added'] = 'IP: %s, on lisätty salittuihin ip-osoitteisiin',
    ['ip_invalid'] = 'IP: %s, ei ole validi ip-osoite, sen pitäisi näyttää, tältä: 0.0.0.0',
    ['not_allowed'] = 'Sinulla ei ole käyttöoikeutta suorittaa %s',

    -- Discord
    ['discord_title'] = '[TigoAntiCheat] antanut porttikiellon',
    ['discord_description'] = '**Nimi:** %s\n **Syy:** %s\n **Identikaatio:**\n %s',
}
