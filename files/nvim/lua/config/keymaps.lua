local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "v" }, "j", "gj", { noremap = true })
vim.keymap.set({ "n", "v" }, "k", "gk", { noremap = true })
vim.keymap.set("n", "<S-h>", "^", opts)
vim.keymap.set("n", "<S-l>", "$", opts)
vim.keymap.set("n", "<S-j>", "}", opts)
vim.keymap.set("n", "<S-k>", "{", opts)

vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("n", "s", '"_s', { noremap = true })

vim.keymap.set("i", "{}", "{}<Left>", opts)
vim.keymap.set("i", "[]", "[]<Left>", opts)
vim.keymap.set("i", '""', '""<Left>', opts)
vim.keymap.set("i", "''", "''<Left>", opts)
vim.keymap.set("i", "<>", "<><Left>", opts)

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Lazy Manager" })
vim.keymap.set("n", "<leader><leader>", "<cmd>Lazy sync<CR>", { desc = "Lazy Sync" })

if vim.fn.executable("lazydocker") == 1 then
  vim.keymap.set("n", "<leader>dd", function()
    Snacks.terminal("lazydocker", { esc_esc = false, ctrl_hjkl = false })
  end, { desc = "Lazydocker" })
end

vim.keymap.set({"n", "x", "o"}, "<A-Up>", function()
  require("flash").treesitter({
    actions = {
      ["<A-Up>"] = "next",
      ["<A-Down>"] = "prev"
    }
  })
end, { desc = "Treesitter incremental selection" })
