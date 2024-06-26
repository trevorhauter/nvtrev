 -- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- ALE - for linting!
  use('dense-analysis/ale')
  

  -- EVERFOREST - a beautiful theme!
  use {
    'sainnhe/everforest', config = function() vim.cmd.colorscheme('everforest') end
  }


  -- FUGITIVE - git integration 
  use('tpope/vim-fugitive')


  -- HARPOON (and dependencies) - To easily jump between files
  use "nvim-lua/plenary.nvim" 
  use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }


  -- ISORT - sorting python imports (might remove)
  use('stsewd/isort.nvim')


  -- LSP-ZERO (includes mason) - LSP support. The big one!
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


  -- NERDCOMMENTER - To easily comment/uncomment lines
  use('preservim/nerdcommenter')


  -- NVIM-TREE - file tree navigation!
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional
      },
  }


  -- NVIM-TREESITTER (and dependencies) - For syntax highlighting
  -- At the moment, it doesn't seem like TSUpdate is auto-running. So if you run into issues with treesitter,
  -- run that command
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')


  -- PACKER - it can manage itself
  use 'wbthomason/packer.nvim'


  -- SYMBOLS-OUTLINE - To add some context to where you are in your file (might remove this...)
  use('simrat39/symbols-outline.nvim') 


  -- TELESCOPE - to help us find what we need anywhere in our project
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} } -- plenary is imported above... Do I need this here?
  }


  -- UNDOTREE - To keep track of changes made to files
  use('mbbill/undotree')


  -- VIM-AIRLINE - Adds some flare to the bottom of the screen with extra info
  use('vim-airline/vim-airline')


  -- VIM-GITGUTTER - Real time git feedback when editing files
  use('airblade/vim-gitgutter')


 end) 
