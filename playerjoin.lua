local HttpService = game:GetService("HttpService")

-- Your Discord webhook URL (replace this with the one you got from Discord)
local webhookUrl = "https://discord.com/api/webhooks/1365110012170731652/bFSO-YxJIxDU1N9bGvoI_nyXSz8kGrQCDF2JrGcYf4kbww0NsD71BeQiON8kTtNW5QUr"

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
    else
        print("Message successfully sent to Discord!")
    end
end

game.Players.PlayerAdded:Connect(function(player)
    local welcomeMessage = "Player " .. player.Name .. " has joined the game!"
    print(welcomeMessage)

    -- Send the message to Discord
    sendToDiscord(welcomeMessage)
end)
