local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("police_car_tracker", function(source, item)
	local _source = source
	local Player = QBCore.Functions.GetPlayer(_source)
	if not Player then return end
	Player.Functions.RemoveItem("police_car_tracker", 1)
	TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['police_car_tracker'], "remove")
	TriggerClientEvent('::{BE-AX1S#3135}::be-policegps:placegps', _source)
end)
