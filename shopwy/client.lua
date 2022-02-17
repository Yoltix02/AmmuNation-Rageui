ESX = nil

RegisterCommand("co", function(source, args, rawcommand)
    local pos = GetEntityCoords(PlayerPedId())
    print(pos.x..", "..pos.y..", "..pos.z)
end, false)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)


ConfHs0              = {}
ConfHs0.DrawDistance = 100
ConfHs0.Size         = {x = 0.5, y = 0.5, z = 0.5}
ConfHs0.Color        = {r = 87, g = 180, b = 14}
ConfHs0.Type         = 2

local position = {
    { x = -662.180,   y = -934.961,   z = 21.829 },
    { x = 810.25,     y = -2157.60,   z = 29.62 },
    { x = 1693.44,    y = 3760.16,    z = 34.71 },
    { x = -330.24,    y = 6083.88,    z = 31.45 },
    { x = 252.63,     y = -50.00,     z = 69.94 },
    { x = 22.09,      y = -1107.28,   z = 29.80 },
    { x = 2567.69,    y = 294.38,     z = 108.73 },
    { x = -1117.58,   y = 2698.61,    z = 18.55 },
    { x = 842.44,     y = -1033.42,   z = 28.19 },      
}  

Citizen.CreateThread(function()
     for k in pairs(position) do
        local blip = AddBlipForCoord(position[k].x, position[k].y, position[k].z)
        SetBlipSprite(blip, 567)
        SetBlipColour(blip, 1)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Ammu-Nation")
        EndTextCommandSetBlipName(blip)
    end
end)

ppa = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords, letSleep = GetEntityCoords(PlayerPedId()), true

        for k in pairs(position) do
            if (ConfHs0.Type ~= -1 and GetDistanceBetweenCoords(coords, position[k].x, position[k].y, position[k].z, true) < ConfHs0.DrawDistance) then
                DrawMarker(ConfHs0.Type, position[k].x, position[k].y, position[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, ConfHs0.Size.x, ConfHs0.Size.y, ConfHs0.Size.z, ConfHs0.Color.r, ConfHs0.Color.g, ConfHs0.Color.b, 100, false, true, 2, false, false, false, false)
                letSleep = false
            end
        end

        if letSleep then
            Citizen.Wait(500)
        end
    end
end)

RMenu.Add('yoltix_shop', 'main', RageUI.CreateMenu("~b~SHOP BY YOLTIX ~h~", "~b~Come buy guns.~h~"))
RMenu.Add('yoltix_shop', 'armblanche', RageUI.CreateSubMenu(RMenu:Get('yoltix_shop', 'main'), "Cold steel", "Vente ~y~Cold steel"))
RMenu:Get('yoltix_shop', 'main'):SetRectangleBanner(138, 0, 0, 138)
RMenu.Add('yoltix_shop', 'accesoire', RageUI.CreateSubMenu(RMenu:Get('yoltix_shop', 'main'), "Accessories", "Vente  ~y~Accessories"))
RMenu.Add('yoltix_shop', 'armfeux', RageUI.CreateSubMenu(RMenu:Get('yoltix_shop', 'main'), "Guns", "Vente ~y~Guns"))


Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('yoltix_shop', 'main'), true, true, true, function()

            ESX.TriggerServerCallback('e_weaponshop:checkLicense', function(cb)
                if cb then
                    ppa = true 
                    else 
                     ppa = false
                end
              end)
            if ppa then
                --print("test")
            else
                RageUI.Button("Buy a license", nil, {RightLabel = "~y~100000$"},true, function(Hovered, Active, Selected)
                    if (Selected) then
                        local prix = 50000
                        TriggerServerEvent('Eweapon:addppa', 'weapon')
                        RageUI.GoBack()
                    end
                    end)
            end


            RageUI.Button("Our cold steel", "~b~Cold steel ~w~", { RightLabel = "~y~→" },true, function()
            end, RMenu:Get('yoltix_shop', 'armblanche'))
            RageUI.Button("Our Accessories", "~b~Accessories~w~", { RightLabel = "~y~→" },true, function()
            end, RMenu:Get('yoltix_shop', 'accesoire'))

            ESX.TriggerServerCallback('e_weaponshop:checkLicense', function(cb)
                if cb then
                    ppa = true 
                    else 
                     ppa = false
                end
              end)

            if ppa then 
                RageUI.Button("Guns", "~b~To acces the gun menu.", { RightLabel = "~y~→" }, true, function(Hovered, Active, Selected)     
                  if (Selected) then
                
                  end
                end, RMenu:Get('yoltix_shop', 'armfeux')) 
                
                else 
  
                  RageUI.Button("Guns", "To acces the gun menu.", { RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)     
                      if (Selected) then
                      end
                    end) 
  
                  end
        end, function()
        end)


        RageUI.IsVisible(RMenu:Get('yoltix_shop', 'armblanche'), true, true, true, function()
            RageUI.Button("~y~Basseball bat", nil, {RightLabel = "~b~5000$"},true, function(Hovered, Active, Selected)
                if Active then
                    RenderSprite("RageUI", "Baseball-bat", 0, 565, 535, 290, 100)
                end
                if (Selected) then   
                    TriggerServerEvent('yoltix_shop:acheterbat')
                end
                end)

            RageUI.Button("~y~Switchblade knife", nil, {RightLabel = "~b~3000$"},true, function(Hovered, Active, Selected)
                if Active then
                    RenderSprite("RageUI", "cac-cran-arret", 0, 565, 535, 290, 100)
                end
                if (Selected) then   
                    TriggerServerEvent('yoltix_shop:achetercranda')
                end
                end)

            RageUI.Button("~y~Knife", nil, {RightLabel = "~b~2000$"},true, function(Hovered, Active, Selected)
                if Active then
                    RenderSprite("RageUI", "Couteau_GTA_V", 0, 565, 535, 290, 100)
                end
                if (Selected) then
                    TriggerServerEvent('yoltix_shop:achetercouteau')
                end
                end)

            RageUI.Button("~y~Machete", nil, {RightLabel = "~b~5000$"},true, function(Hovered, Active, Selected)
                if Active then
                    RenderSprite("RageUI", "cac-machette", 0, 565, 535, 290, 100)
                end 
                if (Selected) then
                    TriggerServerEvent('yoltix_shop:achetermachette')
                end
                end)

            RageUI.Button("~y~Axe", nil, {RightLabel = "~b~6000$"},true, function(Hovered, Active, Selected)
                if Active then
                    RenderSprite("RageUI", "cac-hachette", 0, 565, 535, 290, 100)
                end 
                if (Selected) then
                    TriggerServerEvent('yoltix_shop:achetermhaccte')
                end
                end)


            RageUI.Button("~y~Hammer", nil, {RightLabel = "~b~1000$"},true, function(Hovered, Active, Selected)
                if Active then
                    RenderSprite("RageUI", "cac-marteau", 0, 565, 535, 290, 100)
                end 
                if (Selected) then
                    TriggerServerEvent('yoltix_shop:achetermarteau')
                end
                end)

            RageUI.Button("~y~Flashlight", nil, {RightLabel = "~b~2000$"},true, function(Hovered, Active, Selected)
                if Active then
                    RenderSprite("RageUI", "cac-lampe-de-poche", 0, 565, 535, 290, 100)
                end 
                if (Selected) then
                    TriggerServerEvent('yoltix_shop:achetertorche')
                end
                end)               



        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('yoltix_shop', 'armfeux'), true, true, true, function()
            RageUI.Button("~y~SNS pistol", nil, {RightLabel = "~b~150 000$"},true, function(Hovered, Active, Selected)
                if Active then
                    RenderSprite("RageUI", "pi-petoire", 0, 565, 535, 290, 100)
                end
                if (Selected) then
                    TriggerServerEvent('yoltix_shop:acheterpetoir')
                end
                end)


            RageUI.Button("~y~Pistol", nil, {RightLabel = "~b~200 000$"},true, function(Hovered, Active, Selected)
                if Active then
                    RenderSprite("RageUI", "pi-pistolet", 0, 565, 535, 290, 100)
                end
                if (Selected) then
                    TriggerServerEvent('yoltix_shop:acheterpistolet')
                end
                end)


            RageUI.Button("~y~AP Pistol", nil, {RightLabel = "~b~400 000$"},true, function(Hovered, Active, Selected)
                if Active then
                    RenderSprite("RageUI", "pi-pistolet-perforant", 0, 565, 535, 290, 100)
                end
                if (Selected) then
                    TriggerServerEvent('yoltix_shop:acheterpistoletperf')
                end
                end)
                
            RageUI.Button("~y~Heavy pistol", nil, {RightLabel = "~b~700 000$"},true, function(Hovered, Active, Selected)
                if Active then
                    RenderSprite("RageUI", "pi-revolver-lourd", 0, 565, 535, 290, 100)
                end
                if (Selected) then
                    TriggerServerEvent('yoltix_shop:acheterrevolver')
                end
                end)                   


        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('yoltix_shop', 'accesoire'), true, true, true, function()
            RageUI.Button("~y~Loading mag", nil, {RightLabel = "~b~300$"},true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('yoltix_shop:acheterchargeur')
                end
                end)


        RageUI.Button("~y~Silencer", nil, {RightLabel = "~b~2000$"},true, function(Hovered, Active, Selected)
            if (Selected) then
                TriggerServerEvent('yoltix_shop:achetersilenc')
            end
            end)    
    
        RageUI.Button("~y~A lamp", nil, {RightLabel = "~b~500$"},true, function(Hovered, Active, Selected)
            if (Selected) then
                TriggerServerEvent('yoltix_shop:acheterlampe')
            end
            end)    



        end, function()
        end)


        Citizen.Wait(0)
    end
end)




Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
    
            for k in pairs(position) do
    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
    
                if dist <= 1.0 then
                    RageUI.Text({
                        message = "Press [~b~E~w~] to talk to ~r~Josh",
                        time_display = 1
                    })

                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('yoltix_shop', 'main'), not RageUI.Visible(RMenu:Get('yoltix_shop', 'main')))
                    end   
                end
            end
        end
    end)





    Citizen.CreateThread(function()
    
        for _,v in pairs(position) do
          RequestModel(GetHashKey(v["mp_m_shopkeep_01"]))
          while not HasModelLoaded(GetHashKey(v["mp_m_shopkeep_01"])) do
            Wait(1)
          end
      
          RequestAnimDict("mini@strip_club@idles@bouncer@base")
          while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
            Wait(1)
          end
          ped =  CreatePed("PED_TYPE_CIVMALE", "s_m_y_cop_01", v[6],v[1],v[2],v[3], 3374176, false, true)
          SetEntityHeading(ped, v[5])
          FreezeEntityPosition(ped, true)
          SetEntityInvincible(ped, true)
          SetBlockingOfNonTemporaryEvents(ped, true)
          TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
        end
    end)

    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(100)
        end
    end)

    Citizen.CreateThread(function()
        local hash = GetHashKey("cs_joeminuteman")
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
        end
        ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_joeminuteman", 22.45, -1105.41, 28.8, 153.96, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end)
    
    Citizen.CreateThread(function()
        local hash = GetHashKey("cs_joeminuteman")
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
        end
        ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_joeminuteman", 254.09, -50.25, 68.94, 69.63, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end)
    
    Citizen.CreateThread(function()
        local hash = GetHashKey("cs_joeminuteman")
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
        end
        ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_joeminuteman", -1303.96, -394.37, 35.69, 75.61, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end)
    
    Citizen.CreateThread(function()
        local hash = GetHashKey("cs_joeminuteman")
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
        end
        ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_joeminuteman", -662.52, -933.41, 20.82, 179.28, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end)
    
    Citizen.CreateThread(function()
        local hash = GetHashKey("cs_joeminuteman")
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
        end
        ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_joeminuteman", 810.52, -2159.22, 28.61, 359.36, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end)
    
    Citizen.CreateThread(function()
        local hash = GetHashKey("cs_joeminuteman")
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
        end
        ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_joeminuteman", 842.73, -1035.50, 27.19, 359.24, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end)
    
    Citizen.CreateThread(function()
        local hash = GetHashKey("cs_joeminuteman")
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
        end
        ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_joeminuteman", 1691.88, 3760.88, 33.70, 224.45, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end)
    
    Citizen.CreateThread(function()
        local hash = GetHashKey("cs_joeminuteman")
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
        end
        ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_joeminuteman", -331.80, 6084.97, 30.45, 226.11, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end)
    
    Citizen.CreateThread(function()
        local hash = GetHashKey("cs_joeminuteman")
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
        end
        ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_joeminuteman", -1119.13, 2699.72, 17.55, 221.05, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end)
    
    Citizen.CreateThread(function()
        local hash = GetHashKey("cs_joeminuteman")
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
        end
        ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_joeminuteman", 2568.06, 292.44, 107.73, 1.88, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end)




