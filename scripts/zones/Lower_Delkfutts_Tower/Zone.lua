-----------------------------------
--
-- Zone: Lower_Delkfutts_Tower (184)
--
-----------------------------------
local ID = require("scripts/zones/Lower_Delkfutts_Tower/IDs")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/settings")
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1, 403, -34, 83, 409, -33, 89) -- Third Floor G-6 porter to Middle Delkfutt's Tower
    zone:registerRegion(2, 390, -34, -49, 397, -33, -43) -- Third Floor F-10 porter to Middle Delkfutt's Tower "1"
end

function onConquestUpdate(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

function onZoneIn(player, prevZone)
    local cs = -1
    local params = {0, 0, 0, 0, 0, 0, 0, 0}

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(460.022, -1.77, -103.442, 188)
    end

    -- RETURN TO DELKFUTTS TOWER
    if
        player:getCurrentMission(ZILART) == tpz.mission.id.zilart.RETURN_TO_DELKFUTTS_TOWER and
        player:getCharVar("ZilartStatus") <= 1
    then
        cs = 15

    -- THE RITES OF LIFE
    elseif
        ENABLE_COP == 1 and
        prevZone == tpz.zone.QUFIM_ISLAND and
        player:getCurrentMission(COP) < tpz.mission.id.cop.THE_RITES_OF_LIFE
    then
        cs = 22

    -- SPIRITS AWOKEN
    elseif player:getCurrentMission(ROV) == tpz.mission.id.rov.SPIRITS_AWOKEN then
        cs = 51

        if player:getCurrentMission(COP) >= tpz.mission.id.cop.THREE_PATHS then
            params[2] = 1 -- Acknowledges the Player Character already knowing Prishe
        end

    -- BORN OF HER NIGHTMARES
    elseif
        player:getCurrentMission(ACP) == tpz.mission.id.acp.BORN_OF_HER_NIGHTMARES and
        prevZone == tpz.zone.QUFIM_ISLAND
    then
        cs = 34
    end

    return cs --,{params} need to pass a param for CS 51 to show extra dialog
end

function onRegionEnter(player, region)
    switch (region:GetRegionID()): caseof
    {
        [1] = function (x)
            player:setCharVar("option", 1)
            player:startEvent(4)
        end,
        [2] = function (x)
            player:setCharVar("option", 2)
            player:startEvent(4)
        end,
    }
end

function onRegionLeave(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 51 then print("option is: hoho "..option) end
    if csid == 15 then
        player:setCharVar("ZilartStatus", 2)
    elseif
        csid == 4 and
        option == 1 then
        if player:getCharVar("option") == 1 then
            player:setPos(-28, -48, 80, 111, 157)
        else
            player:setPos(-51, -48, -40, 246, 157)
        end
        player:setCharVar("option", 0)
    elseif
        csid == 4 and
        (option == 0 or
        option >= 3)
    then
        player:setCharVar("option", 0)
    elseif csid == 22 then
        player:startEvent(36)
    elseif csid == 34 then
        player:completeMission(ACP, tpz.mission.id.acp.BORN_OF_HER_NIGHTMARES)
        player:addMission(ACP, tpz.mission.id.acp.BANISHING_THE_ECHO)
    elseif csid == 36 then
        player:startEvent(37)
    elseif csid == 37 then
        player:startEvent(38)
    elseif csid == 38 then
        player:startEvent(39)
    elseif csid == 39 then
        player:completeMission(COP, tpz.mission.id.cop.ANCIENT_FLAMES_BECKON)
        player:addMission(COP, tpz.mission.id.cop.THE_RITES_OF_LIFE)
        player:setCharVar("COP1", 1)
    elseif csid == 51 then
        player:completeMission(ROV, tpz.mission.id.rov.SPIRITS_AWOKEN)
        player:addMission(ROV, tpz.mission.id.rov.CRASHING_WAVES)
    end
end
