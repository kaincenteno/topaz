-----------------------------------------
-- ID: 6165
-- Item: Kage. Journal
-- A journal kept by Kagetora that delineates the extent to which
-- he and Yomi lost themselves in their studies of the martial arts
-- Adventurers note that reading it increases one's parrying skill.
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.PARRY)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.PARRY)
end
