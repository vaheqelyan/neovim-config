return {
	"zootedb0t/citruszest.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("citruszest").setup({
			option = {
				transparent = true, -- Enable/Disable transparency
			},
			-- Override default highlight style in this table
			-- E.g If you want to override `Constant` highlight style
			style = {
				-- This will change Constant foreground color and make it bold.
				Comment = { italic = true },
			},
		})

		vim.cmd("colorscheme citruszest")
	end,
}
