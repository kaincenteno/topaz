-----------------------------------
-- Area: Windurst Walls
--  Location: X:-92  Y:-9  Z:107
--  NPC: Rutango-Botango
-- Working 100%
--  Involved in Quest: To Bee or Not to Bee?
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local ToBee = player:getQuestStatus(WINDURST, tpz.quest.id.windurst.TO_BEE_OR_NOT_TO_BEE)
    local ToBeeOrNotStatus = player:getCharVar("ToBeeOrNot_var")

    -- TO BEE OR NOT TO BEE
    if ToBeeOrNotStatus == 10 then
        player:startEvent(65) -- During Too Bee quest before honey given to Zayhi:  "Oh Crumb...lost his voice"
    elseif
        ToBee == QUEST_ACCEPTED and
        ToBeeOrNotStatus > 0
    then
        player:startEvent(71) -- During Too Bee quest after some honey was given to Zayhi: "lap up more honey"
    elseif
        ToBee == QUEST_COMPLETED and
        player:needToZone()
    then
        player:startEvent(76) -- After Too Bee quest but before zone: "master let me speak for you"
    else

    -- DEFAULT DIALOG
        player:startEvent(297)
    end
end

-- CS/Event ID List for NPC
-- *Rutango-Botango    CS 443 - player:startEvent(443) -- Long Star Sybil CS
function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
