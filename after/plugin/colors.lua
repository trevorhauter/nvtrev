function ColorMyPencils(color)
    if vim.fn.has('termguicolors') == 1 then
        vim.opt.termguicolors = true
    end
	color = color or "everforest"

    -- Define QuickScope highlights
    -- This updates our highlight colors to be in line with our color scheme automatically!
    vim.cmd([[
        augroup qs_colors
          autocmd!
          autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
          autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
        augroup END
    ]])

	vim.cmd.colorscheme(color)
        vim.o.background = "dark"
    vim.g.everforest_background = 'soft'
    vim.g.everforest_better_performance = 1
end

ColorMyPencils()
