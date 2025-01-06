return {
	"rmagatti/goto-preview",
	event = "BufEnter",
	-- config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88

	config = function()
		vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
	end
}
