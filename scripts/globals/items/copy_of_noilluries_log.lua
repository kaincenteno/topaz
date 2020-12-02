-----------------------------------------
-- ID: 6156
-- Item: Noillurie's Log
-- A record Noillurie kept of her personal experiences.
-- The one that stands out the most is the battle with the colossal beast she undertook to prove herself to her order.
-- Adventurers note that reading it increases one's great katana skill.
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.GREAT_KATANA)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.GREAT_KATANA)
end
