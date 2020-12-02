-----------------------------------------
-- ID: 6161
-- Item: T.W. Enchiridion
-- A guide to the finer points of hurling projectile objects at opponents,
-- written by an anonymous individual.
-- Adventurers note that reading it increases one's throwing skill. 
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.THROWING)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.THROWING)
end
