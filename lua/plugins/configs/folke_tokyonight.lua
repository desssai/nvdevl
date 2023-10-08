local plugin = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require "tokyonight".setup {

      -- Styles. Can be "Storm", "Moon", "Night" or "Day"
      style = "storm",
      light_style = "day",
      transparent = false,
      terminal_colors = true,

      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark",
        floats = "dark",
      },

      -- Set a darker background on sidebar-like windows
      sidebars = { "qf", "help" },
      day_brightness = 0.3,
      -- Hide inactive statuslines with the standard **StatusLine** and **LuaLine**
      hide_inactive_statusline = false,
      dim_inactive = false,
      -- When `true`, section headers in the lualine theme will be bold
      lualine_bold = false,

      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      ---@param colors ColorScheme
      -- on_colors = function(colors) end,


      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with a Highlights and ColorScheme table
      ---@param highlights Highlights
      ---@param colors ColorScheme
      -- on_highlights = function(highlights, colors) end,

    }
    vim.cmd([[colorscheme tokyonight]])
  end,
}

return plugin

