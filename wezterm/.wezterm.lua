local wezterm = require("wezterm")

local config = wezterm.config_builder()
local io = require("io")
local os = require("os")
local brightness = 0.03
local fontSize = 13

-- image setting
local home = os.getenv("HOME")
local background_folder = home .. "/Pictures/Wallpapers/manga"
local function pick_random_background(folder)
  local handle = io.popen('ls "' .. folder .. '"')
  if handle ~= nil then
    local files = handle:read("*a")
    handle:close()

    local images = {}
    for file in string.gmatch(files, "[^\n]+") do
      table.insert(images, file)
    end

    if #images > 0 then
      return folder .. "/" .. images[math.random(#images)]
    else
      return nil
    end
  end
end

config.window_background_image_hsb = {
  -- Darken the background image by reducing it
  brightness = brightness,
  hue = 1.0,
  saturation = 0.8,
}

-- default background
-- local bg_image = "/home/tuanpnt17/Pictures/Personal/2025.png"
local bg_image = ""

config.window_background_image = bg_image
-- end image setting

-- window setting
config.window_background_opacity = 1.0
config.macos_window_background_blur = 85
config.window_padding = {
  left = 7,
  right = 0,
  top = 7,
  bottom = 5,
}

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("CaskaydiaMono Nerd Font", { weight = "Medium", stretch = "Expanded" })
config.font_size = fontSize
config.window_decorations = "NONE"
config.enable_tab_bar = false
config.enable_wayland = false

-- keys
config.keys = {
  {
    key = "b",
    mods = "ALT|CTRL|SHIFT",
    action = wezterm.action_callback(function(window)
      bg_image = pick_random_background(background_folder) or ""
      if bg_image then
        window:set_config_overrides({
          window_background_image = bg_image,
        })
        wezterm.log_info("New bg:" .. bg_image)
      else
        wezterm.log_error("Could not find bg image")
      end
    end),
  },
  {
    key = "L",
    mods = "ALT|CTRL|SHIFT",
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
  {
    key = ">",
    mods = "ALT|CTRL|SHIFT",
    action = wezterm.action_callback(function(window)
      brightness = math.min(brightness + 0.01, 1.0)
      window:set_config_overrides({
        window_background_image_hsb = {
          brightness = brightness,
          hue = 1.0,
          saturation = 0.8,
        },
        window_background_image = bg_image,
      })
    end),
  },
  {
    key = "<",
    mods = "ALT|CTRL|SHIFT",
    action = wezterm.action_callback(function(window)
      brightness = math.max(brightness - 0.01, 0.01)
      window:set_config_overrides({
        window_background_image_hsb = {
          brightness = brightness,
          hue = 1.0,
          saturation = 0.8,
        },
        window_background_image = bg_image,
      })
    end),
  },
  {
    key = "j",
    mods = "ALT|CTRL|SHIFT",
    action = wezterm.action_callback(function(window)
      fontSize = math.max(fontSize - 1, 10)
      window:set_config_overrides({
        font_size = fontSize,
        window_background_image = bg_image,
      })
    end),
  },
  {
    key = "k",
    mods = "ALT|CTRL|SHIFT",
    action = wezterm.action_callback(function(window)
      fontSize = math.min(fontSize + 1, 25)
      window:set_config_overrides({
        font_size = fontSize,
        window_background_image = bg_image,
      })
    end),
  },
}

-- others
config.default_cursor_style = "BlinkingUnderline"
config.cursor_thickness = 2
config.max_fps = 144
return config
