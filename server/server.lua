ESX = nil

TriggerEvent(AC.TriggerServer.."esx:getSharedObject", function(obj)
    ESX = obj
end)

RegisterServerEvent("AC-"..AC.Prefix..":BlacklistedVeh")
AddEventHandler("AC-"..AC.Prefix..":BlacklistedVeh", function()
    if AC.VehicleProtection then
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local date = os.date("%d-%m-%H-%M-%S")
        local old = LoadResourceFile(GetCurrentResourceName(), "./request/logs.json")
        local new = json.encode({playerName = GetPlayerName(source), license = xPlayer.identifier, hashKey = lol, date = date})
        local newData = old .. '\r // '..date..'\n' .. new..','
        SaveResourceFile(GetCurrentResourceName(), "./request/logs.json", newData, -1)
        print("["..randomColor()..""..AC.Prefix..""..stopColor().."] Nouvelle entrée disponible dans ./request/logs.json par "..xPlayer.name)
        AC_Webhooks(AC.Prefix.." - Events [AC-"..AC.Prefix..":BlacklistedVeh] \n**Plus d'informations :**\n```💻 Name : "..xPlayer.name.."```\n```📚 License : "..xPlayer.identifier.."```\n```🗃️ Groupe : "..xPlayer.getGroup().."```\n```🤠 Jobs : "..xPlayer.job.name.." - "..xPlayer.job.label.."```")
    end
end)

RegisterCommand(AC.CommandsCleanCache, function(source, args, rawCommand)
    if source ~= 0 then return print("Impossible depuis l'utilisateur client (not equal to source original)") end

    local date = os.date("%d-%m-%H-%M-%S")
    local old = LoadResourceFile(GetCurrentResourceName(), "./logs.json")
    local newData = json.encode({cleaned = true, bySource = source, date = date})
    SaveResourceFile(GetCurrentResourceName(), "./request/logs.json", newData, -1)
    print("["..randomColor()..""..AC.Prefix..""..stopColor().."] Le cache .json est désormais vide et disponible dans ./request/logs.json par Console")
    AC_Webhooks(AC.Prefix.." - Commands ["..AC.CommandsCleanCache.."] \n**Plus d'informations :**\n```💻 Name : "..xPlayer.name.."```\n```📚 License : "..xPlayer.identifier.."```\n```🗃️ Groupe : "..xPlayer.getGroup().."```\n```🤠 Jobs : "..xPlayer.job.name.." - "..xPlayer.job.label.."```")
end, false)

RegisterServerEvent("AC-"..AC.Prefix..":SaveHash")
AddEventHandler("AC-"..AC.Prefix..":SaveHash", function(hash)
    local source = source
    local random = math.random(1,2000)
    print("["..randomColor()..""..AC.Prefix..""..stopColor().."] Nouvelle entrée demandé par "..GetPlayerName(source)..", sauvegardé dans ./request/hash-"..random)
    SaveResourceFile(GetCurrentResourceName(), "./request/entityModel-"..random..".txt", hash, -1)
    AC_Webhooks(AC.Prefix.." - Events [AC-"..AC.Prefix..":SaveHash] \n**Plus d'informations :**\n```💻 Name : "..xPlayer.name.."```\n```📚 License : "..xPlayer.identifier.."```\n```🗃️ Groupe : "..xPlayer.getGroup().."```\n```🤠 Jobs : "..xPlayer.job.name.." - "..xPlayer.job.label.."```")
end)


for i,v in pairs(AC.BlacklistedEvents) do
    if AC.EventProtection then
        RegisterServerEvent(v)
        AddEventHandler(v, function()
            local source = source
            local xPlayer = ESX.GetPlayerFromId(source)
            local date = os.date("%d-%m-%H-%M-%S")
            local old = LoadResourceFile(GetCurrentResourceName(), "./request/logs.json")
            local new = json.encode({playerName = GetPlayerName(source), license = xPlayer.identifier, executedEvent = v, kickReason = AC.KickMessage, date = date})
            local newData = old .. '\r // '..date..'\n' .. new..','
            print("["..randomColor()..""..AC.Prefix..""..stopColor().."] Nouvelle entrée(trigger), sauvegardé dans ./request/logs.json")
            SaveResourceFile(GetCurrentResourceName(), "./request/logs.json", newData, -1)
            AC_Webhooks(AC.Prefix.." - EventProtection ["..v.."] \n**Plus d'informations :**\n```💻 Name : "..xPlayer.name.."```\n```📚 License : "..xPlayer.identifier.."```\n```🗃️ Groupe : "..xPlayer.getGroup().."```\n```🤠 Jobs : "..xPlayer.job.name.." - "..xPlayer.job.label.."```\n```🚀 Kick Pour : "..AC.KickMessage.."```")
            DropPlayer(source, AC.KickMessage)
        end)
    end
end

for i, v in pairs(AC.FiltredEvents) do
    if AC.EventsFiltred then
        RegisterServerEvent(v)
        AddEventHandler(v, function()
            local source = source
            local xPlayer = ESX.GetPlayerFromId(source)
            local date = os.date("%d-%m-%H-%M-%S")
            local old = LoadResourceFile(GetCurrentResourceName(), "./request/logs.json")
            local new = json.encode({playerName = GetPlayerName(source), license = xPlayer.identifier, executedEvent = v, date = date})
            local newData = old .. '\r // '..date..'\n' .. new..','
            print("["..randomColor()..""..AC.Prefix..""..stopColor().."] Nouvelle entrée(triggerFiltred), sauvegardé dans ./request/logs.json")
            SaveResourceFile(GetCurrentResourceName(), "./request/logs.json", newData, -1)
            AC_Webhooks(AC.Prefix.." - FiltredEvents ["..v.."] \n**Plus d'informations :**\n```💻 Name : "..xPlayer.name.."```\n```📚 License : "..xPlayer.identifier.."```\n```🗃️ Groupe : "..xPlayer.getGroup().."```\n```🤠 Jobs : "..xPlayer.job.name.." - "..xPlayer.job.label.."```")
        end)
    end
end

for i,v in pairs(AC.BlacklistedCommands) do
    if AC.CommandsProtection then
        RegisterCommand(v, function(source, args, rawCommand)
            local source = source
            local xPlayer = ESX.GetPlayerFromId(source)
            local date = os.date("%d-%m-%H-%M-%S")
            local old = LoadResourceFile(GetCurrentResourceName(), "./request/logs.json")
            local new = json.encode({playerName = GetPlayerName(source), license = xPlayer.identifier, executedCommand = v, kickReason = AC.KickMessage, date = date})
            local newData = old .. '\r // '..date..'\n' .. new..','
            print("["..randomColor()..""..AC.Prefix..""..stopColor().."] Nouvelle entrée(commands), sauvegardé dans ./request/logs.json")
            SaveResourceFile(GetCurrentResourceName(), "./request/logs.json", newData, -1)
            AC_Webhooks(AC.Prefix.." - CommandsProtection ["..v.."] \n**Plus d'informations :**\n```💻 Name : "..xPlayer.name.."```\n```📚 License : "..xPlayer.identifier.."```\n```🗃️ Groupe : "..xPlayer.getGroup().."```\n```🤠 Jobs : "..xPlayer.job.name.." - "..xPlayer.job.label.."```\n```🚀 Kick Pour : "..AC.KickMessage.."```")
            DropPlayer(source, AC.KickMessage)
        end, false)
    end
end
