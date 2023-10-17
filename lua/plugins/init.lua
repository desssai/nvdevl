local plugins = {

	-- Utilities
	require("plugins.configs.folke_noice"),
	require("plugins.configs.folke_which-key"),
	require("plugins.configs.numtostr_comment"),
	require("plugins.configs.nvim-treesitter_treesitter"),

	-- Lsp features
	require("plugins.configs.williamboman_mason"),
	require("plugins.configs.neovim_nvim-lspconfig"),
	require("plugins.configs.hrsh7th_nvim-cmp"),
	require("plugins.configs.nvimtools_none-ls"),

	-- UI elements
	require("plugins.configs.folke_zen-mode"),
	require("plugins.configs.catpuccin_nvim"),
	require("plugins.configs.akinsho_bufferline"),
	require("plugins.configs.nvim-lualine_lualine"),
	require("plugins.configs.lukas-reineke_indent-blankline"),

	-- Workflow
	-- require("plugins.configs.folke_trouble"),
	require("plugins.configs.lewis6991_gitsigns"),
	require("plugins.configs.leoluz_nvim-dap-go"),
	require("plugins.configs.rcarriga_nvim-dap-ui"),
	require("plugins.configs.nvim-neo-tree_neo-tree"),
	require("plugins.configs.nvim-telescope_telescope"),
	require("plugins.configs.kristijanhusak_vim-dadbod-ui"),
}

local config = require("plugins.configs.folke_lazy")
require("lazy").setup(plugins, config)
