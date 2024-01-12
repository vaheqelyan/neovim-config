return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- set keymaps
		local map = vim.keymap.set

		map("n", "mm", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Mark file with harpoon" })

		map("n", "ml", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Preview harpoon list" })

		-- Define the table
		local myTable = {
			q = 1,
			w = 2,
			e = 3,
			r = 4,
			t = 5,
			y = 6,
			u = 7,
			i = 8,
			o = 9,
		}

		-- Iterate and print key-value pairs
		for key, value in pairs(myTable) do
			map(
				"n",
				"m" .. key,
				"<cmd>lua require('harpoon.ui').nav_file(" .. value .. ")<cr>",
				{ desc = "Navigate to harpoon " .. value }
			)
		end

		map("n", "md", "<cmd>lua require('harpoon.mark').rm_file()<cr>", { desc = "Navigate to harpoon 9" })

		map("n", "mp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Harpoon go to next" })
		map("n", "mn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Harpoon go to prev" })
	end,
}
