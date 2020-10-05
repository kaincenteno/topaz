-----------------------------------
-- Area: Windurst_Woods
--  NPC: Bin Stejihna
-- Only sells when Windurst controlls Zulkheim Region
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/shop")
require("scripts/globals/zone")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local RegionOwner = GetRegionOwner(tpz.region.ZULKHEIM)
    local rank = getNationRank(tpz.nation.WINDURST)
    local stock =
    {
        622,     44,  -- Dried Marjoram
        4372,    44,  -- Giant Sheep Meat
        4366,    22,  -- La Theine Cabbage
        611,     36,  -- Rye Flour
        610,     55,  -- San d'Orian Flour
        4378,    55   -- Selbina Milk
    }

    if RegionOwner ~= tpz.nation.WINDURST then
        player:showText(npc, ID.text.BIN_STEJIHNA_CLOSED_DIALOG)
    else
        if rank ~= 3 then
            table.insert(stock, 1840) --Semolina
            table.insert(stock, 1840)
        end
        player:showText(npc, ID.text.BIN_STEJIHNA_OPEN_DIALOG)
        tpz.shop.general(player, stock, WINDURST)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
