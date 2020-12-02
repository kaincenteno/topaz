-----------------------------------------
-- ID: 6164
-- Item: The Successor
-- An essay authored by Cerane I Virgaut,
-- mainly concerning the night Perseus bequeathed unto her an exemplary shield.
-- Adventurers note that reading it increases one's shield skill.
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.SHIELD)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.SHIELD)
end
