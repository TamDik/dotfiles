hs.hotkey.bind({"alt"}, "space", function()
    local terminal = hs.application.find('wezterm')
    local awin = terminal:mainWindow()
    if awin and terminal:isFrontmost() then
        terminal:hide()
    else
        terminal = hs.application.launchOrFocus("/Applications/WezTerm.app")
    end
end)
