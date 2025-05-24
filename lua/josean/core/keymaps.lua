-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
-- keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

-- clear search highlights
-- keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

keymap.set("n", "ga", "^", { desc = "Start at ^" })
keymap.set("n", "gl", "$", { desc = "Start at end" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })                   -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>h", { desc = "Split window horizontally" })                 -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })                    -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })               -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "yp", ":let @+=expand('%')<CR>", { desc = "Yank file's path" })

keymap.set("n", "L", "$")
keymap.set("n", "H", "^")

keymap.set("n", "<C-h>", ":tabprevious<CR>")
keymap.set("n", "<C-l>", ":tabnext<CR>")

-- keymap.set("n", "<leader>l", "<C-w>l")
-- keymap.set("n", "<leader>h", "<C-w>h")
-- keymap.set("n", "<leader>j", "<C-w>j")
-- keymap.set("n", "<leader>k", "<C-w>k")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
