return {
	"rcarriga/nvim-dap-ui",
	tag = "v4.0.0",
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
						{ id = "stacks",      size = 0.5 },
						{ id = "scopes",      size = 0.25 },
						{ id = "breakpoints", size = 0.25 },
					},
					size = 40,
					position = "left",
				},
				{
					elements = {
						{ id = "repl", size = 1 },
						-- { id = "console", size = 0.5 },
					},
					size = 10,
					position = "bottom",
				},
			},
		})
	end,
}
