return {
	"kevinhwang91/rnvimr",
	keys = {
		{ "<C-k><C-b>", ":RnvimrToggle<CR>" },
	},
	config = function()
		local g = vim.g
		local fn = vim.fn

		vim.keymap.set("n", "<C-k><C-b>", ":RnvimrToggle<CR>")

		vim.cmd([[
      autocmd VimEnter * RnvimrToggle
    ]])

		g.rnvimr_border_attr = {
			fg = 84,
			bg = -1,
		}
		g.rnvimr_enable_picker = true
		g.rnvimr_shadow_winblend = 50
		g.rnvimr_enable_ex = true

		g.rnvimr_action = {
			["<C-t>"] = "NvimEdit tabedit",
			["<C-x>"] = "NvimEdit split",
			["<C-v>"] = "NvimEdit vsplit",
			["<CR>"] = "NvimEdit tabedit",
		}

		g.rnvimr_layout = {
			relative = "editor",
			width = fn.float2nr(fn.round(0.6 * vim.api.nvim_get_option("columns"))),
			height = fn.float2nr(fn.round(0.6 * vim.api.nvim_get_option("lines"))),
			col = fn.float2nr(fn.round(0.15 * vim.api.nvim_get_option("columns"))),
			row = fn.float2nr(fn.round(0.15 * vim.api.nvim_get_option("lines"))),
			style = "minimal",
		}
	end,
}
