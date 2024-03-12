# nvTrev - From one dummy to another

nvTrev is the hottest new nvim config on the market. With nvTrev, anybody will be able to code just like the legendary Trevor Hauter!

Full disclosure, I made this following Primagens video. You'd best watch it if you'd like to know how I got here. I mean, he didn't have all these plugins but the entire layout and base of this is his. I also didn't watch to the end because I went down a huge rabbit hole so I haven't done the remaps he mentions at the end of his video. Anyways... 
  - https://www.youtube.com/watch?v=w7i4amO_zaE&t=1149s

### Getting started
- Quickstart tutorial - https://github.com/trevorhauter/nvtrev/wiki/Quickstart
- Keybindings - [https://github.com/trevorhauter/nvtrev/wiki/Quickstart](https://github.com/trevorhauter/nvtrev/wiki/Keybindings)
- The rest of the wiki... https://github.com/trevorhauter/nvtrev/wiki
 
### Plugins
We have all kinds of plugins in nvTrev, the current configuration can be found in [packer.lua](https://github.com/trevorhauter/nvtrev/blob/main/lua/trev_is_cool/packer.lua). We have...

- [Telescope](https://github.com/nvim-telescope/telescope.nvim) - To help us find the files we need
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) - To help us navigate the file tree whenever we need it
- [sainnhe/everforest](https://github.com/sainnhe/everforest) - Because every IDE needs a beautiful theme!
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - For syntax highlighting!
- [harpoon](https://github.com/ThePrimeagen/harpoon) - To keep our files close to us and easily jump between them
- [undotree](https://github.com/mbbill/undotree) - To visualize the history of our files (I've never used this)
- [fugitive](https://github.com/tpope/vim-fugitive) - To enable git interactions right inside of nvTrev!
- [nerdcommenter](https://github.com/preservim/nerdcommenter) - To easily be able to comment out lines
- [vim-airline](https://github.com/vim-airline/vim-airline) - To give us a beautiful (and informative!) status bar
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter) - Because I want to see git diff markers every time I make a change in a file!
- [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim) - For LSPs baby! (along with whatever other packer plugins are included in the default lsp-zero config)
- [mason](https://github.com/williamboman/mason.nvim) - (In tandem with lsp-zero) so we can install an lsp server as easy as a packer plugin!
 
