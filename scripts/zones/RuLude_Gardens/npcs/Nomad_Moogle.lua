-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Nomad Moogle
-- Type: Adventurer's Assistant
-- !pos 10.012 1.453 121.883 243
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
local ID = require("scripts/zones/RuLude_Gardens/IDs");
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    local meritCount = player:getMeritCount();
    if (trade:hasItemQty(1127,5) == true and trade:getGil() == 0 and trade:getItemCount() == 5 and meritCount > 2) then
        if (player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.NEW_WORLDS_AWAIT) == QUEST_ACCEPTED) then
            player:startEvent(10135);
        end
    elseif (trade:hasItemQty(2955,5) == true and trade:getGil() == 0 and trade:getItemCount() == 5 and meritCount > 3) then
        if (player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.EXPANDING_HORIZONS) == QUEST_ACCEPTED) then
            player:startEvent(10136);
        end
    elseif (trade:hasItemQty(2955,10) == true and trade:getGil() == 0 and trade:getItemCount() == 10 and meritCount > 4) then
        if (player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.BEYOND_THE_STARS) == QUEST_ACCEPTED) then
            player:startEvent(10137);
        end
    elseif (trade:hasItemQty(2955,1) == true and trade:hasItemQty(503,1) == true and trade:getGil() == 0 and trade:getItemCount() == 2 and meritCount > 9) then
        if (player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.DORMANT_POWERS_DISLODGED) == QUEST_ACCEPTED) then
            player:startEvent(10138);
        end
    elseif npcUtil.tradeHasExactly(trade, 605) and player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.PRELUDE_TO_PUISSANCE) == QUEST_ACCEPTED then
        player:tradeComplete()
        player:completeQuest(JEUNO,tpz.quest.id.jeuno.PRELUDE_TO_PUISSANCE)
        player:startEvent(10045,0,1,5,0)
    end
end;

function onTrigger(player,npc)
    if (player:hasKeyItem(tpz.ki.LIMIT_BREAKER) == false and player:getMainLvl() >= 75) then
        player:startEvent(10045,75,2,10,7,30,302895,4095);
    elseif (player:getMainLvl() == 75 and player:levelCap() == 75 and MAX_LEVEL >= 80 and player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.NEW_WORLDS_AWAIT) == QUEST_AVAILABLE) then
        player:startEvent(10045,0,1,1,0);
    elseif (player:getMainLvl() >= 76 and player:levelCap() == 80 and MAX_LEVEL >= 85 and player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.EXPANDING_HORIZONS) == QUEST_AVAILABLE) then
        player:startEvent(10045,0,1,2,0);
    elseif (player:getMainLvl() >= 81 and player:levelCap() == 85 and MAX_LEVEL >= 90 and player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.BEYOND_THE_STARS) == QUEST_AVAILABLE) then
        player:startEvent(10045,0,1,3,0);
    elseif (player:getMainLvl() >= 86 and player:levelCap() == 90 and MAX_LEVEL >= 95 and player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.DORMANT_POWERS_DISLODGED) == QUEST_AVAILABLE) then
        player:startEvent(10045,0,1,4,0);
    elseif player:getMainLvl() >= 91 and player:levelCap() == 95 and MAX_LEVEL >= 99 and player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.PRELUDE_TO_PUISSANCE) == QUEST_AVAILABLE then
        player:startEvent(10194)
    elseif player:getMainLvl() >= 91 and player:levelCap() == 95 and MAX_LEVEL >= 99 and player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.BEYOND_INFINITY) == QUEST_AVAILABLE and player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.PRELUDE_TO_PUISSANCE) == QUEST_COMPLETED then
        player:startEvent(10045,0,1,5,0);
    elseif (player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.NEW_WORLDS_AWAIT) == QUEST_ACCEPTED) then
        player:startEvent(10045,0,1,1,1);
    elseif (player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.EXPANDING_HORIZONS) == QUEST_ACCEPTED) then
        player:startEvent(10045,0,1,2,1);
    elseif (player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.BEYOND_THE_STARS) == QUEST_ACCEPTED) then
        player:startEvent(10045,0,1,3,1);
    elseif (player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.DORMANT_POWERS_DISLODGED) == QUEST_ACCEPTED) then
        player:startEvent(10045,0,1,4,1);
    elseif (player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.PRELUDE_TO_PUISSANCE) == QUEST_ACCEPTED) then
        player:startEvent(10045,0,1,6,1)
    elseif (player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.BEYOND_INFINITY) == QUEST_ACCEPTED) then
        player:startEvent(10045,0,1,5,1); -- player:startEvent(10045,0,1,6,1);
    elseif (player:hasKeyItem(tpz.ki.LIMIT_BREAKER) == true and player:getMainLvl() >= 75) then
        player:startEvent(10045,0,1,0,0);
    else
        player:startEvent(10045,0,2,0,0);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    local meritCount = player:getMeritCount();

    if (csid == 10045 and option == 4) then
        player:addKeyItem(tpz.ki.LIMIT_BREAKER);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,tpz.ki.LIMIT_BREAKER);
    elseif (csid == 10045) then
        player:PrintToPlayer(option)
        if (option == 5) then
            player:addQuest(JEUNO,tpz.quest.id.jeuno.NEW_WORLDS_AWAIT);
        elseif (option == 7 ) then
            player:addQuest(JEUNO,tpz.quest.id.jeuno.EXPANDING_HORIZONS);
        elseif (option == 9) then
            player:addQuest(JEUNO,tpz.quest.id.jeuno.BEYOND_THE_STARS);
        elseif (option == 11) then
            player:addQuest(JEUNO,tpz.quest.id.jeuno.DORMANT_POWERS_DISLODGED);
        elseif (option == 13 or option == 14 or option == 19 or option == 20 or option == 21) then -- this is the option that doesnt want to be teleported
            player:addKeyItem(tpz.ki.SOUL_GEM_CLASP) -- WOULD LIKE FEEDBACK IF THIS IS THE CORRECT LOCATION FOR KI
            player:addQuest(JEUNO,tpz.quest.id.jeuno.BEYOND_INFINITY)
            if option == 14 then
                player:setPos(-511.459,159.004,-210.543,10,139) -- Horlais Peek
            elseif option == 19 then
                player:setPos(-349.899,104.213,-260.150,0,144) -- Waughrum Shrine
            elseif option == 20 then
                player:setPos(299.316,-123.591,353.760,66,146) -- Balga's Dais
            elseif option == 21 then
                player:setPos(-225.146,-24.250,20.057,255,206) -- Qu'via Arena
            end
        end
    elseif (csid == 10135) then
        player:tradeComplete();
        player:setMerits(meritCount - 3);
        player:addFame(JEUNO,50);
        player:levelCap(80);
        player:completeQuest(JEUNO,tpz.quest.id.jeuno.NEW_WORLDS_AWAIT);
        player:messageSpecial(ID.text.YOUR_LEVEL_LIMIT_IS_NOW_80);
    elseif (csid == 10136) then
        player:tradeComplete();
        player:setMerits(meritCount - 4);
        player:addFame(JEUNO,50);
        player:levelCap(85);
        player:completeQuest(JEUNO,tpz.quest.id.jeuno.EXPANDING_HORIZONS);
        player:messageSpecial(ID.text.YOUR_LEVEL_LIMIT_IS_NOW_85);
    elseif (csid == 10137) then
        player:tradeComplete();
        player:setMerits(meritCount - 5);
        player:startEvent(10161); -- this is the scene that is suppose to play and you are suppose to have to do correctly inorder to level cap increase to 90
        player:addFame(JEUNO,50);
        player:levelCap(90);
        player:completeQuest(JEUNO,tpz.quest.id.jeuno.BEYOND_THE_STARS);
        player:messageSpecial(ID.text.YOUR_LEVEL_LIMIT_IS_NOW_90);
    elseif (csid == 10138) then
        player:tradeComplete();
        player:setMerits(meritCount - 10);
        player:addFame(JEUNO,50);
        player:levelCap(95);
        player:completeQuest(JEUNO,tpz.quest.id.jeuno.DORMANT_POWERS_DISLODGED);
        player:messageSpecial(ID.text.YOUR_LEVEL_LIMIT_IS_NOW_95);
        player:addKeyItem(tpz.ki.SOUL_GEM);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,tpz.ki.SOUL_GEM);
    elseif csid == 10194 then
        player:addQuest(JEUNO,tpz.quest.id.jeuno.PRELUDE_TO_PUISSANCE)
    end
end;
