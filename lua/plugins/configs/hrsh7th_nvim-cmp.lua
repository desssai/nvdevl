local plugin = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {

		require("plugins.configs.l3m0n4d3_luasnip"),
		require("plugins.configs.windwp_nvim-autopairs"),

		-- cmp sources plugins
		{
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
	},

	config = function()
		local function border(hl_name)
			return {
				{ "┌", hl_name },
				{ "─", hl_name },
				{ "┐", hl_name },
				{ "│", hl_name },
				{ "┘", hl_name },
				{ "─", hl_name },
				{ "└", hl_name },
				{ "│", hl_name },
			}
		end

		local cmp_kinds = {
			Text = "  ",
			Method = "  ",
			Function = "  ",
			Constructor = "  ",
			Field = "  ",
			Variable = "  ",
			Class = "  ",
			Interface = "  ",
			Module = "  ",
			Property = "  ",
			Unit = "  ",
			Value = "  ",
			Enum = "  ",
			Keyword = "  ",
			Snippet = "  ",
			Color = "  ",
			File = "  ",
			Reference = "  ",
			Folder = "  ",
			EnumMember = "  ",
			Constant = "  ",
			Struct = "  ",
			Event = "  ",
			Operator = "  ",
			TypeParameter = "  ",
		}

		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "path" },
			},
			view = {
				entries = {
					name = "custom",
					selection_order = "near_cursor",
				},
			},
			completion = {
				completeopt = "menu,menuone,noselect",
			},
			window = {
				completion = {
					side_padding = 1,
					scrollbar = false,
					scrolloff = 1,
					border = border("CmpDocBorder"),
					winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:PmenuSel",
				},
				documentation = {
					border = border("CmpDocBorder"),
					winhighlight = "Normal:CmpDoc",
				},
			},
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = function(entry, item)
					item.kind = (cmp_kinds[item.kind] or "") .. item.kind
					item.menu = ({
						path = "[Path]",
						nvim_lsp = "[Lsp]",
						nvim_lua = "[Lua]",
						buffer = "[Buffer]",
						cmdline = "[Cmd]",
						luasnip = "[LuaSnip]",
					})[entry.source.name]
					return item
				end,
			},
			mapping = require("mappings.hrsh7th_nvim-cmp"),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}
return plugin
