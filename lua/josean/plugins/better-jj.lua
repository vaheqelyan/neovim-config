return {
	"max397574/better-escape.nvim",
	config = function()
		require("better_escape").setup({
			mappings = {
				i = {
					j = {
						k = false,
					},
				},

				s = {
					j = {
						k = false,
					},
				},

				v = {
					j = {
						k = false,
					},
				},

				t = {
					j = {
						k = false,
					},
				},

				c = {
					j = {
						k = false,
					},
				},
			},
		})
	end,
}
