local mappings = {
  n = {
    ["<leader>m"] = {
      '<cmd> ZenMode <CR>',
      "Which-key all keymaps",
    },
    ["<leader>wk"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "Which-key query lookup",
    },
  },
}

return mappings
