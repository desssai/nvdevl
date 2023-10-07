local plugin = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  event = { "BufRead", "BufWinEnter", "BufNewFile" },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "c", -- Mandatory TS package
        "lua", -- Mandatory TS package
        "vim", -- Mandatory TS package
        "vimdoc", -- Mandatory TS package
        "query", -- Mandatory TS package
        "bash",
        "css",
        "csv",
        "html",
        "javascript",
        "python",
        "cmake",
        "comment",
        "cpp",
        "dockerfile",
        "go",
        "json",
        "markdown",
        "sql",
      },

      highlight = {
        enable = true,
        use_languagetree = true,
      },
      
      indent = { enable = true },
    }
  end,
}

return plugin

