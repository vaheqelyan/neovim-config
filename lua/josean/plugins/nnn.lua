return {
	"luukvbaal/nnn.nvim",
	keys = { { "<leader>n", "<cmd>NnnPicker %:p:h<CR>", desc = "Toggle nnn" } },
	config = function()
		local builtin = require("nnn").builtin

		require("nnn").setup({
			mappings = {
				{ "<C-t>", builtin.open_in_tab }, -- open file(s) in tab
				{ "<C-h>", builtin.open_in_split }, -- open file(s) in split
				{ "<C-v>", builtin.open_in_vsplit }, -- open file(s) in vertical split
				{ "<C-p>", builtin.open_in_preview }, -- open file in preview split keeping nnn focused
				{ "<C-y>", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
				{ "<C-w>", builtin.cd_to_path }, -- cd to file directory
				{ "<C-e>", builtin.populate_cmdline }, -- populate cmdline (:) with file(s)
			},
			picker = {
				cmd = "nnn", -- command override (-p flag is implied)
				style = {
					width = 0.5, -- percentage relative to terminal size when < 1, absolute otherwise
					height = 0.5, -- ^
					xoffset = 0.5, -- ^
					yoffset = 0.5, -- ^
					border = "rounded", -- border decoration for example "rounded"(:h nvim_open_win)
				},
				session = "", -- or "global" / "local" / "shared"
				tabs = true, -- separate nnn instance per tab
				fullscreen = false, -- whether to fullscreen picker window when current tab is empty
			},
		})
	end,
}
