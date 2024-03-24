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

-- PackerSync on save
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
	--use { 'lewis6991/impatient.nvim', config = [[require('impatient')]] }

	use { 'wbthomason/packer.nvim' } -- Have packer manage itself	

	use { 'dracula/vim', config = [[require('config.dracula')]] }
  --use { 'haishanh/night-owl.vim', as = 'night-owl', config = [[require('config.night-owl')]] }
  --use { 'catppuccin/nvim', as = "catppuccin", config = [[require('config.catppuccin')]] }
  --use { 'yasukotelin/shirotelin', config = [[require('config.shirotelin')]] }
  --use { "EdenEast/nightfox.nvim", config = [[require('config.nightfox')]] }

  use { 'majutsushi/tagbar' }
  use { 'nvim-tree/nvim-web-devicons' }

  use { 'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup {} end, }

  use { 'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }, 
      config = function() require'telescope'.setup {} end, }

  use {'nvim-lualine/lualine.nvim', 
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = [[require('config.lualine')]], 
  }

  use { 'onsails/lspkind-nvim', event = "VimEnter" }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/nvim-cmp', after = "lspkind-nvim", config = [[require('config.nvim-cmp')]] }
  use { 'hrsh7th/vim-vsnip' }
  use { 'neovim/nvim-lspconfig', config = [[require('config.lsp')]] } 
  use { 'nvim-treesitter/nvim-treesitter', config = [[require('config.treesitter')]] }

  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
  use { "lewis6991/hover.nvim", after = 'nvim-lspconfig', config = [[require('config.hover')]]}
  use { 'folke/trouble.nvim' }

  use { "rust-lang/rust.vim", ft = "rust", }
  use { 'mrcjkb/rustaceanvim', version = '^4', ft = { 'rust' }, }
  use { 'tpope/vim-fugitive' }

  use { 'powerman/vim-plugin-ruscmd' }

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
  
  --use "folke/neodev.nvim"
  --use { 'hrsh7th/cmp-buffer' }
  --use { 'hrsh7th/cmp-path' }
  --use { 'hrsh7th/cmp-cmdline' }
  --use { 'hrsh7th/cmp-vsnip' }

  -- use { 'hrsh7th/cmp-nvim-lsp-signature-help', 
  --             after = "nvim-cmp",
  --   config = function()
  --   require'cmp'.setup { sources = { { name = 'nvim_lsp_signature_help' } } }
  --   end,
  -- }
end)

