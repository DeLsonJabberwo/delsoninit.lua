function ColorMyPencils(color)
	color = color or "nightfox"
	vim.cmd("colorscheme " .. color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#5c6370", bg = "none" })

	-- Transparent cmp menu, slight background on selected item only
	vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
	vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#3b4261", bold = true })
	vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "none" })
	vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "none" })
end

ColorMyPencils()

-- Defer until after all startup code (plugins, lsp-zero, etc.) is done
vim.schedule(function()
	ColorMyPencils()
end)
