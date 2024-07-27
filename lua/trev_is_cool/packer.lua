local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- ALE - for linting!
  use('dense-analysis/ale')
  
  
  -- AUTO PAIRS - to make pairs work better... duh
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
  } 

  -- EVERFOREST - a beautiful theme!
  use {
    'sainnhe/everforest', config = function() vim.cmd.colorscheme('everforest') end
  }


  -- FUGITIVE - git integration 
  use('tpope/vim-fugitive')


  -- QUICKSCOPE - fast in-line navigation
  use('unblevable/quick-scope')


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


  -- NEOSCROLL - to make scrolling better
  use('karb94/neoscroll.nvim')

  -- NERDCOMMENTER - To easily comment/uncomment lines
  use('preservim/nerdcommenter')


  -- NVIM-JDTLS - For an IDE like experience with Java!
  use('mfussenegger/nvim-jdtls')

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
      -- To me it seems like requiring ripgrep here doesn't actually add it. Am I wrong?
	  requires = { {'nvim-lua/plenary.nvim'}, {'BurntSushi/ripgrep'} } -- plenary is imported above... Do I need this here?
  }


  -- UNDOTREE - To keep track of changes made to files
  use('mbbill/undotree')


  -- VIM-AIRLINE - Adds some flare to the bottom of the screen with extra info
  use('vim-airline/vim-airline')


  -- VIM-GITGUTTER - Real time git feedback when editing files
  use('airblade/vim-gitgutter')


  -- VIM-SURROUND - Makes wrapping crap in quotes or parenthesis or whatever a lot easier
  use('tpope/vim-surround')

  -- VIM-WIKI - For all of my organization, documentation, and note taking needs!
  use('vimwiki/vimwiki') 


  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end


 end) 
