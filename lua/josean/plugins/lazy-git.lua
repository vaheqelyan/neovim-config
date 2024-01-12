return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.g.lazygit_floating_window_winblend = 1

		vim.g.lazygit_floating_window_corner_chars = { "╭", "╮", "╰", "╯" }
		vim.g.lazygit_floating_window_scaling_factor = 0.8
	end,
	keys = {
		{
			"<C-g>",
			":LazyGit<CR>",
		},
	},
}
