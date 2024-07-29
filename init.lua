require("josean.core")
require("josean.lazy")

function get_start_of_word_under_cursor(line_content, col)
	local word = ""
	local forward = col + 1
	local backward = col
	local forwardbreak = false
	local backwardbreak = false

	local i = 0
	while true do
		i = i + 1

		if not forwardbreak then
			local forwardchar = line_content:sub(forward, forward)
			-- Use \k that is a vim atom pattern for keyword
			if forwardbreak or nil == forwardchar:match("[a-zA-Z0-9.px]") then
				forwardbreak = true

				-- If the first character is not a word character, then break
				if i == 1 then
					backwardbreak = true
				end
			else
				word = word .. forwardchar
				forward = forward + 1
			end
		end

		if not backwardbreak then
			local backwardchar = line_content:sub(backward, backward)
			if backwardbreak or nil == backwardchar:match("[a-zA-Z0-9.px]") then
				backwardbreak = true
			else
				word = backwardchar .. word
				backward = backward - 1
			end
		end

		if forwardbreak and backwardbreak then
			break
		end
	end

	return { word, backward, forward - 1 }
end

function rem_to_px(rem_value, root_font_size)
	-- Check if root_font_size is provided, default to 16 if not
	root_font_size = root_font_size or 16

	-- Remove the 'rem' suffix and convert to number
	local rem_number = tonumber(rem_value:match("([%d%.]+)rem"))

	if not rem_number then
		return nil, "Invalid rem value"
	end

	-- Convert rem to px
	local px_value = rem_number * root_font_size
	return string.format("%.2fpx", px_value)
end

function px_to_rem(px_str, root_font_size)
	-- Default root font size if not provided
	root_font_size = root_font_size or 16

	-- Ensure the root font size is valid
	if type(root_font_size) ~= "number" then
		error("root_font_size must be a number.")
	end

	-- Extract the numeric part from the px string
	local px = tonumber(px_str:match("(%d+)"))
	if not px then
		error("Invalid px value. Must be a string with a numeric value followed by 'px'.")
	end

	-- Calculate rem value
	local rem = px / root_font_size

	-- Return the result as a string with the "rem" unit
	return string.format("%.2frem", rem)
end

vim.api.nvim_create_user_command("Px2Rem", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	local line_content = vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1]

	local input, word_start, word_end = unpack(get_start_of_word_under_cursor(line_content, col))

	vim.api.nvim_buf_set_text(bufnr, line - 1, word_start, line - 1, word_end, { px_to_rem(input, 16) })
end, {})

vim.api.nvim_create_user_command("Rem2Px", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	local line_content = vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1]
	local input, word_start, word_end = unpack(get_start_of_word_under_cursor(line_content, col))

	print(rem_to_px(input, 16))

	vim.api.nvim_buf_set_text(bufnr, line - 1, word_start, line - 1, word_end, { rem_to_px(input, 16) })
end, {})

-- local ns_id = vim.api.nvim_create_namespace("my_virtual_text")
--
-- local function show_virtual_text()
-- 	local buf = vim.api.nvim_get_current_buf()
-- 	local win = vim.api.nvim_get_current_win()
-- 	local line = unpack(vim.api.nvim_win_get_cursor(win))
--
-- 	vim.api.nvim_buf_clear_namespace(buf, ns_id, 0, -1)
--
-- 	vim.api.nvim_buf_set_extmark(buf, ns_id, line - 1, 0, {
-- 		virt_text = { { "Virtual Text Here", "Comment" } },
-- 		virt_text_pos = "eol",
-- 		hl_mode = "combine",
-- 	})
-- end

-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "CursorMoved", "CursorMovedI" }, {
-- 	callback = show_virtual_text,
-- 	pattern = "*.html,*.css,*.sass,*.scss,*.less",
-- 	group = vim.api.nvim_create_augroup("VirtualTextGroup", { clear = true }),
-- })
