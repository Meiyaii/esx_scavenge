drawText3D = function(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
  
	local scale = 0.45
   
	if onScreen then
		SetTextScale(scale, scale)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x, _y + 0.0150, 0.030 + factor , 0.030, 66, 66, 66, 150)
	end
end

showPercent = function(time)
	percent = true
	TimeLeft = 0
	
	TriggerEvent('mythic_progbar:client:progress', {
        name = 'scavange_parts',
        duration = 26000,
        label = 'Scavenging for parts...',
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
    }, function(status)
        if not status then
        end
    end)
	
	repeat
	TimeLeft = TimeLeft + 1
	Citizen.Wait(time)
	until(TimeLeft == 250)
	percent = false
end

openBin = function(entity)
	searching = true
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
	showPercent(100)
    --cachedBins[entity] = true
    TriggerServerEvent('esx_scavenge:getItem')
	ClearPedTasks(PlayerPedId())
	searching = false
end

sendNotification = function(message, messageType, messageTimeout)
	TriggerEvent("pNotify:SendNotification", {
		text = message,
		type = messageType,
		queue = "bazookan",
		timeout = messageTimeout,
		layout = "bottomCenter"
	})
end