return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dapui = require('dapui')

		-- Инициализация dap-ui (опционально)
		dapui.setup({
			layouts = {
				{
					elements = {
						{ id = "stacks",      size = 0.4 },
						{ id = "scopes",      size = 0.25 },
						{ id = "breakpoints", size = 0.25 },
						{ id = "repl",        size = 0.1 },
					},
					size = 40,
					position = "left",
				},
				{
					elements = {
						{ id = "console", size = 1 },
					},
					size = 10,
					position = "bottom",
				},
			},
		})
	end,
}
