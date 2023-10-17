local plugin = {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "InsertEnter" },
	config = function()
		require("core.mappings").set("mappings.numtostr_comment")
		require("Comment").setup({
			padding = true,
			sticky = true,

			---Ignore blank lines
			ignore = "^$",

			-- The plugin won't create any mappings by itself
			mappings = {
				basic = false,
				extra = false,
			},
		})
	end,
}

return plugin
