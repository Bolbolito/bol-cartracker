local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("police_car_tracker", function(source, item)
    local _source = source
	TriggerClientEvent('be-policegps:placegps', _source)
end)

RegisterServerEvent('be-policegps:removeitem')
AddEventHandler('be-policegps:removeitem', function()
	local _source = source
    local Player = QBCore.Functions.GetPlayer(_source)
	Player.Functions.RemoveItem("police_car_tracker", 1)
	TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['police_car_tracker'], "remove")
end)