-----------------------------------
-- Area: Windurst Walls
-- Door: House of the Hero
-- Involved in Mission 2-1
-- Involved In Quest: Know One's Onions, Onion Rings, The Puppet Master, Class Reunion
-- !pos -26 -13 260 239
-----------------------------------
local ID = require("scripts/zones/Windurst_Walls/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local thePuppetMaster = player:getQuestStatus(WINDURST, tpz.quest.id.windurst.THE_PUPPET_MASTER)
    local classReunion = player:getQuestStatus(WINDURST, tpz.quest.id.windurst.CLASS_REUNION)
    local carbuncleDebacle = player:getQuestStatus(WINDURST, tpz.quest.id.windurst.CARBUNCLE_DEBACLE)

    -- Check for Missions first (priority?)
    if
        player:getCurrentMission(WINDURST) == tpz.mission.id.windurst.LOST_FOR_WORDS and
        player:getCharVar("MissionStatus") == 5
    then
        player:startEvent(337)
    else

        -- I CAN HEAR A RAINBOW
        if
            player:getQuestStatus(WINDURST, tpz.quest.id.windurst.I_CAN_HEAR_A_RAINBOW) == QUEST_AVAILABLE and
            player:getMainLvl() >= 30 and player:hasItem(1125)
        then
            player:startEvent(384, 1125, 1125, 1125, 1125, 1125, 1125, 1125, 1125)
        elseif player:getQuestStatus(WINDURST, tpz.quest.id.windurst.I_CAN_HEAR_A_RAINBOW) == QUEST_ACCEPTED then
            player:startEvent(385, 1125, 1125, 1125, 1125, 1125, 1125, 1125, 1125)

        -- THE PUPPET MASTER
        elseif
            player:getMainLvl() >= AF1_QUEST_LEVEL and
            player:getMainJob() == tpz.job.SMN and
            thePuppetMaster == QUEST_AVAILABLE and
            player:needToZone() == false and
            classReunion ~= QUEST_ACCEPTED and
            carbuncleDebacle ~= QUEST_ACCEPTED
        then -- you need to be on SMN as well to repeat the quest
            player:startEvent(402) -- Carby asks for your help, visit Juroro
        elseif
            player:getQuestStatus(WINDURST, tpz.quest.id.windurst.THE_PUPPET_MASTER) == QUEST_ACCEPTED and
            player:getCharVar("ThePuppetMasterProgress") == 1
        then
            player:startEvent(403) -- reminder to visit Juroro

        -- CLASS REUNION
        elseif
            player:getMainLvl() >= AF2_QUEST_LEVEL and
            player:getMainJob() == tpz.job.SMN and
            thePuppetMaster == QUEST_COMPLETED and
            classReunion == QUEST_AVAILABLE and
            player:needToZone() == false
        then
            player:startEvent(413) -- Carby asks for your help again.

        -- CARBUNCLE DEBACLE
        elseif
            player:getMainLvl() >= AF3_QUEST_LEVEL and
            player:getMainJob() == tpz.job.SMN and
            classReunion == QUEST_COMPLETED and
            carbuncleDebacle == QUEST_AVAILABLE and
            player:needToZone() == false
        then
            player:startEvent(415) -- Carby begs for your help
        ----------------------------------------------------
        elseif player:hasKeyItem(tpz.ki.JOKER_CARD) then
            player:startEvent(387, 0, tpz.ki.JOKER_CARD)
        elseif player:getCharVar("WildCard") == 1 then
            player:startEvent(386)
        elseif player:getCharVar("OnionRings") == 1 then
            player:startEvent(289)
        elseif player:getCharVar("KnowOnesOnions") == 1 then
            player:startEvent(288, 0, 4387)

        -- DEFAULT DIALOG
        else
            player:messageSpecial(ID.text.DOORS_SEALED_SHUT) -- "The doors are firmly sealed shut."
        end
    end

    return 1
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 288 then
        player:setCharVar("KnowOnesOnions", 2)
    elseif
        csid == 289 and
        npcUtil.completeQuest(player, WINDURST, tpz.quest.id.windurst.ONION_RINGS, {
            item = 17029,
            tpz.title.STAR_ONION_BRIGADIER,
            var = {"OnionRingsTime", "OnionRings"},
            fame = 10
        })
    then
        player:delKeyItem(tpz.ki.OLD_RING)
    elseif csid == 384 then
        player:addQuest(WINDURST, tpz.quest.id.windurst.I_CAN_HEAR_A_RAINBOW)
    elseif csid == 386 then
        player:setCharVar("WildCard", 2)
    elseif csid == 387 then
        player:delKeyItem(tpz.ki.JOKER_CARD)
        player:addGil(GIL_RATE*8000)
        player:messageSpecial(ID.text.GIL_OBTAINED, GIL_RATE*8000)
    elseif csid == 337 then
        -- Mark the progress
        player:setCharVar("MissionStatus", 6)
    elseif csid == 402 then
        if player:getQuestStatus(WINDURST, tpz.quest.id.windurst.THE_PUPPET_MASTER) == QUEST_COMPLETED then
            player:delQuest(WINDURST, tpz.quest.id.windurst.THE_PUPPET_MASTER)
            player:addQuest(WINDURST, tpz.quest.id.windurst.THE_PUPPET_MASTER) -- this needs only if you repeat this quest
        end
        player:setCharVar("ThePuppetMasterProgress", 1)
        player:addQuest(WINDURST, tpz.quest.id.windurst.THE_PUPPET_MASTER)
    elseif csid == 413 then
        player:setCharVar("ClassReunionProgress", 1)
        player:addQuest(WINDURST, tpz.quest.id.windurst.CLASS_REUNION)
        npcUtil.giveKeyItem(player, tpz.ki.CARBUNCLES_TEAR)
    elseif csid == 415 then
        player:addQuest(WINDURST, tpz.quest.id.windurst.CARBUNCLE_DEBACLE)
        player:setCharVar("CarbuncleDebacleProgress", 1)
    end
end
