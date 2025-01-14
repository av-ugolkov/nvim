return {
	{
		"FabijanZulj/blame.nvim",
		lazy = false,
		config = function()
			require('blame').setup {}

			vim.keymap.set('n', '<leader>gb', ':BlameToggle virtual<CR>', { silent = true, desc = "Toggle blame" })
		end,
		opts = {
			blame_options = { '-w' },
		},
	},
}
