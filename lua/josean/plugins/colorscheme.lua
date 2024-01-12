return {
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({
				options = {
					transprent = true,
					styles = {
						comments = "italic",
						functions = "italic",
					},
				},
				darken = {
					floats = true,
				},
			})

			vim.cmd("colorscheme github_dark_high_contrast")
		end,
	},
}
