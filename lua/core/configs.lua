-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indent Settings
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Other
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.termguicolors = true

-- Fillchars
vim.opt.fillchars = {
	vert = "│",
	fold = "⠀",
	eob = " ", -- suppress ~ at EndOfBuffer
	-- diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

-- filetype related
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit" },
	callback = function()
		vim.api.nvim_set_option_value("textwidth", 72, { scope = "local" })
	end
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	callback = function()
		vim.api.nvim_set_option_value("textwidth", 0, { scope = "local" })
		vim.api.nvim_set_option_value("wrapmargin", 0, { scope = "local" })
		vim.api.nvim_set_option_value("linebreak", true, { scope = "local" })
	end
})
