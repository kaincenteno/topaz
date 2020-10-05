-----------------------------------
-- Area: Windurst Walls (239)
--  NPC: Shantotto
-- !pos 122 -2 112 239
-- CSID's missing in autoEventID please check the old forums under resources for all of shantotto's csid's.
-- I found them all manually.
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/quests")
require("scripts/globals/settings")
require("scripts/globals/titles")
require("scripts/globals/wsquest")
require("scripts/globals/npc_util")
local ID = require("scripts/zones/Windurst_Walls/IDs")
-----------------------------------

local wsQuest = tpz.wsquest.retribution

function onTrade(player, npc, trade)
    local wsQuestEvent = tpz.wsquest.getTradeEvent(wsQuest, player, trade)

    if wsQuestEvent ~= nil then
        if wsQuestEvent == 448 then
            player:startEvent(wsQuestEvent, nil, nil, tpz.keyItem.ANNALS_OF_TRUTH)
        else
            player:startEvent(wsQuestEvent)
        end

    -- CURSES FOILED AGAIN!
    elseif player:getQuestStatus(WINDURST, tpz.quest.id.windurst.CURSES_FOILED_AGAIN_1) == QUEST_ACCEPTED then
        if npcUtil.tradeHasExactly(trade, {{928, 1}, {880, 2}}) then
            player:startEvent(173, 0, 0, 0, 0, 0, 0, 928, 880) -- Correct items given, complete quest.
        else
            player:startEvent(172, 0, 0, 0, 0, 0, 0, 928, 880) -- Incorrect or not enough items
        end

    -- CURSES, FOILED ... AGAIN!?
    elseif player:getQuestStatus(WINDURST, tpz.quest.id.windurst.CURSES_FOILED_AGAIN_2) == QUEST_ACCEPTED then
        if npcUtil.tradeHasExactly(trade, {{17316, 2}, {940, 1}, {552, 1}}) then
            player:startEvent(183) -- Correct items given, complete quest.
        else
            player:startEvent(181, 0, 0, 0, 0, 0, 0, 17316, 940) -- Incorrect or not enough items
        end
    end
end

function onTrigger(player, npc)
    local wsQuestEvent = tpz.wsquest.getTriggerEvent(wsQuest, player)
    local foiledAgain = player:getQuestStatus(WINDURST, tpz.quest.id.windurst.CURSES_FOILED_AGAIN_1)
    local CFA2 = player:getQuestStatus(WINDURST, tpz.quest.id.windurst.CURSES_FOILED_AGAIN_2)
    local CFAtimer = player:getCharVar("CursesFoiledAgain")
    local FoiledAGolem = player:getQuestStatus(WINDURST, tpz.quest.id.windurst.CURSES_FOILED_A_GOLEM)
    local golemdelivery = player:getCharVar("foiledagolemdeliverycomplete")
    local WildcatWindurst = player:getCharVar("WildcatWindurst")

    if wsQuestEvent ~= nil then
        player:startEvent(wsQuestEvent)
    elseif
        player:getCurrentMission(WINDURST) == tpz.mission.id.windurst.THE_JESTER_WHO_D_BE_KING and
        player:getCharVar("MissionStatus") == 7
    then
        player:startEvent(397, 0, 0, 0, 282)
    elseif
        player:getQuestStatus(WINDURST, tpz.quest.id.windurst.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and
        player:getMaskBit(WildcatWindurst, 6) == false
    then
        player:startEvent(498)
    elseif
        player:getQuestStatus(WINDURST, tpz.quest.id.windurst.CLASS_REUNION) == QUEST_ACCEPTED and
        player:getCharVar("ClassReunionProgress") == 3
    then
        player:startEvent(409) -- she mentions that Sunny-Pabonny left for San d'Oria

    -- AMK
    elseif player:getCurrentMission(AMK) == tpz.mission.id.amk.CURSES_A_HORRIFICALLY_HARROWING_HEX then
        player:startEvent(506)

    -- CURSES, FOILED...AGAIN!?
    elseif foiledAgain == QUEST_AVAILABLE then
        player:startEvent(171, 0, 0, 0, 0, 0, 0, 928, 880)
    elseif foiledAgain == QUEST_ACCEPTED then
        player:startEvent(172, 0, 0, 0, 0, 0, 0, 928, 880)
    elseif
        foiledAgain == QUEST_COMPLETED and
        CFA2 == QUEST_AVAILABLE and
        CFAtimer == 0
    then
        local cDay = VanadielDayOfTheYear()
        local cYear = VanadielYear()
        local dFinished = player:getCharVar("CursesFoiledAgainDay")
        local yFinished = player:getCharVar("CursesFoiledAgainYear")

        if
            cDay == dFinished and
            cYear == yFinished
        then
            player:startEvent(174)
        elseif
            cDay == dFinished + 1 and
            cYear == yFinished
        then
            player:startEvent(178)
        elseif
            (cDay >= dFinished + 2 and
            cYear == yFinished) or
            cYear > yFinished
        then
            player:startEvent(179)
        end

    -- CURSES, FOILED...AGAIN!?
    elseif
        foiledAgain == QUEST_COMPLETED and
        CFA2 == QUEST_AVAILABLE and
        player:getFameLevel(WINDURST) >= 2 and
        player:getMainLvl() >= 5 and
        CFAtimer == 1
    then
        player:startEvent(180, 0, 0, 0, 0, 928, 880, 17316, 940)        -- Quest Start
    elseif
        CFA2 == QUEST_ACCEPTED
    then
        player:startEvent(181, 0, 0, 0, 0, 0, 0, 17316, 940)  -- Reminder dialog

    -- CURSES, FOILED A-GOLEM!?
    elseif
        CFA2 == QUEST_COMPLETED and
        FoiledAGolem == QUEST_AVAILABLE and
        player:getFameLevel(WINDURST) >= 4 and
        player:getMainLvl() >= 10
    then
        player:startEvent(340)  --quest start
    elseif golemdelivery == 1 then
        player:startEvent(342)  -- finish
    elseif FoiledAGolem == QUEST_ACCEPTED then
        player:startEvent(341)  -- reminder dialog

    -- DEFAULT DIALOG (after FOILED A-GOLEM!?)
    elseif FoiledAGolem == QUEST_COMPLETED then
        player:startEvent(343)  -- new standard dialog after Curses, Foiled A-Golem!?

    -- DEFAULT DIALOG (after CURSES, FOILED AGAIN!?)
    elseif CFA2 == QUEST_COMPLETED then
        player:startEvent(184)     -- New standard dialog after CFA2
    elseif
        player:hasCompletedMission(WINDURST, tpz.mission.id.windurst.THE_JESTER_WHO_D_BE_KING) and
        player:getCharVar("ShantottoCS") == 1
    then
        player:startEvent(399, 0, 0, 282)

    -- DEFAULT DIALOG
    else
        player:startEvent(164)
    end
end

function onEventFinish(player, csid, option)
    if
        csid == 173 and
        npcUtil.completeQuest(player, WINDURST, tpz.quest.id.windurst.CURSES_FOILED_AGAIN_1, {
            item = 17081,
            fame = 80,
            var = "ThePuppetMasterProgress"
        })
    then
        player:tradeComplete()
        player:setCharVar("CursesFoiledAgainDay", VanadielDayOfTheYear())
        player:setCharVar("CursesFoiledAgainYear", VanadielYear())
    elseif
        csid == 171 and
        option ~= 1
    then
        player:addQuest(WINDURST, tpz.quest.id.windurst.CURSES_FOILED_AGAIN_1)

    elseif csid == 179 then
        player:setCharVar("CursesFoiledAgainDayFinished", 0)
        player:setCharVar("CursesFoiledAgainYearFinished", 0)
        player:setCharVar("CursesFoiledAgainDay", 0)
        player:setCharVar("CursesFoiledAgainYear", 0)
        player:setCharVar("CursesFoiledAgain", 1) -- Used to acknowledge that the two days have passed, Use this to initiate next quest
        player:needToZone(true)

    elseif
        csid == 180 and
        option == 3
    then
        player:setCharVar("CursesFoiledAgain", 0)
        player:addQuest(WINDURST, tpz.quest.id.windurst.CURSES_FOILED_AGAIN_2)
        player:setTitle(tpz.title.TARUTARU_MURDER_SUSPECT)

    elseif
        csid == 183 and
        npcUtil.completeQuest(player, WINDURST, tpz.quest.id.windurst.CURSES_FOILED_AGAIN_2, {
            item = 17116,
            fame = 90,
            title = tpz.title.HEXER_VEXER
        })
    then
        player:tradeComplete()
        player:needToZone(true)

    elseif csid == 340 then
        if option == 1 then
            player:addQuest(WINDURST, tpz.quest.id.windurst.CURSES_FOILED_A_GOLEM)
        else
            player:setTitle(tpz.title.TOTAL_LOSER)
        end

    elseif csid == 342 then
        npcUtil.completeQuest(player, WINDURST, tpz.quest.id.windurst.CURSES_FOILED_A_GOLEM, {
            item = 4870,
            fame = 120,
            title = tpz.title.DOCTOR_SHANTOTTOS_FLAVOR_OF_THE_MONTH,
            var = "foiledagolemdeliverycomplete"
        })
    elseif csid == 409 then
        player:setCharVar("ClassReunionProgress", 4)
    elseif csid == 498 then
        player:setMaskBit(player:getCharVar("WildcatWindurst"), "WildcatWindurst", 6, true)
    elseif csid == 397 then
        npcutil.giveKeyItem(player, tpz.ki.GLOVE_OF_PERPETUAL_TWILIGHT)
        player:setCharVar("MissionStatus", 8)
    elseif csid == 399 then
        player:setCharVar("ShantottoCS", 0)

    elseif csid == 506 then
        player:completeMission(AMK, tpz.mission.id.amk.CURSES_A_HORRIFICALLY_HARROWING_HEX)
        player:addMission(AMK, tpz.mission.id.amk.AN_ERRAND_THE_PROFESSORS_PRICE)

    else
        tpz.wsquest.handleEventFinish(wsQuest, player, csid, option, ID.text.RETRIBUTION_LEARNED)
    end
end
