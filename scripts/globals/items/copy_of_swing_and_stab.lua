-----------------------------------------
-- ID: 6149
-- Item: Swing and Stab
-- Ulla wrote this guide on sword wielding
-- from how to grip the hilt to tips on footwork
-- so others could follow in her footsteps. 
-- Adventurers note that reading it increases one's sword skill. 
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.SWORD)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.SWORD)
end
