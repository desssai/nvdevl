local plugin = {
	"numToStr/Comment.nvim",
	cmd = { "Comment" },
	init = function()
		require("core.mappings").set("mappings.numtostr_comment")
	end,
	config = function()
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
