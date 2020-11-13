-----------------------------------
-- Area: Yahse_Hunting_Grounds
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.YAHSE_HUNTING_GROUNDS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        CARRIED_OVER_POINTS     = 6999, -- You have carried over <number> points.
        LOGIN_CAMPAIGN_UNDERWAY = 7000, -- The <month> ≺year≻ Login Campaign is currently underway!
        LOGIN_NUMBER            = 7001, -- In celebration of your most recent login no. <number>...
        UNCANNY_SENSATION       = 7858, -- You are assaulted by an uncanny sensation.
        ENERGIES_COURSE         = 7859, -- The arcane energies begin to course within your veins.
        MYSTICAL_WARMTH         = 7860, -- You feel a mystical warmth welling up inside you!
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[tpz.zone.YAHSE_HUNTING_GROUNDS]
