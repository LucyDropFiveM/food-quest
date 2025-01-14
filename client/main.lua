local QBCore = exports['qb-core']:GetCoreObject()

-- COMMENTS

CreateThread(function()
    local modelHash = 'A_M_M_GenFat_02'
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(0) 
    end

    local ped =	CreatePed(1 , modelHash, vector4(-1031.21, 860.23, 154.12, 266.77),  false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedDiesWhenInjured(ped, false)
    SetPedCanPlayAmbientAnims(ped, true)
    SetPedCanRagdollFromPlayerImpact(ped, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)     
end)

CreateThread(function()
exports['qb-target']:AddBoxZone("rrTalk", vector3(-1030.71, 860.26, 155.12), 1.1, 1.0, { 
    name = "rrTalk", 
    heading = 125.0, 
    debugPoly = false, 
    minZ = 155.0,
    maxZ = 157.0,
   
  }, {
    options = { 
      { 
        type = "client", 
        event = "foodquest:client:talkToRR", 
        icon = 'fa fa-etsy', 
        label = 'Prata Med RR', 
      },
    },
    distance = 1.5, 
  })
end)


RegisterNetEvent('foodquest:client:talkToRR', function()
  local ped = PlayerPedId()

    FreezeEntityPosition(ped, true)
        QBCore.Functions.Notify('Hello im hungry', 4000)
    Wait(4000)
        QBCore.Functions.Notify('Get me a pizza', 7500)
    Wait(7500)
        QBCore.Functions.Notify('Cant get away from here, broke my leg', 7500)
    Wait(7500)
        QBCore.Functions.Notify('Come back and give the pizza and I will hand you some money', 4000)
    Wait(100)
    exports['qb-target']:RemoveZone("rrTalk")
        FreezeEntityPosition(ped, false)

        QBCore.Functions.Notify('Go to the pizza shop, 'success', 7500)
    Wait(1000)
    SpawnZone()
end)



function SpawnZone()
  exports['qb-target']:AddBoxZone("rrTalk2", vector3(-1030.71, 860.26, 155.12), 1.1, 1.0, { 
    name = "rrTalk2", 
    heading = 125.0, 
    debugPoly = false, 
    minZ = 155.0,
    maxZ = 157.0,
   
  }, {
    options = { 
      { 
        type = "client", 
        event = "foodquest:client:leaveFood", 
        icon = 'fa fa-etsy', 
        label = 'Leave food to person', 
        item = 'pizza',
      },
    },
    distance = 1.5, 
  })
end

RegisterNetEvent('foodquest:client:leaveFood', function()
    TriggerServerEvent('foodquest:server:lookItems')
    exports['qb-target']:RemoveZone("rrTalk2")
end)
