-----------------------------------
-- Area: Windurst Walls
--  Location: X:-90  Y:-9  Z:109
--  NPC: Kalupa-Tawalupa
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
        player:startEvent(66) -- Before honey given to Zayhi: "are you alright sir"
    elseif
        ToBee == QUEST_ACCEPTED and
        ToBeeOrNotStatus > 0
    then
        player:startEvent(72) -- After some honey was given to Zayhi: "hey did that honey help you just now?"
    elseif
        ToBee == QUEST_COMPLETED
        and player:needToZone()
    then
        player:startEvent(77) -- Before zone: "well I guess a tooth ache is to be expected"

    -- DEFAULT DIALOG
    else
        player:startEvent(298)
    end
end

-- CS/Event ID List for NPC (MISSING)
-- *CS 443 - player:startEvent(443) -- Long Star Sybil CS
function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
