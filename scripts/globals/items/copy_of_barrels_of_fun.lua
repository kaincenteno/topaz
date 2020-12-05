-----------------------------------------
-- ID: 6160
-- Item: Barrels of Fun
-- An educational text authored by Elivira Gogol. 
-- It discusses how to dismantle, clean, and reconstruct firearms in careful detail. 
-- Adventurers note that reading it increases one's marksmanship skill. 
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.MARKSMANSHIP)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.MARKSMANSHIP)
end
