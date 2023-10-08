local plugin = {
  "numToStr/Comment.nvim",
  cmd = { "Comment" },
  init = function()
    require "core.mappings".set "mappings.numtostr_comment"
  end,
  config = function()
    require "Comment".setup {
      padding = true,
      sticky = true,

      ---Ignore blank lines
      ignore = '^$',

      -- Add a comment at the end of line
      extra = {
        eol = '<leader>ca',
      },

      -- The plugin won't create any mappings by itself
      mappings = {
        basic = false,
        extra = true,
    },
  }
  end,
}

return plugin


