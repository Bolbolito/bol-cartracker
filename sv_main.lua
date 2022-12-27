local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("police_car_tracker", function(source, item)
	local _source = source
	TriggerClientEvent('be-policegps:placegps', _source)
	Player.Functions.RemoveItem("police_car_tracker", 1)
	TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['police_car_tracker'], "remove")
end)
