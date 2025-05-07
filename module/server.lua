local QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent('previewer:sendLog', function(data)
    local src = data.playerId or source
    local identifiers = GetPlayerIdentifiers(src)
    PerformHttpRequest(LogWebhook, function() end, 'POST', json.encode({
        username = string.format('Previewer %s', data.type or ''),
        embeds = {
            {
                title = data.title or '',
                color = 40153,
                author = {
                    name = 'bytecode_studios',
                },
                description = string.format('Message: %s \n\n Identifiers: %s', data.description, json.encode(identifiers)),
                footer = {
                    text = os.date('%c'),
                },
            }
        }
    }), { ['Content-Type'] = 'application/json' })
end)

RegisterNetEvent('previewer:provideItems', function(type)
    if source and Items[type] and next(Items[type]) then
        for _, item in pairs(Items[type]) do
            exports.ox_inventory:AddItem(source, item.name, item.amount or 1, item.metadata or {})
        end
    end
end)

RegisterNetEvent('previewer:addJob', function(department, rank)
    if source and department then
        local player = QBCore.Functions.GetPlayer(source)
        if not player then return end
        local citizenId = player.PlayerData.citizenid
        exports["ps-multijob"]:AddJob(citizenId, department, rank or 0)
    end
end)

RegisterNetEvent('previewer:logout', function()
    local src = source
    QBCore.Player.Logout(src)
    SetTimeout(1500, function()
        TriggerClientEvent('characters:client:initiateMenu', src)
    end)
end)
