return {
	"ggandor/leap.nvim",
	config = function()
		require("leap").create_default_mappings()
	end,
	dependencies = {
		"tpope/vim-repeat",
	},
	lazy = false,
	-- keys = {
	-- 	{
	-- 		"f",
	-- 		function()
	-- 			local hop = require("hop")
	-- 			local directions = require("hop.hint").HintDirection
	--
	-- 			hop.hint_words({ direction = directions.AFTER_CURSOR })
	-- 		end,
	-- 	},
	--
	-- 	{
	-- 		"F",
	-- 		function()
	-- 			local hop = require("hop")
	-- 			local directions = require("hop.hint").HintDirection
	--
	-- 			hop.hint_words({ direction = directions.BEFORE_CURSOR })
	-- 		end,
	-- 	},
	-- },
}
