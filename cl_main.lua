_print = print
_TriggerServerEvent = TriggerServerEvent
_NetworkExplodeVehicle = NetworkExplodeVehicle
_AddExplosion = AddExplosion

local QBCore = exports['qb-core']:GetCoreObject()
local timerRemoveBlip = 300000 -- in MS

local function startAnim(lib, anim)
	local ped = PlayerPedId()
	Citizen.CreateThread(function()
		RequestAnimDict(lib)
		while not HasAnimDictLoaded( lib) do
			Wait(1)
		end
		TaskPlayAnim(ped, lib ,anim ,8.0, -8.0, -1, 0, 0, false, false, false )
	end)
end

RegisterNetEvent('be-policegps:placegps')
AddEventHandler('be-policegps:placegps', function()
	local ped = PlayerPedId()
	local vehicle = QBCore.Functions.GetClosestVehicle()
	local pos = GetEntityCoords(ped)
	if #(pos - GetEntityCoords(vehicle)) > 2.5 then QBCore.Functions.Notify('No vehicle nearby!', 'error') return end
	if DoesEntityExist(vehicle) then
		startAnim("amb@code_human_police_investigate@idle_b","idle_f")
		Wait(8000)
		ClearPedTasks(ped)
		_TriggerServerEvent('be-policegps:removeitem')
		SetEntityAsMissionEntity(vehicle)
		local addVehBlip = AddBlipForEntity(vehicle)
		SetBlipSprite(addVehBlip, 42)
		SetBlipScale(addVehBlip, 0.6)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('GPS Transmitter')
		EndTextCommandSetBlipName(addVehBlip)
		PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
		QBCore.Functions.Notify('GPS tracker Placed!', 'success')
		Wait(timerRemoveBlip)
		RemoveBlip(addVehBlip)
		QBCore.Functions.Notify('GPS tracker ran out of power!', 'error')
	end
end)