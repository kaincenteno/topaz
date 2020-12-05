-----------------------------------------
-- ID: 6176
-- Item: Astral Homeland
-- A specious work written by an unknown individual that both reads and feels like an illusion from the ancient past.
-- It discusses the world avatars inhabit, but seems too absurd to be true.
-- Adventurers note that reading it increases one's summoning magic skill. 
-----------------------------------------
require("scripts/globals/item_utils")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return item_utils.skillBookCheck(target, tpz.skill.SUMMONING_MAGIC)
end

function onItemUse(target)
    item_utils.skillBookUse(target, tpz.skill.SUMMONING_MAGIC)
end
