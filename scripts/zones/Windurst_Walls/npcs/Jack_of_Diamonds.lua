-----------------------------------
-- Area: Windurst Walls
--  NPC: Jack of Diamonds
-- Adventurer's Assistant
-- Working 100%
-------------------------------------
require("scripts/globals/settings")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, 536) then
        player:startEvent(10002, GIL_RATE*50)
    end
end

function onTrigger(player, npc)
    player:startEvent(10001, 0, 2)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 10002 then
        player:addGil(GIL_RATE*50)
        player:tradeComplete()
    end
end
