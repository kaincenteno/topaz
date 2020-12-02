-----------------------------------------
-- ID: 6162
-- Item: Mikhe's Note
-- A memo scrawled by Mikhe Aryohcha that matter-of-factly states,
-- "Just throw your guard up and it'll all work out."
-- Adventurers note that reading it increases one's guarding skill. 
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.GUARD)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.GUARD)
end
