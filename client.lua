--notify function
function notify(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end 

Ispressed=false 

--key press thread
Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)  --needed just not to crash game
        player = GetPlayerPed(-1)
        IsInVehicle=GetVehiclePedIsIn(player,false)
        IsEnteringVehicle=GetVehiclePedIsEntering(player)

        if IsControlJustPressed(1,Config.RagdollKey) then 
            IsPressed=true

            if IsEnteringVehicle~=0 then
                IsPressed=false 
            end

            if IsInVehicle~=0 then
                IsPressed=false 
            end
        end

        if IsPressed then
            SetPedToRagdoll(player, 1000, 1000, 0, true, true, true)
            DisableControlAction(0,24,true)    --disables mouse left button to prevent shooting
            notify("Bayıldın kalkmak için ~INPUT_PICKUP~ tuşuna bas.")  --message to user            
        end

        if IsControlJustPressed(1,Config.StopRagdollKey) then 
            IsPressed=false
            Wait(2500)
        end
    end
end)