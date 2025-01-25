Config = require('shared.config')

lib.callback.register('blk-goldpanning:giveLoot', function(source)
    local src = source

    for item, itemInfo in pairs(Config.Loot) do
        local chance = math.random(1, 100)
        if chance <= itemInfo.probability then
            local amount = math.random(itemInfo.amount.min, itemInfo.amount.max)
            local hasSpace = exports.ox_inventory:CanCarryItem(src, item, amount)
            if hasSpace then
                local panData = exports.ox_inventory:GetSlotWithItem(src, Config.GoldpanItem)
                local itemData = exports.ox_inventory:Items(item)
                exports.ox_inventory:SetDurability(src, panData.slot, (panData.metadata.durability-1))
                exports.ox_inventory:AddItem(src, item, amount)
                return 'You found x'..amount..' '..itemData.label
            else
                return 'You\'re pockets are full!', '#FF0000'
            end
        end
    end

    return 'You found nothing..', '#FF0000'
end)