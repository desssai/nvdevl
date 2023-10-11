-- local augroup = vim.api.nvim_create_augroup
-- local autocmd = vim.api.nvim_create_autocmd
-- local util = require "vim.lsp.util"
-- local clients = {}

-- local signature_window = function(_, result, ctx, config)
--   local bufnr, winner = vim.lsp.handlers.signature_help(_, result, ctx, config)
--   local current_cursor_line = vim.api.nvim_win_get_cursor(0)[1]

--   if winner then
--     if current_cursor_line > 3 then
--       vim.api.nvim_win_set_config(winner, {
--         anchor = "SW",
--         relative = "cursor",
--         row = 0,
--         col = -1,
--       })
--     end
--   end

--   if bufnr and winner then
--     return bufnr, winner
--   end
-- end

-- local check_trigger_char = function(line_to_cursor, triggers)
--   if not triggers then
--     return false
--   end

--   for _, trigger_char in ipairs(triggers) do
--     local current_char = line_to_cursor:sub(#line_to_cursor, #line_to_cursor)
--     local prev_char = line_to_cursor:sub(#line_to_cursor - 1, #line_to_cursor - 1)
--     if current_char == trigger_char then
--       return true
--     end
--     if current_char == " " and prev_char == trigger_char then
--       return true
--     end
--   end
--   return false
-- end

-- local open_signature = function()
--   local triggered = false

--   for _, client in pairs(clients) do
--     local triggers = client.server_capabilities.signatureHelpProvider.triggerCharacters

--     local pos = vim.api.nvim_win_get_cursor(0)
--     local line = vim.api.nvim_get_current_line()
--     local line_to_cursor = line:sub(1, pos[2])

--     if not triggered then
--       triggered = check_trigger_char(line_to_cursor, triggers)
--     end
--   end

--   if triggered then
--     local params = util.make_position_params()
--     vim.lsp.buf_request(
--       0,
--       "textDocument/signatureHelp",
--       params,
--       vim.lsp.with(signature_window, {
--         border = "single",
--         focusable = false,
--         silent = true,
--       })
--     )
--   end
-- end

-- local signature_setup = function(client)
--   table.insert(clients, client)
--   local group = augroup("LspSignature", { clear = false })
--   vim.api.nvim_clear_autocmds { group = group, pattern = "<buffer>" }

--   autocmd("TextChangedI", {
--     group = group,
--     pattern = "<buffer>",
--     callback = function()
--       -- Guard against spamming of method not supported after
--       -- stopping a language serer with LspStop
--       local active_clients = vim.lsp.get_active_clients()
--       if #active_clients < 1 then
--         return
--       end
--       open_signature()
--     end,
--   })
-- end

local plugin = {
  "neovim/nvim-lspconfig",
  event = { "BufRead", "BufWinEnter", "BufNewFile" },
  config = function()

    local lspconfig = require('lspconfig')
    local lsp_defaults = lspconfig.util.default_config

    lsp_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lsp_defaults.capabilities,
      require('cmp_nvim_lsp').default_capabilities()
    )

    local on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      -- if client.server_capabilities.signatureHelpProvider then
      --   signature_setup(client)
      -- end

      if client.supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
      end

      require "core.mappings".set ("mappings.neovim_nvim-lspconfig", bufnr )
    end

    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities.textDocument.completion.completionItem = {
    --   documentationFormat = { "markdown", "plaintext" },
    --   snippetSupport = true,
    --   preselectSupport = true,
    --   insertReplaceSupport = true,
    --   labelDetailsSupport = true,
    --   deprecatedSupport = true,
    --   commitCharactersSupport = true,
    --   tagSupport = { valueSet = { 1 } },
    --   resolveSupport = {
    --     properties = {
    --       "documentation",
    --       "detail",
    --       "additionalTextEdits",
    --     },
    --   },
    -- }

    local servers = {
      "html",
      "cssls",
      "clangd",
      "bashls", -- Bash LSP
      "dockerls", -- Docker LSP
      -- "docker-compose-language-service", -- Docker-Compose LSP
      "gopls", -- Go LSP
      "marksman", -- Markdown LSP
      -- "typescript-language-server", -- TS & JS LSP
    }

    lspconfig.lua_ls.setup {
      on_attach = on_attach,
      capabilities = lsp_defaults.capabilities,

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

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = lsp_defaults.capabilities,
      }
    end
  end,
}

return plugin
