local HttpService = game:GetService("HttpService")

-- Your Discord webhook URL (replace this with the one you got from Discord)
local webhookUrl = "https://discord.com/api/webhooks/1365110003630866534/mM9qkX5tHTqq2nhjsMX0AL3LR8n5jh2qGfzHkUX1Db9lkJJ74MZ8KB7Px6ERcFcDVpWh"

-- Function to send the message to Discord
local function sendToDiscord(message)
    local data = {
        content = message
    }

    local jsonData = HttpService:JSONEncode(data)

    -- Send the data to Discord via the webhook
    local success, errorMessage = pcall(function()
        HttpService:PostAsync(webhookUrl, jsonData, Enum.HttpContentType.ApplicationJson)
    end)

    if not success then
        warn("Failed to send message to Discord: " .. errorMessage)
    end
end

game.Players.PlayerAdded:Connect(function(player)
    local welcomeMessage = "Player " .. player.Name .. " has joined the game!"
    print(welcomeMessage)

    -- Send the message to Discord
    sendToDiscord(welcomeMessage)
end)
