-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- The following code is to allow for us to toggle the width of nvim-tree in cases
-- that we have long file names/paths :) (TODO: Should this live somewhere else?)
local VIEW_WIDTH_FIXED = 30
local view_width_max = VIEW_WIDTH_FIXED -- fixed to start

-- toggle the width and redraw
local function toggle_width_adaptive()
  if view_width_max == -1 then
    view_width_max = VIEW_WIDTH_FIXED
  else
    view_width_max = -1
  end

  require("nvim-tree.api").tree.reload()
end

local function get_view_width_max()
  return view_width_max
end
-- End nvim-tree width logic 

-- Set up the nvim-tree config!
require("nvim-tree").setup({
    view = {
        width = {
            min = 30,
            max = get_view_width_max,
        }
    },
    filters = { custom = { "^.git$", "^.gitignore$" } },
    -- Should we be binding this here? With the given structure of this config, I'm not so sure. I will have to revisit
    -- this when I become smarter. Good luck future me!
    on_attach = function ()
        vim.keymap.set('n', 'A', toggle_width_adaptive, { noremap = true, silent = true, expr = false, script = false })
    end
})
-- ^ All of the above lines are nvim-tree config

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
