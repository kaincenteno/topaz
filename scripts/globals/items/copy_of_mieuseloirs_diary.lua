-----------------------------------------
-- ID: 6150
-- Item: Mieuseloir's Diary
-- An account penned by Mieuseloir B Enchelles of his encounters with the Gigas in Beaucedine Glacier.
-- Adventurers note that reading it increases one's great sword skill.
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.GREAT_SWORD)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.GREAT_SWORD)
end
