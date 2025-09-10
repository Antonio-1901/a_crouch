local isCrouched = false

RegisterKeyMapping('crouch', 'Toggle Crouch', 'keyboard', 'LCONTROL')

RegisterCommand('crouch', function()
    local ped = PlayerPedId()

    RequestAnimSet("move_ped_crouched")
    while not HasAnimSetLoaded("move_ped_crouched") do
        Wait(10)
    end

    if isCrouched then
        ResetPedMovementClipset(ped, 0)
        isCrouched = false
    else
        SetPedMovementClipset(ped, "move_ped_crouched", 0.30) 
        isCrouched = true
    end
end)

CreateThread(function()
    while true do
        Wait(0)
        DisableControlAction(0, 36, true)
    end
end)


