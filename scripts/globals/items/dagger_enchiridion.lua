-----------------------------------------
-- ID: 6148
-- Item: Dagger enchiridion
-- A guide to the finer points of wielding a dagger,
-- written by an anonymous individual. 
-- Adventurers note that reading it increases one's dagger skill.
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.DAGGER)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.DAGGER)
end
