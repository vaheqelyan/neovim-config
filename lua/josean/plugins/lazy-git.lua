return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.g.lazygit_floating_window_winblend = 0

		vim.g.lazygit_floating_window_corner_chars = { "╭", "╮", "╰", "╯" }
		vim.g.lazygit_floating_window_scaling_factor = 0.8
	end,
	keys = {
		{
			"<Leader>g",
			":LazyGit<CR>",
		},
	},
}
