-----------------------------------------
-- ID: 6177
-- Item: Life-form Study
-- A report written and filed by an anonymous individual.
-- It covers the behavioral patterns and diets of almost every known family of beasts in existence.
-- Adventurers note that reading it increases one's blue magic skill. 
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.BLUE_MAGIC)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.BLUE_MAGIC)
end
