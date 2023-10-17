local mappings = {
	n = {
		["<leader>dg"] = {
			function()
				require("dap-go").debug_test()
			end,
			"Debug current Go test",
		},
		["<leader>dr"] = {
			function()
				require("dap-go").debug_last()
			end,
			"Debug previous Go test",
		},
	},
}

return mappings
