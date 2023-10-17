local plugin = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")
		local lsp_defaults = lspconfig.util.default_config

		lsp_defaults.capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false

			-- if client.server_capabilities.signatureHelpProvider then
			--   signature_setup(client)
			-- end

			-- if client.supports_method("textDocument/semanticTokens") then
			-- 	client.server_capabilities.semanticTokensProvider = nil
			-- end

			require("core.mappings").set("mappings.neovim_nvim-lspconfig", bufnr)
		end

		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities.textDocument.completion.completionItem = {
		-- 	documentationFormat = { "markdown", "plaintext" },
		-- 	snippetSupport = true,
		-- 	preselectSupport = true,
		-- 	insertReplaceSupport = true,
		-- 	labelDetailsSupport = true,
		-- 	deprecatedSupport = true,
		-- 	commitCharactersSupport = true,
		-- 	tagSupport = { valueSet = { 1 } },
		-- 	resolveSupport = {
		-- 		properties = {
		-- 			"documentation",
		-- 			"detail",
		-- 			"additionalTextEdits",
		-- 		},
		-- 	},
		-- }

		local servers = {
			"html",
			"cssls",
			"clangd",
			"bashls", -- Bash LSP
			-- "dockerls", -- Docker LSP
			-- "docker-compose-language-service", -- Docker-Compose LSP
			"marksman", -- Markdown LSP
			-- "typescript-language-server", -- TS & JS LSP
		}

		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = lsp_defaults.capabilities,

			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
							[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
						},
						maxPreload = 100000,
						preloadFileSize = 10000,
					},
				},
			},
		})

		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				on_attach = on_attach,
				capabilities = lsp_defaults.capabilities,
			})
		end

		lspconfig["gopls"].setup({
			on_attach = on_attach,
			capabilities = lsp_defaults.capabilities,
			settings = {
				gopls = {
					completeUnimported = true,
					usePlaceholders = true,
					analyses = {
						unusedparams = true,
					},
				},
			},
		})
	end,
}

return plugin
