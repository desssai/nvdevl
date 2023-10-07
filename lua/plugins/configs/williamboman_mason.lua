local ensure_installed = {
  -- LSP SERVERS
  "bash-language-server", -- Bash LSP
  -- "clangd", -- C, C++ LSP
  -- "cmake-language-server", -- CMake LSP
  "dockerfile-language-server", -- Docker LSP
  "docker-compose-language-service", -- Docker-Compose LSP
  "gopls", -- Go LSP
  "lua-language-server", -- Lua LSP
  "marksman", -- Markdown LSP
  "css-lsp", -- CSS LSP
  "html-lsp", -- HTML LSP
  "typescript-language-server", -- TS & JS LSP
  
  -- FORMATTING
  -- "clang-format", -- C, C++ Formatting
  "stylua", -- Lua Formatting
  "gofumpt", -- Go Formatting
  "golines", -- Go lines Formatting
  "goimports", -- Go imports Formatting
  -- "djlint", -- Go & HTML Templates Formatting
  "prettier", -- HTML, CSS, JS Formatting
  "sqlfmt", -- SQL Formatting
  
  -- DEBUGGINF
  -- "codelldb", -- C, C++ Debugger
}

local plugin = {
  "williamboman/mason.nvim",
  cmd = {
    "Mason",
    "MasonLog",
    "MasonInstall",
    "MasonUninstall",
    "MasonInstallAll",
    "MasonUninstallAll",
  },
  config = function()
    require("mason").setup {
      ensure_installed = ensure_installed,

      PATH = "skip",

      ui = {
        icons = {
          package_pending = " ",
          package_installed = "󰄳 ",
          package_uninstalled = " 󰚌",
        },

        keymaps = {
          toggle_server_expand = "<CR>",
          install_server = "i",
          update_server = "u",
          check_server_version = "c",
          update_all_servers = "U",
          check_outdated_servers = "C",
          uninstall_server = "X",
          cancel_installation = "<C-c>",
        },
      },

      max_concurrent_installers = 10,
    }

    -- custom nvchad cmd to install all mason binaries listed
    vim.api.nvim_create_user_command("MasonInstallAll", function()
      vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
    end, {})
  end,
}

return plugin
