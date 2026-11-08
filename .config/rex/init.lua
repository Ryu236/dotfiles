-- Rex config migrated from tmux (~/.tmux.conf), Herdr, Ghostty and Alacritty.

-- tmux prefix: ctrl+space. Send it through to programs that use it themselves.
rex.bind("ctrl+space>ctrl+space", "pane.send_key", { key = "ctrl+space" })

-- Pane focus (tmux: bind -r h/j/k/l select-pane)
rex.bind("ctrl+space>h", "pane.focus", { direction = "left" })
rex.bind("ctrl+space>j", "pane.focus", { direction = "down" })
rex.bind("ctrl+space>k", "pane.focus", { direction = "up" })
rex.bind("ctrl+space>l", "pane.focus", { direction = "right" })

-- Pane resize (tmux: bind -r H/J/K/L resize-pane 5)
rex.bind("ctrl+space>shift+h", "pane.resize", { amount = 5, direction = "left" })
rex.bind("ctrl+space>shift+j", "pane.resize", { amount = 5, direction = "down" })
rex.bind("ctrl+space>shift+k", "pane.resize", { amount = 5, direction = "up" })
rex.bind("ctrl+space>shift+l", "pane.resize", { amount = 5, direction = "right" })

-- Repeat mode: stands in for tmux's bind -r repeat timer.
-- ctrl+space then r enters it; enter or escape leaves.
rex.mode("repeat", { exclusive = true })
rex.bind("ctrl+space>r", "client.mode.enter", { name = "repeat" })
rex.bind("repeat/enter", "client.mode.exit")
rex.bind("repeat/escape", "client.mode.exit")

rex.bind("repeat/h", "pane.focus", { direction = "left" })
rex.bind("repeat/j", "pane.focus", { direction = "down" })
rex.bind("repeat/k", "pane.focus", { direction = "up" })
rex.bind("repeat/l", "pane.focus", { direction = "right" })
rex.bind("repeat/shift+h", "pane.resize", { amount = 5, direction = "left" })
rex.bind("repeat/shift+j", "pane.resize", { amount = 5, direction = "down" })
rex.bind("repeat/shift+k", "pane.resize", { amount = 5, direction = "up" })
rex.bind("repeat/shift+l", "pane.resize", { amount = 5, direction = "right" })
