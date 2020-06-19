-----------------------------------------
-- ID: 5911
-- Item: Olde Rarab Tail
-- Effect: 90 Seconds of "Terror" effect.
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local typeEffect = tpz.effect.TERROR
    local duration = 90

    if not target:hasStatusEffect(typeEffect) and target:getID() == 17346789  then
        target:addStatusEffect(typeEffect,1,3,duration)
        target:showText(target, 7956)
    else
        target:messageBasic(tpz.msg.basic.NO_EFFECT)
    end
end

function onEffectGain(target,effect)
    target:addMod(tpz.mod.HP, 12)
    target:addMod(tpz.mod.MP, 12)
    target:addMod(tpz.mod.DEX, -1)
    target:addMod(tpz.mod.AGI, 3)
    target:addMod(tpz.mod.VIT, -1)
    target:addMod(tpz.mod.CHR, -5)
    target:addMod(tpz.mod.FOOD_DEFP, 9)
    target:addMod(tpz.mod.FOOD_DEF_CAP, 100)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.HP, 12)
    target:delMod(tpz.mod.MP, 12)
    target:delMod(tpz.mod.DEX, -1)
    target:delMod(tpz.mod.AGI, 3)
    target:delMod(tpz.mod.VIT, -1)
    target:delMod(tpz.mod.CHR, -5)
    target:delMod(tpz.mod.FOOD_DEFP, 9)
    target:delMod(tpz.mod.FOOD_DEF_CAP, 100)
end