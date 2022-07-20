local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('foodquest:server:lookItems', function()
   local src = source 
   local Player = QBCore.Functions.GetPlayer(src)

          TriggerClientEvent('subtitles:client:drawSubtitles', src, 'Låt Mig Kolla ifall du tog på sallad ändå...', 4000)
               Player.Functions.RemoveItem("kebabpizza", 1)
                     TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["kebabpizza"], "remove")
          Wait(4000)
          TriggerClientEvent('subtitles:client:drawSubtitles', src, 'Här fåru en röding, Vann stort på casino förut', 4000)
                Player.Functions.AddMoney("cash", 500, "IDK")
end)