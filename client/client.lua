ESX = nil

TriggerEvent(AC.TriggerServer.."esx:getSharedObject", function(obj)
    ESX = obj
end)

Citizen.CreateThread(function()
    if AC.VehicleProtection then
        while true do
            Citizen.Wait(100)
            local inVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            if AC.BlacklistedVehicles[GetEntityModel(inVehicle)] then
                ESX.Game.DeleteVehicle(inVehicle)
                TC_AC("BlacklistedVeh")
                ESX.ShowNotification("Votre ~r~véhicule~s~ est en ~r~liste noire~s~, désolé mais vous ne pouvez l'utiliser contacter un ~r~administrateur serveur~s~ pour toute demande.")
            else
                Wait(2000)
            end
        end
    end
end)

RegisterCommand("getHashkey", function(source, args, rawCommand)
    local inVehicle = GetVehiclePedIsIn(PlayerPedId(), false)

    if args[1] then
        print(GetEntityModel(args[1]))
        TC_AC("SaveHash", GetEntityModel(inVehicle))
    else
        print(GetEntityModel(inVehicle))
        TC_AC("SaveHash", GetEntityModel(inVehicle))
    end
end, false)

