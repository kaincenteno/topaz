-----------------------------------------
-- ID: 6153
-- Item: Ludwig's Report
-- A report made by Ludwig Eichberg regarding the Battle of Grauberg.
-- It details the constant changes in the position of the front line and the withdrawal of Republic troops.
-- Adventurers note that reading it increases one's scythe skill. 
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.SCYTHE)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.SCYTHE)
end
