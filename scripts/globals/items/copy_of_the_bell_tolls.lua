-----------------------------------------
-- ID: 6179
-- Item: The Bell Tolls
-- An essay penned by Hrohj Wagrehsa concerning the transmission of Sih Renaye's handbell and the voice of the land.
-- Adventurers note that reading it increases one's handbell skill.
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.HANDBELL)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.HANDBELL)
end
