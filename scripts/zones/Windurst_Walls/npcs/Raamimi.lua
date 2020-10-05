-----------------------------------
-- Area: Windurst Walls
--  Location: X:-81  Y:-9  Z:103
--  NPC: Raamimi
-- Working 100%
--  Involved in Quest: To Bee or Not to Bee?
-----------------------------------
local ID = require("scripts/zones/Windurst_Walls/IDs")
require("scripts/globals/settings")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local ToBee = player:getQuestStatus(WINDURST, tpz.quest.id.windurst.TO_BEE_OR_NOT_TO_BEE)
    local ToBeeOrNotStatus = player:getCharVar("ToBeeOrNot_var")

    -- TO BEE OR NOT TO BEE
    if
        ToBeeOrNotStatus == 10 and
        ToBee == QUEST_AVAILABLE
    then
        player:startEvent(67) -- Quest Started - He gives you honey
    elseif ToBee == QUEST_ACCEPTED then
        player:startEvent(68) -- After honey is given to player...... but before 5th hondy is given to Zayhi
    elseif
        ToBee == QUEST_COMPLETED and
        ToBeeOrNotStatus == 5
    then
        player:startEvent(80) -- Quest Finish - Gives Mulsum
    elseif
        ToBee == QUEST_COMPLETED and
        ToBeeOrNotStatus == 0 and
        player:needToZone()
    then
        player:startEvent(79) -- After Quest but before zoning "it's certainly gotten quiet around here..."

    -- DEFAULT DIALOG
    else
        player:startEvent(296)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if
        csid == 67 and
        npcUtil.giveItem(player, 4370)
    then
        player:addQuest(WINDURST, tpz.quest.id.windurst.TO_BEE_OR_NOT_TO_BEE)
    elseif
        csid == 80 and
        npcUtil.giveItem(player, {{4156, 3}})
    then -- After Honey#5: ToBee quest Finish
        player:setCharVar("ToBeeOrNot_var", 0)
        player:needToZone(true)
    end
end
