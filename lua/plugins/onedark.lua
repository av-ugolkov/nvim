return {
    "navarasu/onedark.nvim",
    config = function()
        require('onedark').setup({
            transparent = true,
            style = 'deep'
        })
        require('onedark').load()
    end
}
