-- client.lua

-- Jail coordinates (You can set this to your desired jail location)
local jailCoords = vector3(1680.0, 2535.0, 45.0)  -- Example coordinates, replace with your jail's coordinates
local jailTime = 300  -- Jail time in seconds (5 minutes)

RegisterNetEvent("jail:teleport")
AddEventHandler("jail:teleport", function()
    -- Notify the player that they are being sent to jail
    TriggerEvent("okokNotify:notify", "error", "You have been jailed!")
    
    -- Teleport the player to the jail
    local playerPed = PlayerPedId()
    SetEntityCoords(playerPed, jailCoords.x, jailCoords.y, jailCoords.z, false, false, false, false)
    
    -- Set the player's wanted level to prevent escaping or being free
    ClearPedTasksImmediately(playerPed)
    SetEntityInvincible(playerPed, true)
    FreezeEntityPosition(playerPed, true)

    -- Set a timer for how long the player will stay in jail (jailTime in seconds)
    Citizen.Wait(jailTime * 1000)  -- Convert seconds to milliseconds

    -- After jail time expires, release the player
    FreezeEntityPosition(playerPed, false)
    SetEntityInvincible(playerPed, false)
    TriggerEvent("okokNotify:notify", "success", "Your jail time is over. You are free to go!")
end)

