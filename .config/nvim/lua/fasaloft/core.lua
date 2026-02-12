-- OIL
require("oil").setup({
  keymaps = {
    ["<C-h>"] = false,
    ["<C-l>"] = false,
    ["yp"] = {
      desc = "Copy relative file path",
      callback = function()
        local entry = require("oil").get_cursor_entry()
        local dir = require("oil").get_current_dir()
        if entry and dir then
          local relpath = vim.fn.fnamemodify(dir .. entry.name, ":.")
          vim.fn.setreg("+", relpath)
          vim.notify(relpath, vim.log.levels.INFO)
        end
      end,
    },
  }
})

vim.keymap.set("n", "<leader>e", ":Oil<CR>")


-- MINI.PICK
require("mini.pick").setup()

vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>Pick files<CR>")


-- TREE SITTER
require("nvim-treesitter").setup()

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

