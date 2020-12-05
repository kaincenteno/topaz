-----------------------------------------
-- ID: 6152
-- Item: Death for Dimwits
-- A guide to the finer points of hacking everything in one's way to pieces with a two-handed axe,
-- written by an anonymous individual. 
-- Adventurers note that reading it increases one's great axe skill.
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.GREAT_AXE)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.GREAT_AXE)
end
