Locales['tr'] = {
    -- Name
    ['name'] = 'TigoAntiHile',

    -- General
    ['unknown'] = 'bilinmeyen',
    ['fatal_error'] = 'FATAL HATA',

    -- Resource strings
    ['callback_not_found'] = '[%s] bulunamadi',
    ['trigger_not_found'] = '[%s] bulunamadi',

    -- Ban strings
    ['user_ban_reason'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Bu sunucudan banlandin ( Isim: %s )',
    ['user_kick_reason'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Sunucudan atildin ( Sebep: %s )',
    ['banlist_ban_reason'] = 'Oyuncu bu eventi triggerlamaya calisti \'%s\' event',
    ['banlist_not_loaded_kick_player'] = '👮 𝗧𝗶𝗴𝗼𝗔𝗻𝘁𝗶𝗖𝗵𝗲𝗮𝘁 | Banlar yuklenemedi, Birkac saniye beklemek zorundasin. Daha sonra dene!',
    ['new_identifiers_found'] = '%s, yeni identifier(lar) bulundu - orijinal ban %s',
    ['failed_to_load_banlist'] = '[TigoAntiCheat] Ban listesi yuklenemedi!',
    ['failed_to_load_tokenlist'] = '[TigoAntiCheat] Token listesi yuklenemedi!',
    ['failed_to_load_check'] = '[TigoAntiCheat] Bu hatayi duzeltmelisin, Banlar CALISMAYACAK!',
    ['ban_type_godmode'] = 'Oyuncuda godmode tespit edildi',
    ['lua_executor_found'] = 'Oyuncuda lua executor tespit edildi',
    ['ban_type_injection'] = 'Oyuncu oyuna komut ekledi (Enjekte)',
    ['ban_type_blacklisted_weapon'] = 'Oyuncu blacklistlenmis silah aldi: %s',
    ['ban_type_blacklisted_key'] = 'Oyuncu blacklistli bir tusa basti %s',
    ['ban_type_hash'] = 'Oyuncu hash degistirdi',
    ['ban_type_esx_shared'] = 'Oyuncu sunu triggerlamaya calisti: \'esx:getSharedObject\'',
    ['ban_type_superjump'] = 'Oyuncu ziplama yuksekligini degistirdi',
    ['ban_type_client_files_blocked'] = 'Oyuncu canli olup olmadigini 5 saniye boyunca belirtmedi (Client Dosyalari Engellendi)',
    ['kick_type_security_token'] = 'Cunku sana ozel bir token olusturamayiz.',
    ['kick_type_security_mismatch'] = 'Cunku ozel tokenin eslesmedi',

    -- Commands
    ['command'] = 'Komut',
    ['available_commands'] = 'Mevcut Komutlar ',
    ['command_reload'] = 'Ban listesini yeniden yukle',
    ['command_help'] = 'Tum antihile komutlarini dondurur',
    ['command_total'] = 'Toplam ban sayisini dondurur',
    ['total_bans'] = 'Su anda listede %s adet ban var',
    ['command_not_found'] = 'yok',
    ['banlist_reloaded'] = 'Tum banlar banlist.json dosyasindan geri yuklendi.',
    ['not_allowed'] = 'Bunu calistirmak icin iznin yok %s',

    -- Discord
    ['discord_title'] = '[TigoAntiHile] Bir oyuncuyu banladi',
    ['discord_description'] = '**Isim:** %s\n **Sebep:** %s\n **Kimlikler:**\n %s'
}
