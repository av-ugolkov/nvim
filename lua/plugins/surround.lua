return {
	"kylechui/nvim-surround",
	tag = "v2.3.1",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/nvim-treesitter-textobjects"
	},
	event = "VeryLazy",
	config = function() require("nvim-surround").setup() end
}
