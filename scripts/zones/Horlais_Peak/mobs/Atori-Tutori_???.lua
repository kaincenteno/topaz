-----------------------------------
-- Area: Horlais Peak
--  Mob: Atori-Tutori ???
-- BCNM: Tails of Woe
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
end

function onMobEngaged(mob,target)
    local ID = zones[mob:getZoneID()

    mob:addListener("EFFECT_LOSE", "TERRORIZED", function(mob, effect)
        if effect:getType() == tpz.effect.TERROR then
            mob:showText(mob, 7957) -- TODO: BUG, message repeats 2 or 3 times.
        end
    end)

    mob:addListener("EFFECT_LOSE", "TERRORIZED", function(mob, effect)
        if effect:getType() == tpz.effect.TERROR then
            mob:showText(mob, 7957) -- TODO: BUG, message repeats 2 or 3 times.
        end
    end)

    mob:addListener("WEAPONSKILL_USE", "ATORI_WEAPONSKILL_USE", function(mob, target, wsid, tp, action)
        local ID = zones[mob:getZoneID()]
        if (wsid == 1028) then -- Tackle
            mob:messageText(mob, ID.text.TAKE_THAT_YOU_WHIPPERSNAPPER)
        elseif (wsid == 1033) then -- Dragon Kick
            mob:messageText(mob, ID.text.TEACH_YOU_TO_RESPECT_ELDERS)
        elseif (wsid == 1034) then -- Asuran Fists
            mob:messageText(mob, ID.text.LOOKS_LIKE_YOU_WERENT_READY)
        end

    if mob:getHPP() == 100 then
        mob:showText(mob, 7951)
    end

    7953
    ABILITY_USE - Entity, Target, Ability, action
end

function onMobFight(mob, target)
    if mob: == 0 then
        mob:useMobAbility(tpz.jsa.HUNDRED_FISTS)
        mob:messageText(mob, 7953)
        mob:setLocalVar("HF", 1)

    end
    -- mob:setStatus(0)
end

function onMobDeath(mob, player, isKiller)
    mob:showText(mob, 7954)
end
