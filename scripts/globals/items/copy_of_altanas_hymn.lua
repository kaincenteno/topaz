-----------------------------------------
-- ID: 6166
-- Item: Altana's Hymn
-- A copy of Febrenard C Brunnaut's favorite read.
-- The simple lyrics and enchanting meter were said to have soothed his soul.
-- Adventurers note that reading it increases one's divine magic skill.
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.DIVINE_MAGIC)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.DIVINE_MAGIC)
end
