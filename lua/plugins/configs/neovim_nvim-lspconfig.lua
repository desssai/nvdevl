local plugin = {
  "neovim/nvim-lspconfig",
  event = { "BufRead", "BufWinEnter", "BufNewFile" },
  config = function()

    local on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
      require "core.mappings".set ("mappings.neovim_nvim-lspconfig", bufnr )
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem = {
      documentationFormat = {
        "markdown",
        "plaintext",
      },
      snippetSupport = true,
      preselectSupport = true,
      insertReplaceSupport = true,
      labelDetailsSupport = true,
      deprecatedSupport = true,
      commitCharactersSupport = true,
      tagSupport = {
        valueSet = { 1 },
      },
      resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      },
    }

    local servers = {
      "html",
      "cssls",
      "clangd",
      "bashls", -- Bash LSP
      "dockerls", -- Docker LSP
      "docker-compose-language-service", -- Docker-Compose LSP
      "gopls", -- Go LSP
      "marksman", -- Markdown LSP
      "typescript-language-server", -- TS & JS LSP
    }

    local lspconfig = require "lspconfig"
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end

    require "lspconfig".lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,

      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
              [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      },
    }
  end,
}

return plugin
