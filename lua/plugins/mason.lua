return {
	{
		"williamboman/mason.nvim",
		tag = "v1.10.0",
		config = function()
			require('mason').setup()
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require("mason-lspconfig").setup(
				{
					ensure_installed = { "lua_ls", "gopls" }
				})
		end
	}
}
