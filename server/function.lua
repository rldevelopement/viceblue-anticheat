--[[
    Created by Authentic

    © All right reserved to ViceBlue don't copy or use this part if you don't have permission
    to use that .
    
    --File : ./server/function.lua
]]

randomColor = function()
    return "^"..math.random(1,10)
end

stopColor = function()
    return "^7"
end

TS_AC = function(name, ...)
    TriggerClientEvent("AC-"..AC.Prefix..""..name, ...)
end

local colors = {
    [1] = 1752220,
    [2] = 1146986,
    [3] = 2067276,
    [4] = 10181046,
    [5] = 15277667,
    [6] = 15105570,
    [7] = 9807270,
    [8] = 15158332,
    [9] = 16776960,
    [10] = 3447003
}

AC_Webhooks = function(message)
	local data = os.date('%H:%M:%S', os.time())

    local embeds = {
    	{
    		["title"] = message,
    		["type" ] = "rich",
    		["color"] = colors[math.random(1,10)],
    		["footer"] =  {
    			["text"] = AC.Prefix.." : "..data,
    		},
    	}
    }

	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(AC.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({ username = AC.Prefix, embeds = embeds}), { ['Content-Type'] = 'application/json' })
end 
