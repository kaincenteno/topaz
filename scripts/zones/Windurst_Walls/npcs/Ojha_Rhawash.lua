-----------------------------------
-- Area: Windurst Walls
--  NPC: Ojha Rhawash
-- Starts and Finishes Quest: Flower Child
-- !pos -209 0 -134 239
-----------------------------------
local ID = require("scripts/zones/Windurst_Walls/IDs")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
local flowerChild = player:getQuestStatus(WINDURST, tpz.quest.id.windurst.FLOWER_CHILD)

    if npcUtil.tradeHasExactly(trade, 956) then -- Lilac
        if flowerChild == QUEST_COMPLETED then
            player:startEvent(10000, 0, 239, 4)
        else
            player:startEvent(10000, 0, 239, 2)
        end
    elseif
        npcUtil.tradeHasExactly(trade, 957) or      -- Amaryllis
        npcUtil.tradeHasExactly(trade, 2554) or     -- Asphodel
        npcUtil.tradeHasExactly(trade, 948) or      -- Carnation
        npcUtil.tradeHasExactly(trade, 1120) or     -- Casablanca
        npcUtil.tradeHasExactly(trade, 1413) or     -- Cattleya
        npcUtil.tradeHasExactly(trade, 636) or      -- Chamomile
        npcUtil.tradeHasExactly(trade, 959) or      -- Dahlia
        npcUtil.tradeHasExactly(trade, 835) or      -- Flax Flower
        npcUtil.tradeHasExactly(trade, 2507) or     -- Lycopodium Flower
        npcUtil.tradeHasExactly(trade, 958) or      -- Marguerite
        npcUtil.tradeHasExactly(trade, 1412) or     -- Olive Flower
        npcUtil.tradeHasExactly(trade, 938) or      -- Papaka Grass
        npcUtil.tradeHasExactly(trade, 1411) or     -- Phalaenopsis
        npcUtil.tradeHasExactly(trade, 949) or      -- Rain Lily
        npcUtil.tradeHasExactly(trade, 941) or      -- Red Rose
        npcUtil.tradeHasExactly(trade, 1725) or     -- Snow Lily
        npcUtil.tradeHasExactly(trade, 1410) or     -- Sweet William
        npcUtil.tradeHasExactly(trade, 950)  or     -- Tahrongi Cactus
        npcUtil.tradeHasExactly(trade, 2960) or     -- Water Lily
        npcUtil.tradeHasExactly(trade, 951)         -- Wijnruit
    then
        if flowerChild == QUEST_COMPLETED then
            player:startEvent(10000, 0, 239, 5)
        elseif flowerChild == QUEST_ACCEPTED then
            player:startEvent(10000, 0, 239, 3)
        else
            player:startEvent(10000, 0, 239, 1)
        end
    else
        player:startEvent(10000, 0, 239, 0)
    end
end

function onTrigger(player, npc)
    player:startEvent(10000, 0, 239, 10)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 10000 then
        player:tradeComplete()
        if option == 3002 then
            npcUtil.completeQuest(player, WINDURST, tpz.quest.id.windurst.FLOWER_CHILD, {fame = 120})
            player:moghouseFlag(4)
            player:messageSpecial(ID.text.MOGHOUSE_EXIT)
        elseif option == 1 then
            player:addQuest(WINDURST, tpz.quest.id.windurst.FLOWER_CHILD)
        end
    end
end
