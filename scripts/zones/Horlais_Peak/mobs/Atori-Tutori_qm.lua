-----------------------------------
-- Area: Horlais Peak
--  Mob: Atori-Tutori ???
-- BCNM: Beyond Infinity
-----------------------------------
require("scripts/globals/status")
require("scripts/mixins/job_special")
-----------------------------------

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.MIGHTY_STRIKES,
                hpp = 35,
                begCode = function(mob)
                    mob:messageText(mob, 7953) -- Hah! You pack more of a punch than I thoughtaru.  But I won't go down as easy as old Maat!≺Prompt≻
                end
            },
        },
    })
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

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 14 then -- Victory Smite
        mob:showText(mob, 7952) -- Haha! I'm just getting warmed up!≺Prompt≻
    elseif skill:getID() == 8 then -- Dragon Kick
        mob:showText(mob, 7952) -- Huh? Is that all?  I haven't even broken a sweataru...
--    elseif skill:getID() ==  then --
--        mob:showText(mob, ) --
--    elseif skill:getID() ==  then -- Victory Smite
--        mob:showText(mob, ) --
    end
end

function onMobDeath(mob, player, isKiller)
end