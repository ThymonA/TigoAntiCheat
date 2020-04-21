local registeredEvents = {}
local fakeEvents = {
    -- ESX Events
    'esx:getSharedObject',
    'esx_ambulancejob:revive',
    'esx_society:openBossMenu',
    'esx_status:set',
    'esx_policejob:handcuff',
    'esx_jailer:wysylandoo',
    'esx_godirtyjob:pay',
    'esx_pizza:pay',
    'esx_slotmachine:sv:2',
    'esx_banksecurity:pay',
    'esx_gopostaljob:pay',
    'esx_truckerjob:pay',
    'esx_carthief:pay',
    'esx_garbagejob:pay',
    'esx_ranger:pay',
    'esx_truckersjob:payy',
    'esx_blanchisseur:washMoney',
    'esx_moneywash:withdraw',
    'esx_blanchisseur:startWhitening',
    'esx_billing:sendBill',
    'esx_dmvschool:pay',
    'esx_jailer:sendToJail',
    'esx_jailler:sendToJail',
    'esx-qalle-jail:jailPlayer',
    'esx-qalle-jail:jailPlayerNew',
    'esx_jailer:sendToJailCatfrajerze',
    'esx_policejob:billPlayer',
    'esx_skin:openRestrictedMenu',
    'esx_inventoryhud:openPlayerInventory',

    -- Other Events
    'bank:transfer',
    'advancedFuel:setEssence',
    'tost:zgarnijsiano',
    'Sasaki_kurier:pay',
    'wojtek_ubereats:napiwek',
    'wojtek_ubereats:hajs',
    'xk3ly-barbasz:getfukingmony',
    'xk3ly-farmer:paycheck',
    'tostzdrapka:wygranko',
    'laundry:washcash',
    'projektsantos:mandathajs',
    'program-keycard:hacking',
    '6a7af019-2b92-4ec2-9435-8fb9bd031c26',
    '211ef2f8-f09c-4582-91d8-087ca2130157',
    'neweden_garage:pay',
    '8321hiue89js',
    'js:jailuser',
    'wyspa_jail:jailPlayer',
    'wyspa_jail:jail',
    'gcPhone:sendMessage',
    'ambulancier:selfRespawn',
    'UnJP'
}

for _, eventInfo in pairs(fakeEvents) do
    if (registeredEvents == nil) then
        registeredEvents = {}
    end

    if (registeredEvents[eventInfo] == nil or not registeredEvents[eventInfo]) then
        RegisterNetEvent(eventInfo)
        AddEventHandler(eventInfo, function()
            {{{module}}}.TriggerServerEvent('{{{resource}}}:{{{banPlayer}}}', '{{{event}}}', eventInfo)
        end)

        registeredEvents[eventInfo] = true
    end
end