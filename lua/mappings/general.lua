local mappings = {

  i = {
    -- Go to  beginning and end
    ["<C-s>"] = { "<ESC>^i", "Beginning of line" },
    ["<C-e>"] = { "<End>", "End of line" },

    -- Leave insert mode
    ["jk"] = { "<ESC>", "Leave insert mode" },

    -- Lines Movement
    ["<∆>"] = { "<Esc>:m .+1<CR>==gi", "Move the current line down" },
    ["<˚>"] = { "<Esc>:m .+1<CR>==gi", "Move the current line up" },
  },

  n = {
    -- Clear search highlights
    ["<Esc>"] = { ":noh <CR>", "Clear search highlights" },

    -- Go to  beginning and end
    ["<C-a>"] = { "<ESC>^i", "Beginning of line" },
    ["<C-e>"] = { "<End>i", "End of line" },

    -- Switch Between Windows
    ["<leader>h"] = { "<C-w>h", "Window left" },
    ["<leader>l"] = { "<C-w>l", "Window right" },
    ["<leader>j"] = { "<C-w>j", "Window down" },
    ["<leader>k"] = { "<C-w>k", "Window up" },

    -- File save, save & quit, copy
    ["<C-w>"] = { "<cmd> w <CR>", "Save file" },
    ["<C-q>"] = { "<cmd> q! <CR>", "Save file" },
    ["<C-y>"] = { "<cmd> %y+ <CR>", "Copy whole file" },

    -- Toggle Line Numbers
    ["<leader>nn"] = { "<cmd> set nu! <CR>", "Toggle line number" },
    ["<leader>nr"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },

    -- Buffer Management
    ["n"] = { "<cmd> enew <CR>", "New buffer" },

    -- Window Management
    ["zx"] = { ":close<CR>", "Close current window" },
    ["<leader>v"] = { "<C-w>v", "Split windows vertically" },
    ["<leader>x"] = { "<C-w>s", "Split windows horizontally" },
    ["<leader>b"] = { "<C-w>=", "Balance open windows" },

    -- Lines Movement
    ["∆"] = { ":m .+1<CR>==", "Move the current line down" },
    ["˚"] = { ":m .-2<CR>==", "Move the current line up" },
  },

  v = {
    -- Lines Movement
    ["<∆>"] = { ":m '>+1<CR>gv=gv", "Move selected lines down" },
    ["<˚>"] = { ":m '<-2<CR>gv=gv", "Move selected lines up" },
  },

  t = {
    ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  },

  x = {
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
  },

}

return mappings
