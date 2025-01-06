return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
		  'nvim-lua/plenary.nvim',
		  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
	},
	config = function()
		require('telescope').setup({
			extensions = {
				fzf = {
					fuzzy = true,                    -- false will only do exact matching
					override_generic_sorter = true,  -- override the generic sorter
					override_file_sorter = true,     -- override the file sorter
					case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
			   }
			}
		})
		require('telescope').load_extension('fzf')
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find Files"})
		vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = "Find Word"})
		vim.keymap.set('n', '<leader>fg', "<cmd>Telescope live_grep<CR>", {})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers'})
	end
}
