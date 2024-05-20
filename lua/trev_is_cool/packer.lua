 -- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
 
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional
      },
  }

  --use {
      --'sainnhe/gruvbox-material', config = function() vim.cmd.colorscheme("gruvbox-material") end 
  --}
  use {
    'sainnhe/everforest', config = function() vim.cmd.colorscheme('everforest') end
  }
  -- For syntax highlighting
  -- At the moment, it doesn't seem like TSUpdate is auto-running. So if you run into issues with treesitter,
  -- run that command
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')

  -- To easily jump between files
  use "nvim-lua/plenary.nvim" 
  use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }

  -- To keep track of changes made to files
  use('mbbill/undotree')

  -- Git configuration
  use('tpope/vim-fugitive')

  -- To easily comment/uncomment lines
  use('preservim/nerdcommenter')

  -- Adds some flare to the bottom of the screen with extra info
  use('vim-airline/vim-airline')

  -- Real time git feedback when editing files
  use('airblade/vim-gitgutter')

  -- To add some context to where you are in your file
  use('simrat39/symbols-outline.nvim') 
  
  -- Linting!
  use('dense-analysis/ale')
  
  -- sorting python imports
  use('stsewd/isort.nvim')

  -- LSP support. The big one!
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
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
