--------------------------------
---- WINDOW RULES ----
--------------------------------
-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({
    name = "floating-waypaper",
    match = { class = "^(waypaper)$" },
    float = true,
    size = { 800, 400 },
    center = true
})

hl.window_rule({
    name = "vscode-transparent",
    match = { class = "^(code)$" },
    opacity = 0.9,
})

hl.window_rule({
    name  = "floating-blueman-manager",
    match = { class = "^(blueman-manager)$" },
    float = true,
    size = { 600, 400 },
    center = true
})

hl.window_rule({
    name  = "floating-pavucontrol",
    match = { class = ".*pavucontrol.*" },
    float = true,
    size = { 600, 400 },
    center = true
})

hl.window_rule({
    -- evita que apps peçam maximize (deixa tudo mais previsível no tiling)
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    -- janelas de picture-in-picture flutuando e sempre no topo
    name  = "pip-float",
    match = { title = "^(Picture-in-Picture)$" },
    float = true,
    pin   = true,
})
