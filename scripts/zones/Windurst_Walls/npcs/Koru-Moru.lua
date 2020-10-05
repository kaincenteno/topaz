-----------------------------------
-- Area: Windurst Walls
--  NPC: Koru-Moru
-- Starts & Ends Quest: Star Struck
-- Involved in Quest: Making the Grade, Riding on the Clouds
-- !pos -120 -6 124 239
-----------------------------------
local ID = require("scripts/zones/Windurst_Walls/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/titles")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    local qStarStruck = player:getQuestStatus(WINDURST, tpz.quest.id.windurst.STAR_STRUCK)

    if npcUtil.tradeHasExactly(trade, 544) then
        if player:getQuestStatus(WINDURST, tpz.quest.id.windurst.MAKING_THE_GRADE) == QUEST_ACCEPTED then
            if player:getCharVar("QuestMakingTheGrade_prog") == 1 then
                player:startEvent(285) -- MAKING THE GRADE: Turn in Test Answer & Told to go back to Fuepepe & Chomoro
            else
                player:startEvent(287) -- MAKING THE GRADE: Have test answers but not talked/given to Fuepepe
            end
        end
    elseif npcUtil.tradeHasExactly(trade, 584) then
        player:startEvent(199)
    elseif
        qStarStruck == QUEST_ACCEPTED and
        npcUtil.tradeHasExactly(trade, 582)
    then
        player:startEvent(211)
    elseif npcUtil.tradeHasExactly(trade, 1127) then -- Trade Kindred seal
        if
            player:getQuestStatus(JEUNO, tpz.quest.id.jeuno.RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED
            and player:getCharVar("ridingOnTheClouds_4") == 4
        then
            player:setCharVar("ridingOnTheClouds_4", 0)
            player:tradeComplete()
            npcUtil.giveKeyItem(player, tpz.ki.SPIRITED_STONE)
        end
    elseif npcUtil.tradeHasExactly(trade, 16511) then
        if player:getQuestStatus(WINDURST, tpz.quest.id.windurst.BLAST_FROM_THE_PAST) == QUEST_ACCEPTED then
            player:startEvent(224) -- Complete quest!
        else
            player:startEvent(225) -- not the shell
        end
    elseif npcUtil.tradeHasExactly(trade, 829) then
        if player:getQuestStatus(WINDURST, tpz.quest.id.windurst.THE_ROOT_OF_THE_PROBLEM) == QUEST_ACCEPTED then
            player:startEvent(349)
        end
    elseif npcUtil.tradeHasExactly(trade, {{17299, 4}}) then
        if
            player:getQuestStatus(WINDURST, tpz.quest.id.windurst.CLASS_REUNION) == QUEST_ACCEPTED and
            player:getCharVar("ClassReunionProgress") == 2
        then
            player:startEvent(407) -- now Koru remembers something that you need to inquire his former students.
        end
    end
end

function onTrigger(player, npc)
    local qStarStruck = player:getQuestStatus(WINDURST, tpz.quest.id.windurst.STAR_STRUCK)
    local blastFromPast = player:getQuestStatus(WINDURST, tpz.quest.id.windurst.BLAST_FROM_THE_PAST)
    local blastProg = player:getCharVar("BlastFromThePast_Prog")
    local rootProblem = player:getQuestStatus(WINDURST, tpz.quest.id.windurst.THE_ROOT_OF_THE_PROBLEM)
    local ThePuppetMaster = player:getQuestStatus(WINDURST, tpz.quest.id.windurst.THE_PUPPET_MASTER)
    local ThePuppetMasterProgress = player:getCharVar("ThePuppetMasterProgress")
    local ClassReunion = player:getQuestStatus(WINDURST, tpz.quest.id.windurst.CLASS_REUNION)
    local ClassReunionProgress = player:getCharVar("ClassReunionProgress")
    local talk1 = player:getCharVar("ClassReunion_TalkedToFupepe")
    local talk2 = player:getCharVar("ClassReunion_TalkedToFurakku")
    local CarbuncleDebacle = player:getQuestStatus(WINDURST, tpz.quest.id.windurst.CARBUNCLE_DEBACLE)
    local CarbuncleDebacleProgress = player:getCharVar("CarbuncleDebacleProgress")

    if
        blastFromPast == QUEST_AVAILABLE and
        qStarStruck == QUEST_COMPLETED and
        ClassReunion ~= QUEST_ACCEPTED and
        player:getFameLevel(WINDURST) >= 3 and
        player:needToZone() == false
    then
        player:startEvent(214)
    elseif
        blastFromPast == QUEST_ACCEPTED and
        blastProg >= 2
    then
        player:startEvent(215)
    elseif blastFromPast == QUEST_ACCEPTED then
        player:startEvent(216)
    elseif player:getQuestStatus(WINDURST, tpz.quest.id.windurst.MAKING_THE_GRADE) == QUEST_ACCEPTED then
        local makingGradeProg = player:getCharVar("QuestMakingTheGrade_prog")

        if
            makingGradeProg == 0 and
            player:hasItem(544)
        then
            player:startEvent(287) -- MAKING THE GRADE: Have test answers but not talked/given to Fuepepe
        elseif makingGradeProg == 1 then
            player:startEvent(285) -- MAKING THE GRADE: Turn in Test Answer & Told to go back to Fuepepe & Chomoro
        elseif makingGradeProg >= 2 then
            player:startEvent(286) -- MAKING THE GRADE: Reminder to go away
        else
            player:startEvent(193)
        end
    elseif qStarStruck == QUEST_ACCEPTED then
        player:startEvent(198)
    elseif
        qStarStruck == QUEST_AVAILABLE and
        ClassReunion ~= QUEST_ACCEPTED and
        player:hasItem(584)
    then
        player:startEvent(197)

    -- CARBUNCLE DEBACLE
    elseif
        CarbuncleDebacle == QUEST_ACCEPTED and
        (CarbuncleDebacleProgress == 1 or
        CarbuncleDebacleProgress == 2)
    then
        player:startEvent(416) -- go and see Ripapa
    elseif
        CarbuncleDebacle == QUEST_ACCEPTED and
        CarbuncleDebacleProgress == 4
    then
        player:startEvent(417) -- now go and see Agado-Pugado
    elseif
        CarbuncleDebacle == QUEST_ACCEPTED and
        CarbuncleDebacleProgress == 5
    then
        player:startEvent(418) -- Uran-Mafran must be stopped
    elseif
        CarbuncleDebacle == QUEST_ACCEPTED and
        CarbuncleDebacleProgress == 7
    then
        player:startEvent(419) -- ending cs
    elseif
        ThePuppetMaster == QUEST_COMPLETED and
        ClassReunion == QUEST_COMPLETED and
        CarbuncleDebacle == QUEST_COMPLETED
    then
        player:startEvent(420) -- new cs after all 3 SMN AFs done

    -- CLASS REUNION
    elseif
        ClassReunion == QUEST_ACCEPTED and
        ClassReunionProgress == 1
    then
        player:startEvent(412, 0, 450, 17299, 0, 0, 0, 0, 0) -- bring Koru 4 astragaloi
    elseif
        ClassReunion == QUEST_ACCEPTED and
        ClassReunionProgress == 2
    then
        player:startEvent(414, 0, 0, 17299, 0, 0, 0, 0, 0) -- reminder to bring 4 astragaloi
    elseif
        ClassReunion == QUEST_ACCEPTED and
        ClassReunionProgress >= 3 and
        (talk1 ~= 1 or
        talk2 ~= 1)
    then
        player:startEvent(408) -- reminder to visit the students
    elseif
        ClassReunion == QUEST_ACCEPTED and
        ClassReunionProgress == 6 and
        talk1 == 1 and
        talk2 == 1
    then
        player:startEvent(410) -- ending cs
    elseif
        ThePuppetMaster == QUEST_COMPLETED and
        ClassReunion == QUEST_COMPLETED
    then
        player:startEvent(411) -- new cs after completed AF2

    -- THE PUPPET MASTER
    elseif
        ThePuppetMaster == QUEST_ACCEPTED and
        ThePuppetMasterProgress == 4
    then
        player:startEvent(404) -- ending cs
    elseif
        ThePuppetMaster == QUEST_COMPLETED and
        ClassReunion ~= 2
    then
        player:startEvent(405) -- new cs after completed AF1

    -- THE ROOT OF THE PROBLEM
    elseif rootProblem == QUEST_ACCEPTED and
        player:getCharVar("rootProblem") == 1
    then
        player:startEvent(348, 0, 829)
    else
        if qStarStruck == QUEST_COMPLETED then
            player:startEvent(213)

        -- DEFAULT DIALOG
        else
            player:startEvent(193)
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 285 then  -- Giving him KI from Principle
        player:tradeComplete()
        npcUtil.giveKeyItem(player, tpz.ki.TATTERED_TEST_SHEET)
        player:setCharVar("QuestMakingTheGrade_prog", 2)
    elseif
        csid == 211 and
        npcUtil.completeQuest(player, WINDURST, tpz.quest.id.windurst.STAR_STRUCK, {
            fame = 20,
            item = 12502
        })
    then
        player:tradeComplete()
        player:needToZone(true)
    elseif csid == 199 then
        player:tradeComplete()
        player:messageSpecial(ID.text.GIL_OBTAINED, GIL_RATE*50)
        player:addGil(GIL_RATE*50)
    elseif
        csid == 197 and
        option == 0
    then
        player:addQuest(WINDURST, tpz.quest.id.windurst.STAR_STRUCK)
    elseif
        csid == 214 and
        option == 0
    then
        player:addQuest(WINDURST, tpz.quest.id.windurst.BLAST_FROM_THE_PAST)
    elseif
        csid == 224 and
        npcUtil.completeQuest(player, WINDURST, tpz.quest.id.windurst.BLAST_FROM_THE_PAST, {
            item = 17030,
            title = tpz.title.FOSSILIZED_SEA_FARER,
            var = "BlastFromThePast_Prog"
        })
    then
        player:tradeComplete()
        player:needToZone(true)
    elseif csid == 349 then
        player:tradeComplete()
        player:setCharVar("rootProblem", 2)
    elseif
        csid == 404 and
        npcUtil.completeQuest(player, WINDURST, tpz.quest.id.windurst.THE_PUPPET_MASTER, {
            item = 17532,
            fame = 20,
            var = "ThePuppetMasterProgress"
        })
    then
        player:needToZone(true)
    elseif csid == 412 then
        player:delKeyItem(tpz.ki.CARBUNCLES_TEAR)
        player:setCharVar("ClassReunionProgress", 2)
    elseif csid == 407 then
        player:tradeComplete()
        player:setCharVar("ClassReunionProgress", 3)
    elseif
        csid == 410 and
        npcUtil.completeQuest(player, WINDURST, tpz.quest.id.windurst.CLASS_REUNION, {
            item = 14228,
            fame = 40,
            var = {"ClassReunionProgress", "ClassReunion_TalkedToFurakku", "ClassReunion_TalkedToFupepe"}
        })
    then
        player:needToZone(true)
    elseif csid == 416 then
        player:setCharVar("CarbuncleDebacleProgress", 2)
    elseif csid == 417 then
        player:setCharVar("CarbuncleDebacleProgress", 5)
        npcUtil.giveKeyItem(player, tpz.ki.DAZEBREAKER_CHARM)
    elseif
        csid == 419 and
        npcUtil.completeQuest(player, WINDURST, tpz.quest.id.windurst.CARBUNCLE_DEBACLE, {
            item = 12520,
            fame = 60,
            title = tpz.title.PARAGON_OF_SUMMONER_EXCELLENCE,
            var = "CarbuncleDebacleProgress"
        })
    then
        player:needToZone(true)
    end
end
