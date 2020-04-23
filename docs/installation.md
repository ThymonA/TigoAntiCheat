# Installing
![FiveM Mustache](https://i.imgur.com/3dfbCNu.png)

> Explanation on how to install TigoAntiCheat

## Requirements
- Async | [GitHub](https://github.com/ESX-Org/async)
- Mustache | [GitHub](https://github.com/TigoDevelopment/FiveM-Mustache) or [FiveM Forum](https://forum.cfx.re/t/fivem-mustache-logic-less-mustache-templates-in-fivem-lua/1159921)

## Installation
You need to make sure that all resources required to run TigoAntiCheat are installed on your FiveM server.
Make sure you get the latest version of TigoAntiCheat from [GitHub Releases](https://github.com/TigoDevelopment/TigoAntiCheat/releases)
After downloading TigoAntiCheat, install it in a directory of your choice.
Then add the following to your server.cfg
```markdown
# TigoAntiCheat needs access to the following commands in order to start its generated resource
add_ace resource.TigoAntiCheat command.stop allow
add_ace resource.TigoAntiCheat command.start allow
add_ace resource.TigoAntiCheat command.refresh allow

# TigoAntiCheat can't ban people in the admin group and will not checked them when joining the server
add_ace group.admin tigoanticheat.bypass allow

# It should start as one of the first resources
start TigoAntiCheat
```
After you have added all the necessities into your server.cfg, it is now time to rename all events.
To make TigoAntiCheat easy to install and rename events, below is an overview of all search and replace words, which saves a lot of time.
Load your entire resource folder into your Visual Studio Code and start renaming every event using search and replace.

### List with search and replace

Search | Replace
:-------------|:--------------
`TriggerEvent('esx` | `TriggerEvent('tac`
`TriggerClientEvent('esx` | `TriggerClientEvent('tac`
`TriggerServerEvent('esx` | `TriggerServerEvent('tac`
`TriggerServerEventInternal('esx` | `TriggerServerEventInternal('tac`
`TriggerEventInternal('esx` | `TriggerEventInternal('tac`
`RegisterServerEvent('esx` | `RegisterServerEvent('tac`
`AddEventHandler('esx` | `AddEventHandler('tac`
`RegisterNetEvent('esx` | `RegisterNetEvent('tac`
`RegisterServerCallback('esx` | `RegisterServerCallback('tac`
`TriggerServerCallback('esx` | `TriggerServerCallback('tac`
`TriggerEvent("esx` | `TriggerEvent("tac`
`TriggerClientEvent("esx` | `TriggerClientEvent("tac`
`TriggerServerEvent("esx` | `TriggerServerEvent("tac`
`TriggerServerEventInternal("esx` | `TriggerServerEventInternal("tac`
`TriggerEventInternal("esx` | `TriggerEventInternal("tac`
`RegisterServerEvent("esx` | `RegisterServerEvent("tac`
`AddEventHandler("esx` | `AddEventHandler("tac`
`RegisterNetEvent("esx` | `RegisterNetEvent("tac`
`RegisterServerCallback("esx` | `RegisterServerCallback("tac`
`TriggerServerCallback("esx` | `TriggerServerCallback("tac`

After you've search and replace all events you have to look at the list of overview that is outside of this search and replace list.
You can find the overview in: [Overview of other events](https://tigoanticheat.readthedocs.io/en/latest/overview/).
Once you are sure that all events have been renamed, we will need to add and modify the config to match your server.

### Configuration
Configuration of TigoAntiCheat can be found in [Config.lua](https://github.com/TigoDevelopment/TigoAntiCheat/blob/master/config.lua)
The configuration has different config options, in the overview below each config option is explained.

Option | Example | Options | Type | Description
:------|:--------|:--------|:-----|:-----------
Language | `en` | `en`, `nl`| string | Language used in TigoAntiCheat
UpdateIdentifiers | `true` | `true`, `false` | boolean | Ban new identifiers when match has found with existing ban
BypassEnabled | `true` | `true`, `false` | boolean | Players that has the permission `AntiCheat.BypassAce` will never be banned and checked
DiscordWebhook | `https://discordapp.com/api/webhooks/......` | | string | You need to create a webhook url to stay up to date with new bans on your discord
VPNCheckEnabled | `true` | `true`, `false` | boolean | Once someone joins, check if IP is flagged as VPN or suspicious IP
VPNAPIKey | `ODU0NDpuU1lTREFiTzRQV.....` | | string | You need to create an API key to use the API, create an account and API key at [IPHub](https://iphub.info/apiKey/newFree)
RunningOS | `win` | `win`, `lux` | string | To ensure that OS-specific components work correctly, the operating system your using must be defind.
BypassAce | `tigoanticheat.bypass` | | string | If you have your own permission ace, you can overwrite the default with your own
EnableCountryWhitelist | `false` | `true`, `false` | boolean | You can set the country from which the IP must come in order to join
CountryWhitelist | `{ 'EN', 'NL' }` | Alpha-2 country codes -> https://www.iban.com/country-codes | string | List of Alpha-2 codes that can join when `EnableCountryWhitelist` is enabled

**AntiCheat.Generators**
This describes which client files need to be encrypted and started and which order, if you want to disable functions or anticheat checks, set `enabled` to `false` and it will not be added and loaded.

### Done
TigoAntiCheat should now be successfully installed.