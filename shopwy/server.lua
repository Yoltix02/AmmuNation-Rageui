ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



function CheckLicense(source, type, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    MySQL.Async.fetchAll('SELECT COUNT(*) as count FROM user_licenses WHERE type = @type AND owner = @owner', {
        ['@type']  = type,
        ['@owner'] = identifier
    }, function(result)
        if tonumber(result[1].count) > 0 then
            cb(true)
        else
            cb(false)
        end

    end)
end

ESX.RegisterServerCallback('e_weaponshop:checkLicense', function(source, cb, type)
    CheckLicense(source, 'weapon', cb)
end)



RegisterServerEvent('Eweapon:addppa')
AddEventHandler('Eweapon:addppa', function(weapon)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerMoney = xPlayer.getMoney()

    if playerMoney >= 1 then
    MySQL.Async.execute('INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)', {
        ['@type'] = weapon,
        ['@owner'] = xPlayer.identifier
    })
    xPlayer.removeMoney(1)
    TriggerClientEvent('esx:showNotification', source, "~g~Purchase successful!")
    else
        TriggerClientEvent('esx:showNotification', source, "~r~You do not have enough money!")
    end
end)


RegisterNetEvent('yoltix_shop:acheterbat')
AddEventHandler('yoltix_shop:acheterbat', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 5000 then
		xPlayer.addWeapon('WEAPON_BAT', 1)
		xPlayer.removeMoney(5000)
		TriggerClientEvent('esx:showNotification', source, "You received a ~g~Basseball bat ~s~! ")
	else
		TriggerClientEvent('esx:showNotification', source, "You do not have enough money!")	
	end	
end)




RegisterNetEvent('yoltix_shop:achetercranda')
AddEventHandler('yoltix_shop:achetercranda', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 3000 then
		xPlayer.addWeapon('WEAPON_SWITCHBLADE', 1)
		xPlayer.removeMoney(3000)
		TriggerClientEvent('esx:showNotification', source, "You received a ~g~Switchblade knife ~s~! ")
	else
		TriggerClientEvent('esx:showNotification', source, "You do not have enough money!")	
	end	
end)



RegisterNetEvent('yoltix_shop:achetercouteau')
AddEventHandler('yoltix_shop:achetercouteau', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 2000 then
		xPlayer.addWeapon('WEAPON_KNIFE', 1)
		xPlayer.removeMoney(2000)
		TriggerClientEvent('esx:showNotification', source, "You received a ~g~Knife ~s~! ")
	else
		TriggerClientEvent('esx:showNotification', source, "You do not have enough money!")	
	end	
end)



RegisterNetEvent('yoltix_shop:achetermachette')
AddEventHandler('yoltix_shop:achetermachette', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 5000 then
		xPlayer.addWeapon('WEAPON_MACHETE', 1)
		xPlayer.removeMoney(5000)
		TriggerClientEvent('esx:showNotification', source, "You received a ~g~Machete ~s~! ")
	else
		TriggerClientEvent('esx:showNotification', source, "You do not have enough money!")	
	end	
end)


RegisterNetEvent('yoltix_shop:achetermhaccte')
AddEventHandler('yoltix_shop:achetermachette', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 6000 then
		xPlayer.addWeapon('WEAPON_HATCHET', 1)
		xPlayer.removeMoney(6000)
		TriggerClientEvent('esx:showNotification', source, "You received a ~g~Axe ~s~! ")
	else
		TriggerClientEvent('esx:showNotification', source, "You do not have enough money!")	
	end	
end)


RegisterNetEvent('yoltix_shop:achetermarteau')
AddEventHandler('yoltix_shop:achetermarteau', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 1000 then
		xPlayer.addWeapon('WEAPON_HAMMER', 1)
		xPlayer.removeMoney(1000)
		TriggerClientEvent('esx:showNotification', source, "You received a ~g~Hammer ~s~! ")
	else
		TriggerClientEvent('esx:showNotification', source, "You do not have enough money!")	
	end	
end)




RegisterNetEvent('yoltix_shop:achetertorche')
AddEventHandler('yoltix_shop:achetertorche', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 2000 then
		xPlayer.addWeapon('WEAPON_FLASHLIGHT', 1)
		xPlayer.removeMoney(2000)
		TriggerClientEvent('esx:showNotification', source, "You received a ~g~Flash light ~s~! ")
	else
		TriggerClientEvent('esx:showNotification', source, "You do not have enough money!!")	
	end	
end)


RegisterNetEvent('yoltix_shop:acheterpistolet')
AddEventHandler('yoltix_shop:acheterpistolet', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 200000 then
		xPlayer.addWeapon('WEAPON_PISTOL', 1)
		xPlayer.removeMoney(200000)
		TriggerClientEvent('esx:showNotification', source, "You received a ~g~Pistol ~s~! ")
	else
		TriggerClientEvent('esx:showNotification', source, "You do not have enough money!")	
	end	
end)


RegisterNetEvent('yoltix_shop:acheterpistoletperf')
AddEventHandler('yoltix_shop:acheterpistoletperf', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 400000 then
		xPlayer.addWeapon('WEAPON_APPISTOL', 1)
		xPlayer.removeMoney(400000)
		TriggerClientEvent('esx:showNotification', source, "You received a ~g~AP pistol ~s~! ")
	else
		TriggerClientEvent('esx:showNotification', source, "You do not have enough money!")	
	end	
end)


RegisterNetEvent('yoltix_shop:acheterrevolver')
AddEventHandler('yoltix_shop:acheterrevolver', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 700000 then
		xPlayer.addWeapon('WEAPON_HEAVYPISTOL', 1)
		xPlayer.removeMoney(700000)
		TriggerClientEvent('esx:showNotification', source, "You received a ~g~Heavy pistol ~s~! ")
	else
		TriggerClientEvent('esx:showNotification', source, "You do not have enough money!")	
	end	
end)


RegisterNetEvent('yoltix_shop:acheterchargeur')
AddEventHandler('yoltix_shop:acheterchargeur', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 300 then
		xPlayer.addInventoryItem('clip', 1)
		xPlayer.removeMoney(300)
		TriggerClientEvent('esx:showNotification', source, "You received a ~g~Loading mag~s~! ")
	else
		TriggerClientEvent('esx:showNotification', source, "You do not have enough money!")	
	end	
end)



RegisterNetEvent('yoltix_shop:achetersilenc')
AddEventHandler('yoltix_shop:achetersilenc', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 2000 then
		xPlayer.addInventoryItem('silencieux', 1)
		xPlayer.removeMoney(2000)
		TriggerClientEvent('esx:showNotification', source, "You received a ~g~Silencer~s~! ")
	else
		TriggerClientEvent('esx:showNotification', source, "You do not have enough money!")	
	end	
end)


RegisterNetEvent('yoltix_shop:acheterlampe')
AddEventHandler('yoltix_shop:acheterlampe', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 2000 then
		xPlayer.addInventoryItem('flashlight', 1)
		xPlayer.removeMoney(2000)
		TriggerClientEvent('esx:showNotification', source, "You received a ~g~Flash light~s~! ")
	else
		TriggerClientEvent('esx:showNotification', source, "You do not have enough money!")	
	end	
end)



RegisterNetEvent('yoltix_shop:acheterskin')
AddEventHandler('yoltix_shop:acheterskin', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 7000 then
		xPlayer.addInventoryItem('yusuf', 1)
		xPlayer.removeMoney(7000)
		TriggerClientEvent('esx:showNotification', source, "You received a ~g~Skin~s~! ")
	else
		TriggerClientEvent('esx:showNotification', source, "You do not have enough money!")	
	end	
end)


RegisterNetEvent('yoltix_shop:acheterpetoir')
AddEventHandler('yoltix_shop:acheterpetoir', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 150000 then
		xPlayer.addWeapon('WEAPON_SNSPISTOL', 25)
		xPlayer.removeMoney(150000)
		TriggerClientEvent('esx:showNotification', source, "You received a ~g~SNS Pistol ~s~! ")
	else
		TriggerClientEvent('esx:showNotification', source, "You do not have enough money!")	
	end	
end)
