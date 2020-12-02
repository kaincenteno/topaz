-----------------------------------------
-- ID: 6159
-- Item: Perih's Primer
-- A guidebook Perih Vashai jotted down for the edification of new recruits. 
-- It discusses everything from the various ways of holding a bow to methods of judging distance. 
-- Adventurers note that reading it increases one's archery skill. 
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.ARCHERY)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.ARCHERY)
end
