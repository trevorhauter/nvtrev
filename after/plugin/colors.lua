function ColorMyPencils(color)
    if vim.fn.has('termguicolors') == 1 then
        vim.opt.termguicolors = true
    end
	color = color or "everforest"
	vim.cmd.colorscheme(color)
        vim.o.background = "light"
    vim.g.everforest_background = 'soft'
    vim.g.everforest_better_performance = 1
end

ColorMyPencils()
