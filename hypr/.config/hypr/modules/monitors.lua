-------------------
---- MONITORES ----
-------------------
-- https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Monitor principal
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "preferred",
    position = "auto",
    scale    = "1.00",
})
-- Monitor do notebook
hl.monitor({
    output   = "eDP-1",
    mode     = "preferred",
    position = "auto",
    scale    = "1.2",
})
