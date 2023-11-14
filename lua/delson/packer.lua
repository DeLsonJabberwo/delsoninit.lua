-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use ({
	  'EdenEast/nightfox.nvim',
	  as = 'nightfox',
	  config = function()
		  vim.cmd('colorscheme nightfox')
	  end
  })

  use ({
	  'rebelot/kanagawa.nvim',
	  as = 'kanagawa',
	  config = function()
		  vim.cmd('colorscheme kanagawa')
	  end
  })

  use ({
	  'navarasu/onedark.nvim',
	  as = 'onedark',
	  config = function()
		  vim.cmd('colorscheme onedark')
	  end
  })

  use ({
	  'bluz71/vim-nightfly-colors',
	  as = 'nightfly',
	  config = function()
		  vim.cmd('colorscheme nightfly')
	  end
  })

  use ({
	  'bluz71/vim-moonfly-colors',
	  as = 'moonfly',
	  config = function()
		  vim.cmd('colorscheme moonfly')
	  end
  })

  use ({
	  'ray-x/aurora',
	  as = 'aurora',
	  config = function()
		  vim.cmd('colorscheme aurora')
	  end
  })

  use ({
	  'yonlu/omni.vim',
	  as = 'omni',
	  config = function()
		  vim.cmd('colorscheme omni')
	  end
  })

  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
  }

  use ('nvim-treesitter/playground')
  use ('theprimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use ('Exafunction/codeium.vim')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
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

end)
