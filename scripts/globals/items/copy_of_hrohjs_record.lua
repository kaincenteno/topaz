-----------------------------------------
-- ID: 6178
-- Item: Hrohj's Record
-- A record of what happened on the fateful day the lifestream overflowed,
-- as kept by Hrohj Wagrehsa.
-- Adventurers note that reading it increases one's geomancy skill. 
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.GEOMANCY)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.GEOMANCY)
end
