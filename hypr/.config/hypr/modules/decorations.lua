-----------------------
---- LOOK AND FEEL ----
-----------------------

-- https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    general = {
        gaps_in          = 8,
        gaps_out         = 15,
        border_size      = 1,
        resize_on_border = true,
        allow_tearing    = false,

        -- Dracula: borda ativa em roxo
        ["col.active_border"] = "rgb(585D7A)",

        -- Dracula: borda inativa em cinza/roxo escuro
        ["col.inactive_border"] = "rgb(44475A)",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 0.95,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,

            -- Dracula Background
            color = "rgba(282A36ee)",
        },

        blur = {
            enabled  = true,
            size     = 8,
            passes   = 3,
            vibrancy = 0.1696,
	        new_optimizations = true,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Curvas e animações — https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("linear",       { type = "bezier", points = { {0, 0}, {1, 1} } })

hl.animation({ leaf = "windows",    enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",  enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fade",       enabled = true, speed = 3.03, bezier = "linear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "linear",       style = "slide" })
hl.animation({ leaf = "border",     enabled = true, speed = 5.39, bezier = "easeOutQuint" })
