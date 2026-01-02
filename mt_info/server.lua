-- mt_info - server
-- Version check + vRP data
-- MIT License

local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

local RESOURCE_NAME = GetCurrentResourceName()
local VERSION_URL = "https://raw.githubusercontent.com/MT-Scripts/mt_info/main/version.txt"

-- VERSION CHECK
CreateThread(function()
    Wait(2000)

    PerformHttpRequest(VERSION_URL, function(status, response)
        if status ~= 200 or not response then
            print("^3[mt_info]^7 Could not check version.")
            return
        end

        local latestVersion = response:gsub("%s+", "")
        local currentVersion = MT_INFO_VERSION

        if latestVersion ~= currentVersion then
            print("^1[mt_info]^7 UPDATE REQUIRED")
            print("^1[mt_info]^7 Current version: ^7" .. currentVersion)
            print("^1[mt_info]^7 Latest version: ^7" .. latestVersion)
            print("^1[mt_info]^7 Download update from GitHub.")
        else
            print("^2[mt_info]^7 Resource is up to date. (v" .. currentVersion .. ")")
        end
    end, "GET")
end)

-- PLAYER INFO
RegisterNetEvent("mt_info:getInfo")
AddEventHandler("mt_info:getInfo", function()
    local src = source
    local user_id = vRP.getUserId({src}) or 0

    local staff = false
    if user_id > 0 then
        staff = vRP.hasPermission({user_id, "admin.menu"}) or false
    end

    local job = "citizen"
    if user_id > 0 then
        local groups = vRP.getUserGroups({user_id})
        for k,_ in pairs(groups) do
            job = k
            break
        end
    end

    TriggerClientEvent("mt_info:setInfo", src, {
        user_id = user_id,
        server_id = src,
        staff = staff,
        job = job,
        lang = "da"
    })
end)
