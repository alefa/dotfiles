-- One Dark (and Light) color scheme for Neovim
return {
	{
        "navarasu/onedark.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
        lazy = false,
        config = function()
            require('onedark').setup {
                style = 'dark'
            }
            require('onedark').load()
        end
	},
}
