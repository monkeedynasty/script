loadstring([[
    local HttpService = game:GetService("HttpService")

    -- Your Discord webhook URL (replace with your actual URL)
    local webhookUrl = "https://discord.com/api/webhooks/1365110012170731652/bFSO-YxJIxDU1N9bGvoI_nyXSz8kGrQCDF2JrGcYf4kbww0NsD71BeQiON8kTtNW5QUr"

    -- Send a "Hello from Roblox!" message to Discord
    local data = {
        content = "Hello from Roblox!"
    }
    local jsonData = HttpService:JSONEncode(data)

    local success, errorMessage = pcall(function()
        HttpService:PostAsync(webhookUrl, jsonData, Enum.HttpContentType.ApplicationJson)
    end)

    if not success then
        warn("Failed to send message to Discord: " .. errorMessage)
    else
        print("Message successfully sent to Discord!")
    end
]] )()
