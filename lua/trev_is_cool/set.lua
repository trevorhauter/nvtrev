-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- The following code is to allow for us to toggle the width of nvim-tree in cases
-- that we have long file names/paths :) (TODO: Should this live somewhere else?)
_G.VIEW_WIDTH_FIXED = 30
_G.view_width_max = _G.VIEW_WIDTH_FIXED -- fixed to start

-- toggle the width and redraw
_G.toggle_width_adaptive = function()
  if _G.view_width_max == -1 then
    _G.view_width_max = _G.VIEW_WIDTH_FIXED
  else
    _G.view_width_max = -1
  end

  require("nvim-tree.api").tree.reload()
end

_G.get_view_width_max = function()
  return _G.view_width_max
end
-- End nvim-tree width logic 

-- Set up the nvim-tree config!
require("nvim-tree").setup({
    view = {
        width = {
            min = 30,
            max = _G.get_view_width_max,
        }
    },
    filters = { custom = { "^.git$", "^.gitignore$" } },
})
-- ^ All of the above lines are nvim-tree config

vim.api.nvim_set_keymap('n', 'A', '<cmd>lua toggle_width_adaptive()<CR>', { noremap = true, silent = true })

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

vim.g.mapleader = " "

vim.o.splitbelow = true
vim.o.splitright = true
