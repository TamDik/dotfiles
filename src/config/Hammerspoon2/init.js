const WEZTERM = "com.github.wez.wezterm"

hs.hotkey.bind(["alt"], "space", () => {
  const terminal = hs.application.matchingBundleID(WEZTERM)
  if (terminal && terminal.mainWindow && terminal.isActive) {
    terminal.hide()
  } else {
    hs.application.launchOrFocus(WEZTERM)
  }
})
