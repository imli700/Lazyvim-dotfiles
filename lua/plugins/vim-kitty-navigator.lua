-- lua/plugins/kitty-navigator.lua
return {
  "knubie/vim-kitty-navigator",
  -- The `build` key runs this shell command after the plugin is
  -- installed or updated. This is the key to automation.
  build = "cp ./*.py ~/.config/kitty/",
}
