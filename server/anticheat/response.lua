local CheckIfClientResourceIsRunningTriggerd = false

TAC.RegisterServerEvent('tigoanticheat:stillAlive', function(source)
    if (TAC.StartedPlayers[tostring(source)] == nil) then
        TAC.StartedPlayers[tostring(source)] = {
            lastResponse = os.time(os.date("!*t")),
            numberOfTimesFailed = 0
        }
    end

    TAC.StartedPlayers[tostring(source)].lastResponse = os.time(os.date("!*t"))
end)

Citizen.CreateThread(function()
    Citizen.Wait(5000)

    if (not CheckIfClientResourceIsRunningTriggerd) then
        CheckIfClientResourceIsRunning()
        CheckIfClientResourceIsRunningTriggerd = true
    end
end)

RegisterServerEvent('es:firstJoinProper')
AddEventHandler('es:firstJoinProper', function()
    local _source = source

    if (TAC.StartedPlayers[tostring(_source)] == nil) then
        TAC.StartedPlayers[tostring(_source)] = {
            lastResponse = os.time(os.date("!*t")),
            numberOfTimesFailed = 0
        }
    end
end)

function CheckIfClientResourceIsRunning()
    CheckIfClientResourceIsRunningTriggerd = true

    for _, playerId in pairs(GetPlayers()) do
        if (TAC.StartedPlayers[tostring(playerId)] == nil) then
            TAC.StartedPlayers[tostring(playerId)] = {
                lastResponse = os.time(os.date("!*t")),
                numberOfTimesFailed = 0
            }
        end
    end

    if (TAC.StartedPlayers == nil) then
        TAC.StartedPlayers = {}
    end

    for playerId, data in pairs(TAC.StartedPlayers) do
        if (playerId ~= nil and tonumber(playerId) ~= 0) then
            local banned = false

            if (TAC.StartedPlayers[playerId].numberOfTimesFailed > 5) then
                TAC.BanPlayerWithReason(tonumber(playerId), _U('ban_type_client_files_blocked'))
                banned = true
            end

            if (not banned) then
                if ((TAC.StartedPlayers[playerId].lastResponse + 100) < os.time(os.date("!*t"))) then
                    TAC.StartedPlayers[playerId].numberOfTimesFailed = TAC.StartedPlayers[playerId].numberOfTimesFailed + 1
                end

                TAC.TriggerClientCallback(tonumber(playerId), 'tigoanticheat:stillAlive', function()
                    if (TAC.StartedPlayers[playerId] ~= nil) then
                        TAC.StartedPlayers[playerId].lastResponse = os.time(os.date("!*t"))

                        if (TAC.StartedPlayers[playerId].numberOfTimesFailed > 0) then
                            TAC.StartedPlayers[playerId].numberOfTimesFailed = TAC.StartedPlayers[playerId].numberOfTimesFailed - 1
                        end
                    end
                end)
            end
        end
    end

    SetTimeout(60000, CheckIfClientResourceIsRunning)
end

RegisterServerEvent('playerDropped')
AddEventHandler('playerDropped', function()
    local _source = source

    if (TAC.StartedPlayers ~= nil and TAC.StartedPlayers[tostring(_source)] ~= nil) then
        TAC.StartedPlayers[tostring(_source)] = nil
    end
end)