-- Ignore maximize requests from all apps
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})
hl.window_rule({
    name = "fix-xwayland-screen-sharing",
    match = { class = "xwaylandvideobridge" },
    no_initial_focus = true,
    no_focus = true,
    no_anim = true,
    no_blur = true,
    max_size = {1,1},
    opacity = 0.0,
})

hl.window_rule({
    name = "floating-default-size",
    match = { class = "kitty|com.gabm.satty|satty" },
    float = true,
    size = { "(monitor_w*0.8)", "(monitor_h*0.8)" },
})
