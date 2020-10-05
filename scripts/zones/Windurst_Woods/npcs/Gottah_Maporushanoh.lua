-----------------------------------
-- Area: Windurst Woods
--  NPC: Gottah Maporushanoh
-- Working 100%
-----------------------------------
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local amazinScorpio = player:getQuestStatus(WINDURST, tpz.quest.id.windurst.THE_AMAZIN_SCORPIO)

    if amazinScorpio == QUEST_COMPLETED then
        player:startEvent(486)
    elseif amazinScorpio == QUEST_ACCEPTED then
        player:startEvent(483)
    else
        player:startEvent(420)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
