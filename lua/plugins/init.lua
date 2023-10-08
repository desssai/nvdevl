local plugins = {
  require "plugins.configs.folke_noice",
  require "plugins.configs.folke_trouble",
  require "plugins.configs.folke_zen-mode",
  require "plugins.configs.folke_which-key",
  require "plugins.configs.folke_tokyonight",
  require "plugins.configs.numtostr_comment",
  require "plugins.configs.lewis6991_gitsigns",

  require "plugins.configs.williamboman_mason",
  require "plugins.configs.neovim_nvim-lspconfig",

  require "plugins.configs.nvim-neo-tree_neo-tree",
  require "plugins.configs.nvim-telescope_telescope",
  require "plugins.configs.nvim-treesitter_treesitter",
  require "plugins.configs.lukas-reineke_indent-blankline",
}

local config = require "plugins.configs.folke_lazy"
require "lazy".setup(plugins, config)
