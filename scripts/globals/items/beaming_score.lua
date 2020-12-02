-----------------------------------------
-- ID: 6174
-- Item: Beaming Score
-- A musical score composed by Lewenhart.
-- Its notes symbolize the gently glowing beams of light that filter through the leaves of a deciduous tree in the late afternoon.
-- Adventurers note that reading it increases one's wind instrument skill. 
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.WIND_INSTRUMENT)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.WIND_INSTRUMENT)
end
