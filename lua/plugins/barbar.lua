return {
	"romgrk/barbar.nvim",
	tag = "v1.9.1",
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
	end
}
