-- server.lua

RegisterCommand("jail", function(source, args, rawCommand)
    -- Check if the player has provided a target player
    local targetPlayer = args[1]
    if not targetPlayer then
        TriggerClientEvent("okokNotify:notify", source, "error", "You must specify a player to jail.")
        return
    end

    -- Ensure the target player is valid
    local targetPlayerId = tonumber(targetPlayer)
    if targetPlayerId == nil or not GetPlayerName(targetPlayerId) then
        TriggerClientEvent("okokNotify:notify", source, "error", "Invalid player ID.")
        return
    end

    -- Jail the target player
    TriggerClientEvent("jail:teleport", targetPlayerId)

    -- Notify the admin that the jail command was successful
    TriggerClientEvent("okokNotify:notify", source, "success", "You have jailed " .. GetPlayerName(targetPlayerId))

    -- Notify the player that they are being jailed
    TriggerClientEvent("okokNotify:notify", targetPlayerId, "error", "You are being jailed by an admin.")
end, true)
