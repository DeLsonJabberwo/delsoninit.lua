-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('lazy').setup({
  {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  -- Colorschemes
  {
	  'rose-pine/neovim',
	  name = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  },

  {
	  'EdenEast/nightfox.nvim',
	  name = 'nightfox',
	  config = function()
		  vim.cmd('colorscheme nightfox')
	  end
  },

  {
      'uloco/bluloco.nvim',
      name = 'bluloco',
      lazy = false,
      priority = 1000,
      dependencies = { 'rktjmp/lush.nvim' },
      config = function()
          -- your optional config goes here, see below.
      end,
  },

  {
	  'rebelot/kanagawa.nvim',
	  name = 'kanagawa',
	  config = function()
		  vim.cmd('colorscheme kanagawa')
	  end
  },

  {
	  'navarasu/onedark.nvim',
	  name = 'onedark',
	  config = function()
		  vim.cmd('colorscheme onedark')
	  end
  },

  {
	  'bluz71/vim-nightfly-colors',
	  name = 'nightfly',
	  config = function()
		  vim.cmd('colorscheme nightfly')
	  end
  },

  {
	  'bluz71/vim-moonfly-colors',
	  name = 'moonfly',
	  config = function()
		  vim.cmd('colorscheme moonfly')
	  end
  },

  {
	  'ray-x/aurora',
	  name = 'aurora',
	  config = function()
		  vim.cmd('colorscheme aurora')
	  end
  },

  {
	  'yonlu/omni.vim',
	  name = 'omni',
	  config = function()
		  vim.cmd('colorscheme omni')
	  end
  },

  {
	  'nvim-treesitter/nvim-treesitter',
	  build = ':TSUpdate'
  },

  {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" }
  },

  'nvim-treesitter/playground',
  'mbbill/undotree',
  'tpope/vim-fugitive',
--  'github/copilot.vim',
  'junegunn/goyo.vim',
--  'Exafunction/codeium.vim',
--  'm4xshen/autoclose.nvim',
  'ThePrimeagen/vim-apm',

  {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  dependencies = {
		  --- Uncomment these if you want to manage LSP servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }

})
