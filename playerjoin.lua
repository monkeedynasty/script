loadstring([[
    local HttpService = game:GetService("HttpService")

    -- Your Discord webhook URL (replace with your actual URL)
    local webhookUrl = "https://discord.com/api/webhooks/1365110012170731652/bFSO-YxJIxDU1N9bGvoI_nyXSz8kGrQCDF2JrGcYf4kbww0NsD71BeQiON8kTtNW5QUr"

    -- Function to send a message to Discord using the webhook
    local function sendToDiscord(message)
        local data = {
            content = message
        }

        local jsonData = HttpService:JSONEncode(data)

        -- Attempt to send the message to Discord via the webhook
        local success, errorMessage = pcall(function()
            HttpService:PostAsync(webhookUrl, jsonData, Enum.HttpContentType.ApplicationJson)
        end)

        -- Log the result or error
        if not success then
            warn("Failed to send message to Discord: " .. errorMessage)
        else
            print("Message successfully sent to Discord!")
        end
    end

    -- Send a test message "Hello from Roblox!"
    sendToDiscord("Hello from Roblox!")
]] )()
