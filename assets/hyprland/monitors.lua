hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})

-- Workspaces 1-5 on the first screen
for i = 1, 5 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "DP-1" })
end

-- Workspaces 6-10 on the second screen
for i = 6, 10 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "DP-2" })
end
