vim.g.mapleader = " "

-- Core
vim.o.scrolloff = 8
vim.o.fileencoding = "utf8"

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.wrap = false
vim.o.smartindent = true

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "silent! checktime",
})
vim.o.swapfile = false
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.clipboard = "unnamedplus"

-- Lines number
vim.o.number = true
vim.o.relativenumber = true

-- Tabs
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

-- UI
vim.o.winborder = "rounded"
vim.diagnostic.config({ virtual_text = true })

-- Filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

-- Mapping
vim.keymap.set("n", "<leader>lf", function()
  require("conform").format({ timeout_ms = 2000, lsp_format = "fallback" })
end)

vim.keymap.set("n", "<leader>sv", ":vsplit<CR>")

vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>")
