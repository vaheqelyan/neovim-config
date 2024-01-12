return {
	"akinsho/bufferline.nvim",
	enabled = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			separator_style = "slant",
		},
	},
	config = function()
		local options = { noremap = true }

		--vim.api.nvim_set_keymap("n", "<C-h>", ":BufferLineCycleNext<CR>", options)
		--vim.api.nvim_set_keymap("n", "<C-l>", ":BufferLineCyclePrev<CR>", options)
	end,
}
