-----------------------------------
-- Area: Horlais Peak
--  Mob: Atori-Tutori ???
-- BCNM: Beyond Infinity
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
end

function onMobEngaged(mob,target)
    local ID = zones[mob:getZoneID()]

    mob:addListener("EFFECT_LOSE", "TERRORIZED", function(mob, effect)
        if effect:getType() == tpz.effect.TERROR then
            mob:showText(mob, 7957) -- TODO: BUG, message repeats 2 or 3 times.
        end
    end)
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller)
end
