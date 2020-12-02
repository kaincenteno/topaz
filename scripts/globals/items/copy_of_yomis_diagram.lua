-----------------------------------------
-- ID: 6175
-- Item: Yomi's Diagram
-- A meticulously drawn diagram Yomi made for Kagetora explaining how to construct certain ninja tools.
-- Adventurers note that reading it increases one's ninjutsu skill. 
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.NINJUTSU)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.NINJUTSU)
end
