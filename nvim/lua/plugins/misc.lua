return {
  {
    "majutsushi/tagbar",
  },

  {
    "tpope/vim-fugitive",
  },

  {
    "numToStr/Comment.nvim",

    config = function()
      require('Comment').setup()
    end,
  },
}
