-- mt_info - client
-- HUD controller

local hudEnabled = true

RegisterNetEvent("mt_info:setInfo")
AddEventHandler("mt_info:setInfo", function(data)
    SendNUIMessage({
        action = "init",
        data = data
    })
end)

-- Toggle HUD (F10)
CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustPressed(0, 57) then
            hudEnabled = not hudEnabled
            SendNUIMessage({
                action = "toggle",
                state = hudEnabled
            })
        end
    end
end)

CreateThread(function()
    Wait(2000)
    TriggerServerEvent("mt_info:getInfo")
    SetNuiFocus(false, false)
end)
