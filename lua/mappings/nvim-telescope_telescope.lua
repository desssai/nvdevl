local Telescope = {

  n = {
    -- Telescope find hotkeys
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>f?"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "Available mappings" },
    ["<leader>fh"] = { "<cmd> Telescope highlights <CR>", "Find highlighted text" },
    ["<leader>fd"] = { "<cmd> Telescope diagnostics <CR>", "Suggested diagnostics" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },

    -- Telescope git hotkeys
    ["<leader>fgc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>fgf"] = { "<cmd> Telescope git_bcommits <CR>", "Git commits for current file" },
    ["<leader>fgs"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<leader>fgb"] = { "<cmd> Telescope git_branches <CR>", "Git Branches" },
  },
}

return Telescope
