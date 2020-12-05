-----------------------------------------
-- ID: 6157
-- Item: Ferreous's Diary
-- A diary written by Ferreous Coffin that describes his encounters with Orcs in the north.
-- So many were there that his war hammer became coated with a thick layer of blood after all was said and done. 
-- Adventurers note that reading it increases one's club skill.
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.CLUB)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.CLUB)
end
