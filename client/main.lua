ESX        = nil
--percent    = false
searching  = false
--cachedBins = {}
--[[closestBin = {
    'prop_rub_carwreck14',
    'prop_rub_carwreck15',
    'prop_rub_carwreck9',
    'prop_rub_carwreck7',
	'prop_rub_carwreck3',
    'prop_rub_carwreck2'
}]]
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(5)

		TriggerEvent("esx:getSharedObject", function(library)
			ESX = library
		end)
    end

    if ESX.IsPlayerLoaded() then
		ESX.PlayerData = ESX.GetPlayerData()
	end
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(response)
	ESX.PlayerData = response
end)


--------
--
--
--------

AddEventHandler('esx_scavenge:hasEnteredMarker', function(zone)

	CurrentAction     = 'machine_menu'
	--CurrentActionMsg  = _U('press_context')
	CurrentActionData = {zone = zone}
end)

AddEventHandler('esx_scavenge:hasExitedMarker', function(zone)

	CurrentAction = nil
	ESX.UI.Menu.CloseAll()

end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			for i = 1, #v.Pos, 1 do
				if(GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < Config.Size.x) then
					isInMarker  = true
					currentZone = k
					LastZone    = k
				end
			end
		end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('esx_scavenge:hasEnteredMarker', currentZone)
		end
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_scavenge:hasExitedMarker', LastZone)
		end
	end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(10)
    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString("Press ~g~E~s~ to scavenge for parts")
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlJustReleased(0, 38) then
		print "first press"

        if CurrentAction == 'machine_menu' then
		openBin(entity)
        end
		
        CurrentAction = nil
      end
    end
  end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if searching then
            DisableControlAction(0, 73) 
        end
    end
end)