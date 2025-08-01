vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Remove default LazyVim keymaps
    pcall(vim.keymap.del, "n", "<C-h>")
    pcall(vim.keymap.del, "n", "<C-j>") 
    pcall(vim.keymap.del, "n", "<C-k>")
    pcall(vim.keymap.del, "n", "<C-l>")
    
    -- Remove the arrow key resize mappings
    pcall(vim.keymap.del, "n", "<C-Up>")
    pcall(vim.keymap.del, "n", "<C-Down>")
    pcall(vim.keymap.del, "n", "<C-Left>")
    pcall(vim.keymap.del, "n", "<C-Right>")
    
    -- Arrow keys for window navigation
    vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Go to left window" })
    vim.keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window" })
    vim.keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window" })
    vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Go to right window" })
    
    -- hjkl for window resizing
    vim.keymap.set("n", "<C-h>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease Window Width" })
    vim.keymap.set("n", "<C-l>", "<Cmd>vertical resize +2<CR>", { desc = "Increase Window Width" })
    vim.keymap.set("n", "<C-k>", "<Cmd>resize +2<CR>", { desc = "Increase Window Height" })
    vim.keymap.set("n", "<C-j>", "<Cmd>resize -2<CR>", { desc = "Decrease Window Height" })
  end,
})
