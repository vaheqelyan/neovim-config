return {
	"phaazon/hop.nvim",
	config = function()
		require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
	end,
	keys = {

		{
			"f",
			function()
				local hop = require("hop")
				local directions = require("hop.hint").HintDirection

				hop.hint_words({ direction = directions.AFTER_CURSOR })
			end,
		},

		{
			"F",
			function()
				local hop = require("hop")
				local directions = require("hop.hint").HintDirection

				hop.hint_words({ direction = directions.BEFORE_CURSOR })
			end,
		},
	},
}
