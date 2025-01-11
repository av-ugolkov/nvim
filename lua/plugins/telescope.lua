return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			enabled = true
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist +
							actions.open_qflist    -- send selected to quickfixlist
					}
				}
			},
		})

		telescope.load_extension("fzf")

		local builtin = require("telescope.builtin")

		-- key maps

		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		map("n", "<leader>ff", builtin.find_files, opts)
		map('n', '<leader>fw', builtin.live_grep, { desc = "Find Word" })
		map("n", "<leader>fx", builtin.treesitter, opts)
		map("n", "<leader>fs", builtin.spell_suggest, opts)
	end
}
