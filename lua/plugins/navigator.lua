return {
	"ray-x/navigator.lua",
	dependencies = {
		{ "hrsh7th/nvim-cmp" }, { "nvim-treesitter/nvim-treesitter" },
		{ "ray-x/guihua.lua", run = "cd lua/fzy && make" }, {
		"ray-x/go.nvim",
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()'
	}, {
		"ray-x/lsp_signature.nvim", -- Show function signature when you type
		event = "VeryLazy",
		config = function() require("lsp_signature").setup() end
	}
	},
	config = function()
		require("go").setup()
		require("navigator").setup({
			lsp_signature_help = true, -- enable ray-x/lsp_signature
			lsp = { format_on_save = true }
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "go" },
			callback = function(ev)
				-- CTRL/control keymaps
				vim.api.nvim_buf_set_keymap(0, "n", "<C-i>", ":GoImport<CR>", { desc = "go import" })
				vim.api.nvim_buf_set_keymap(0, "n", "<C-b>", ":GoBuild %:h<CR>", { desc = "go build" })
				vim.api.nvim_buf_set_keymap(0, "n", "<C-t>", ":GoTestPkg<CR>", { desc = "go test" })
				vim.api.nvim_buf_set_keymap(0, "n", "<C-c>", ":GoCoverage -p<CR>", { desc = "go test coverage" })

				-- Opens test files
				vim.api.nvim_buf_set_keymap(0, "n", "A", ":lua require('go.alternate').switch(true, '')<CR>", {})
				vim.api.nvim_buf_set_keymap(0, "n", "V", ":lua require('go.alternate').switch(true, 'vsplit')<CR>", {})
				vim.api.nvim_buf_set_keymap(0, "n", "S", ":lua require('go.alternate').switch(true, 'split')<CR>", {})
			end,
			group = vim.api.nvim_create_augroup("go_autocommands", { clear = true })
		})
	end
}
