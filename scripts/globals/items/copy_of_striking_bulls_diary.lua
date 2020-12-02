-----------------------------------------
-- ID: 6151
-- Item: Bull's Diary
-- An account penned by Striking Bull during the Second Battle of Konschtat.
-- It details the Republic's victory over King Raigegue the Lupine's San d'Orian army.
-- Adventurers note that reading it increases one's axe skill. 
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.AXE)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.AXE)
end
