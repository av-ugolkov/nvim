return {
	"romgrk/barbar.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- patched fonts support
		"lewis6991/gitsigns.nvim" -- display git status
	},
	init = function() vim.g.barbar_auto_setup = false end,
	config = function()
		local barbar = require("barbar")

		barbar.setup({
			clickable = true, -- Enables/disables clickable tabs
			tabpages = false, -- Enable/disables current/total tabpages indicator (top right corner)
			insert_at_end = true,

			filetype = {
				custom_colors = true,
				enabled = true,
			},

			icons = {
				button = "",
				buffer_index = false,
				buffer_number = false,
				filetype = { enabled = true },
				visible = { modified = { buffer_number = false } },
				gitsigns = {
					added = { enabled = true, icon = "+" },
					changed = { enabled = true, icon = "~" },
					deleted = { enabled = true, icon = "-" }
				}
			}
		})

		-- key maps

		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		-- Move to previous/next
		map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
		map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
		-- Re-order to previous/next
		map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
		map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
		-- Goto buffer in position...
		map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
		-- Pin/unpin buffer
		map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
		-- Close buffer
		map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
		map("n", "<A-b>", "<Cmd>BufferCloseAllButCurrent<CR>", opts)
	end
}
