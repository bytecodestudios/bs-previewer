local visible = false

local function disableControls()
    CreateThread(function()
        while visible do
            DisablePlayerFiring(PlayerPedId(), true)
            HudWeaponWheelIgnoreSelection()
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 37, true)
            DisableControlAction(0, 38, true)
            DisableControlAction(0, 45, true)
            DisableControlAction(0, 46, true)
            DisableControlAction(0, 200, true)
            DisableControlAction(0, 245, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 264, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 143, true)
            DisableControlAction(0, 322, true)
            SetPauseMenuActive(false)
            if IsDisabledControlJustPressed(0, 200) or IsDisabledControlJustPressed(0, 200) then
                ExecuteCommand('showcase_menu')
            end
            Wait(0)
        end
    end)
end

function ChatMessage(description)
    TriggerEvent('chat:addMessage', {
        multiline = true,
        templateId = 'script',
        args = { 'Bytecode Studios', description }
    })
end

function SetCoords(coords)
    if coords.x and coords.y and coords.z then
        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z)
    end
    if coords.w then
        SetEntityHeading(PlayerPedId(), coords.w)
    end
end

function SpawnVehicle(vehHash)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsUsing(ped)

    if not IsModelInCdimage(vehHash) then return end
    RequestModel(vehHash)
    while not HasModelLoaded(vehHash) do
        Wait(0)
    end

    if IsPedInAnyVehicle(ped) then
        DeleteVehicle(veh)
    end

    local coords, heading = GetEntityCoords(ped), GetEntityHeading(ped)
    local vehicle = CreateVehicle(vehHash, coords.x, coords.y, coords.z, heading, true, false)
    TaskWarpPedIntoVehicle(ped, vehicle, -1)
    SetVehicleFuelLevel(vehicle, 100.0)
    SetVehicleDirtLevel(vehicle, 0.0)
    SetModelAsNoLongerNeeded(vehHash)
    TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', GetVehicleNumberPlateText(vehicle))
end

RegisterNuiCallback('buttonClicked', function(data, cb)
    if data.type == 'location' then
        SetCoords(List[data.id].location)
    elseif data.type == 'action' then
        List[data.id].action()
    end
    ExecuteCommand('showcase_menu')
    TriggerServerEvent('previewer:sendLog', {
        title = 'BUTTON CLICKED',
        description = string.format('Player clicked %s button on %s', data.type, List[data.id].title or tostring(data.id))
    })
    cb('ok')
end)

RegisterKeyMapping('showcase_menu', 'Showcase Menu', 'keyboard', 'H')
RegisterCommand('showcase_menu', function()
    visible = not visible
    local data = { visible = visible }
    if visible then
        data.list = {}
        for id, values in pairs(List) do
            data.list[#data.list + 1] = {
                id = id,
                title = values.title,
                description = values.description,
                purchase = values.purchase,
                buttons = {
                    location = values.location and true or false,
                    action = values.action and true or false,
                }
            }
        end
        table.sort(data.list, function(a, b)
            return string.lower(a.title) < string.lower(b.title)
        end)
    end
    disableControls()
    SetNuiFocus(visible, visible)
    SetNuiFocusKeepInput(visible)
    SendNUIMessage({
        action = "MENU",
        data = data
    })
    TriggerServerEvent('previewer:sendLog', {
        title = 'TOGGLE MENU',
        description = string.format('Player %s menu', visible and 'opened' or 'closed'),
    })
end, false)

CreateThread(function()
    local checker = false
    while true do
        Wait(500)
        local isFocused = IsNuiFocused()
        local isPauseActive = IsPauseMenuActive()
        if not checker and (isPauseActive or isFocused) then
            checker = true
            SendNUIMessage({ action = 'MESSAGE', data = false })
        end
        if checker and (not isPauseActive and not isFocused) then
            checker = false
            SendNUIMessage({ action = 'MESSAGE', data = Message })
        end
    end
end)
