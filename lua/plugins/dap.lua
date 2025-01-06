return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		{
			"leoluz/nvim-dap-go",
			config = function()
				require("dap-go").setup()
			end,
		},
	}
}
