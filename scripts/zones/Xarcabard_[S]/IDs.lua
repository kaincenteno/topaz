-----------------------------------
-- Area: Xarcabard_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.XARCABARD_S] =
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
        HOMEPOINT_SET           = 8748, -- Home point set!
    },
    mob =
    {
        GRAOULLY_PH =
        {
            [17338384] = 17338386,
        },
    },
    npc =
    {
    },
}

return zones[tpz.zone.XARCABARD_S]
