local mainMod = "SUPER"

-- Programs
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("kitty --title Terminal"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("zen-beta"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("kitty --title \"Explorer\" yazi"))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + Delete", hl.dsp.exec_cmd("wlogout --buttons-per-row 5"))

-- Actions
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))

-- Navigation
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Workspaces
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + P", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + N", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.window.move({ workspace = "+1" }))

-- Windows
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + CTRL + LEFT", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + RIGHT", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + UP", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + DOWN", hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + LEFT", hl.dsp.window.move({ monitor = "0" }))
hl.bind(mainMod .. " + SHIFT + RIGHT", hl.dsp.window.move({ monitor = "1" }))

-- System tools
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | satty -f - '))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))
