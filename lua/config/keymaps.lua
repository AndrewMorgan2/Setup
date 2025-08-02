vim.keymap.del("n", "<C-h>", { silent = true })
vim.keymap.del("n", "<C-j>", { silent = true })
vim.keymap.del("n", "<C-k>", { silent = true })
vim.keymap.del("n", "<C-l>", { silent = true })
vim.keymap.del("n", "<C-Up>", { silent = true })
vim.keymap.del("n", "<C-Down>", { silent = true })
vim.keymap.del("n", "<C-Left>", { silent = true })
vim.keymap.del("n", "<C-Right>", { silent = true })

-- Set new mappings
vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Go to right window" })

vim.keymap.set("n", "<C-h>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-l>", "<Cmd>vertical resize +2<CR>", { desc = "Increase Window Width" })
vim.keymap.set("n", "<C-k>", "<Cmd>resize +2<CR>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-j>", "<Cmd>resize -2<CR>", { desc = "Decrease Window Height" })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Also set up a delayed override in case LazyVim loads later
vim.defer_fn(function()
  vim.keymap.set("n", "<C-h>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease Window Width" })
  vim.keymap.set("n", "<C-l>", "<Cmd>vertical resize +2<CR>", { desc = "Increase Window Width" })
  vim.keymap.set("n", "<C-k>", "<Cmd>resize +2<CR>", { desc = "Increase Window Height" })
  vim.keymap.set("n", "<C-j>", "<Cmd>resize -2<CR>", { desc = "Decrease Window Height" })
end, 100)
