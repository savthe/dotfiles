return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional
  },

  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")

    mason.setup()

    lspconfig.rust_analyzer.setup({})

    local lsp = require('lsp-zero')
    lsp.preset('recommended')

    -- (Optional) Configure lua language server for neovim
    lsp.nvim_workspace()

    lsp.setup()
  end,
}
