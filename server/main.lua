ESX = nil

TriggerEvent("esx:getSharedObject", function(response)
    ESX = response
end)

RegisterServerEvent('esx_scavenge:getItem')
AddEventHandler('esx_scavenge:getItem', function()

    local luck = math.random(1, 1000)

    if luck <= 120 then

        local items = { -- add whatever items you want here
            'scrapmetal'
        }

        local player = ESX.GetPlayerFromId(source)
        local randomItems = items[math.random(#items)]
        local quantity = 1 --math.random(#items)
        local itemfound = ESX.GetItemLabel(randomItems)

        player.addInventoryItem(randomItems, quantity)
        sendNotification(source, 'You Found ' .. quantity .. ' ' .. itemfound, 'success', 2500)

    elseif luck > 350 and luck <= 390 then

        local items = { -- add whatever items you want here
			'engine1',
        }

        local player = ESX.GetPlayerFromId(source)
        local randomItems = items[math.random(#items)]
        local quantity = 1 --math.random(#items)
        local itemfound = ESX.GetItemLabel(randomItems)

        player.addInventoryItem(randomItems, quantity)
        sendNotification(source, 'You Found ' .. quantity .. ' ' .. itemfound, 'success', 2500)
		
	elseif luck > 475 and luck <= 525 then

        local items = { -- add whatever items you want here
            'trans1',
			'suspens1',
        }

        local player = ESX.GetPlayerFromId(source)
        local randomItems = items[math.random(#items)]
        local quantity = 1 --math.random(#items)
        local itemfound = ESX.GetItemLabel(randomItems)

        player.addInventoryItem(randomItems, quantity)
        sendNotification(source, 'You Found ' .. quantity .. ' ' .. itemfound, 'success', 2500)	

	elseif luck > 575 and luck <= 600 then

        local items = { -- add whatever items you want here
            'turbo1',
        }

        local player = ESX.GetPlayerFromId(source)
        local randomItems = items[math.random(#items)]
        local quantity = 1 --math.random(#items)
        local itemfound = ESX.GetItemLabel(randomItems)

        player.addInventoryItem(randomItems, quantity)
        sendNotification(source, 'You Found ' .. quantity .. ' ' .. itemfound, 'success', 2500)		

	elseif luck > 625 and luck <= 630 then

        local items = { -- add whatever items you want here
            'junkcar1',
        }

        local player = ESX.GetPlayerFromId(source)
        local randomItems = items[math.random(#items)]
        local quantity = 1 --math.random(#items)
        local itemfound = ESX.GetItemLabel(randomItems)

        player.addInventoryItem(randomItems, quantity)
        sendNotification(source, 'You Found A Rare junk car!! good luck restoring it', 'success', 2500)	

	elseif luck > 650 and luck <= 720 then

        local items = { -- add whatever items you want here
            'scrapmetal',
        }

        local player = ESX.GetPlayerFromId(source)
        local randomItems = items[math.random(#items)]
        local quantity = 1 --math.random(#items)
        local itemfound = ESX.GetItemLabel(randomItems)

        player.addInventoryItem(randomItems, quantity)
        sendNotification(source, 'You Found ' .. quantity .. ' ' .. itemfound, 'success', 2500)		
		
    else
        sendNotification(source, 'You find nothing of value', 'error', 2000)		
    end
end)