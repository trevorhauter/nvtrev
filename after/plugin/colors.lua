function ColorMyPencils(color)
	color = color or "everforest"
	vim.cmd.colorscheme(color)
        vim.o.background = "dark"
end

ColorMyPencils()
