return {
	"numToStr/Comment.nvim",
	tag = "v0.8.0",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function() require("Comment").setup() end
}
