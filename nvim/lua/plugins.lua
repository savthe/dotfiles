local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install plugins
return packer.startup(function(use)
	use { 'lewis6991/impatient.nvim', config = [[require('impatient')]] }

	use ( 'wbthomason/packer.nvim' ) -- Have packer manage itself	

  use({ 'haishanh/night-owl.vim', as = 'night-owl', 
  --   config = [[require('config.night-owl')]]
  })

  use { "catppuccin/nvim", as = "catppuccin", config = [[require('config.catppuccin')]] }
  --use { 'yasukotelin/shirotelin', config = [[require('config.shirotelin')]] }

  use 'majutsushi/tagbar'

  use { 'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup {} end, }

  use 'nvim-lua/popup.nvim'

  use { 'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }, 
      config = function() require'telescope'.setup {} end, }

  use { 'onsails/lspkind-nvim', event = "VimEnter" }

  use { 'simrat39/rust-tools.nvim' }

  use { 'hrsh7th/cmp-nvim-lsp' }

  use { 'hrsh7th/nvim-cmp', after = "lspkind-nvim", config = [[require('config.nvim-cmp')]] }

  use { 'hrsh7th/cmp-buffer' }

  use { 'hrsh7th/cmp-path' }

  use { 'hrsh7th/cmp-cmdline' }

  use { 'hrsh7th/cmp-vsnip' }

  use { 'hrsh7th/vim-vsnip' }

  -- use { 'hrsh7th/cmp-nvim-lsp-signature-help', 
  --             after = "nvim-cmp",
  --   config = function()
  --   require'cmp'.setup { sources = { { name = 'nvim_lsp_signature_help' } } }
  --   end,
  -- }
  -- 
  use {'neovim/nvim-lspconfig', config = [[require('config.lsp')]] } 
  --use 'williamboman/nvim-lsp-installer'

  -- use({
  --       "nvimdev/lspsaga.nvim",
  --       branch = "main",
  --       after = "nvim-lspconfig",
  --       config = [[require('config.lspsaga')]] 
  --   })

  use {'nvim-treesitter/nvim-treesitter', config = [[require('config.treesitter')]]}

  use "folke/neodev.nvim"
 
  use 'powerman/vim-plugin-ruscmd'

  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

  use 'tpope/vim-fugitive'

  use {'nvim-lualine/lualine.nvim', 
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = [[require('config.lualine')]], 
  }
  -- use {'akinsho/bufferline.nvim', tag = "*", 
  --    requires = 'nvim-tree/nvim-web-devicons',
  --    config = function() 
  --      vim.opt.termguicolors = true
  --      require('bufferline').setup({
  --       highlights = {
  --           fill = {
  --             fg = NONE,
  --             bg = NONE,
  --           },
  --           background = {
  --             fg = NONE,
  --             bg = NONE,
  --           },
  --         }
  --     }) 
  --    end 
  -- }
	-- use 'dense-analysis/ale'

use { "lewis6991/hover.nvim", after = 'nvim-lspconfig', config = [[require('config.hover')]]}

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
  
end)
--
  -- use({
  --   'rose-pine/neovim',
  --   as = 'rose-pine',
  --   config = function()
  --     require('rose-pine').setup({
  --       dim_nc_background = false,
  --       disable_background = true,
  --       disable_float_background = true,
  --       highlight_groups = {
  --       }
  --     })
  --     vim.cmd('colorscheme rose-pine-moon')
  --     vim.cmd('set colorcolumn=')
  --     vim.cmd [[hi clear CursorLine]]
  --     vim.cmd [[hi CursorLine gui=underline cterm=underline guisp=gray30]]
  --     vim.cmd [[hi LineNr ctermfg=gray guifg=#353535]]
  --     vim.cmd [[hi TelescopeBorder guifg=#aaaaaa guibg=NONE]]
  --     vim.cmd [[hi TelescopeNormal guibg=NONE]]
  --     vim.cmd [[hi TelescopePreviewNormal guibg=NONE]]
  --     vim.cmd [[hi TelescopePromptNormal guibg=NONE]]
  --     vim.cmd [[hi TelescopeResultsNormal guibg=NONE]]
  --     vim.cmd [[hi TelescopeTitle guibg=NONE]]
  --     vim.cmd [[hi TelescopeSelection guibg=grey30]]
  --     vim.cmd [[hi Comment guifg=#637777]]
  --     vim.cmd [[hi FloatBorder guifg=#aaaaaa]]
  --   end
  -- })
  -- use ({"bluz71/vim-nightfly-colors",
  --   config = function()
  --     vim.g.nightflyTransparent = true
  --     vim.cmd('colorscheme nightfly')
  --     vim.cmd('set colorcolumn=')
  --     vim.cmd [[hi clear CursorLine]]
  --     vim.cmd [[hi CursorLine gui=underline cterm=underline guisp=gray30]]
  --     vim.cmd [[hi LineNr ctermfg=gray guifg=#353535]]
  --     vim.cmd [[hi TelescopeBorder guifg=#aaaaaa guibg=NONE]]
  --     vim.cmd [[hi TelescopeNormal guibg=NONE]]
  --     vim.cmd [[hi TelescopePreviewNormal guibg=NONE]]
  --     vim.cmd [[hi TelescopePromptNormal guibg=NONE]]
  --     vim.cmd [[hi TelescopeResultsNormal guibg=NONE]]
  --     vim.cmd [[hi TelescopeTitle guibg=NONE]]
  --     vim.cmd [[hi TelescopeSelection guibg=grey30]]
  --     vim.cmd [[hi Comment guifg=#637777]]
  --     vim.cmd [[hi FloatBorder guifg=#aaaaaa]]
  --     vim.cmd([[highlight DiagnosticVirtualTextError guibg=NONE]])
  --     vim.cmd([[highlight DiagnosticVirtualTextWarn guibg=NONE]])
  --     vim.cmd([[highlight DiagnosticVirtualTextInfo guibg=NONE]])
  --     vim.cmd([[highlight DiagnosticVirtualTextHint guibg=NONE]])
  --   end
  -- })
  -- use ({"EdenEast/nightfox.nvim",
  --   config = function()
  --     require('nightfox').setup({
  --       options = {
  --         transparent = true,
  --       }
  --     })
  --     vim.cmd('colorscheme duskfox')
  --     vim.cmd('set colorcolumn=')
  --     vim.cmd [[hi clear CursorLine]]
  --     vim.cmd [[hi CursorLine gui=underline cterm=underline guisp=gray30]]
  --     vim.cmd [[hi LineNr ctermfg=gray guifg=#353535]]
  --     vim.cmd [[hi TelescopeBorder guifg=#aaaaaa guibg=NONE]]
  --     vim.cmd [[hi TelescopeNormal guibg=NONE]]
  --     vim.cmd [[hi TelescopePreviewNormal guibg=NONE]]
  --     vim.cmd [[hi TelescopePromptNormal guibg=NONE]]
  --     vim.cmd [[hi TelescopeResultsNormal guibg=NONE]]
  --     vim.cmd [[hi TelescopeTitle guibg=NONE]]
  --     vim.cmd [[hi TelescopeSelection guibg=grey30]]
  --     vim.cmd [[hi Comment guifg=#637777]]
  --     vim.cmd [[hi FloatBorder guifg=#aaaaaa]]
  --     vim.cmd([[highlight DiagnosticVirtualTextError guibg=NONE]])
  --     vim.cmd([[highlight DiagnosticVirtualTextWarn guibg=NONE]])
  --     vim.cmd([[highlight DiagnosticVirtualTextInfo guibg=NONE]])
  --     vim.cmd([[highlight DiagnosticVirtualTextHint guibg=NONE]])
  --   end
  -- })
