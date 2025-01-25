Config = require('shared.config')
local inZone = false

function useGoldPan()
    if IsEntityInWater(PlayerPedId()) and inZone then
        if lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
                move = true
            },
            anim = {
                flag = 8,
                duration = -1,
                dict = 'amb@world_human_bum_wash@male@low@idle_a',
                clip = 'idle_c'
            },
            prop = {
                model = `v_res_bowl_dec`,
                bone = 57005,
                pos = vec3(0.09, 0.03, -0.02),
                rot = vec3(-20.0, 5.0, 20.0)
            },
        }) then
            local noti, col = lib.callback.await('blk-goldpanning:giveLoot', false)
            if noti then
                lib.notify({
                    title = 'Gold Panning',
                    description = noti,
                    showDuration = false,
                    position = 'top-right',
                    style = {
                        backgroundColor = '#141517',
                        color = '#C1C2C5',
                        ['.description'] = {
                          color = '#909296'
                        }
                    },
                    icon = 'hand-holding-dollar',
                    iconColor = col or '#FFD700'
                })
            end
        end
    else
        lib.notify({
            title = 'Gold Panning',
            description = 'You can\'t pan for Gold here..',
            showDuration = false,
            position = 'top-right',
            style = {
                backgroundColor = '#141517',
                color = '#C1C2C5',
                ['.description'] = {
                  color = '#909296'
                }
            },
            icon = 'hand-holding-dollar',
            iconColor = '#FF0000'
        })
    end
end
exports('useGoldPan', useGoldPan)

function CreateZones()
    for k, v in pairs(Config.Zones) do
        lib.zones.poly({
            points = v.points,
            thickness = v.thickness,
            debug = false,
            onEnter = function()
                inZone = true
            end,
            onExit = function()
                inZone = false
            end
        })
        
    end
end

function CreateBlips()
	for _, v in pairs(Config.Blips) do
        local blip = AddBlipForCoord(v.coords)
        SetBlipSprite(blip, v.sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, v.color)
        SetBlipAlpha(blip, 0.7)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(v.label)
        EndTextCommandSetBlipName(blip)
    end
end

AddEventHandler('playerSpawned', function()
    CreateBlips()
    CreateZones()
end)