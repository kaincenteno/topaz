-----------------------------------------
-- ID: 6167
-- Item: Coveffe Musings
-- A collection of thoughts scribbled out by Ferreous Coffin on his visit to Coveffe Barrows.
-- Adventurers note that reading it increases one's healing magic skill.
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.HEALING_MAGIC)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.HEALING_MAGIC)
end
