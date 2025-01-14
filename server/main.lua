local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('foodquest:server:lookItems', function()
   local src = source 
   local Player = QBCore.Functions.GetPlayer(src)

                    TriggerClientEvent('QBCore:Notify', src, 'Heyyoo Pizza time' 4000)
               Player.Functions.RemoveItem("pizza", 1)
                     TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["pizza"], "remove")
          Wait(4000)
              TriggerClientEvent('QBCore:Notify', src, 'Here take some money, won at the casino earlier', 4000)
                Player.Functions.AddMoney("cash", 500, "Food Delivery")
end)
