-- OIL
require("oil").setup({
  keymaps = {
    ["<C-h>"] = false,
    ["<C-l>"] = false,
    ["<C-p>"] = { desc = "Find files", callback = function() require("telescope.builtin").find_files() end },
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


-- TELESCOPE
local telescope = require("telescope")
telescope.setup()
telescope.load_extension("git_worktree")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files)
vim.keymap.set("n", "<C-p>", builtin.find_files)


-- GIT WORKTREE
require("git-worktree").setup()

vim.keymap.set("n", "<leader>gw", telescope.extensions.git_worktree.git_worktrees)
vim.keymap.set("n", "<leader>gW", telescope.extensions.git_worktree.create_git_worktree)


-- LUALINE
local palette = require("rose-pine.palette")

local function worktree_name()
  local result = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null")
  if vim.v.shell_error ~= 0 then return "" end
  return vim.fn.fnamemodify(vim.trim(result), ":t")
end

require("lualine").setup({
  options = {
    icons_enabled = false,
    section_separators = "",
    component_separators = "",
  },
  sections = {
    lualine_a = { { "mode", color = { fg = palette.muted, bg = "NONE" } } },
    lualine_b = { { worktree_name, color = { fg = palette.pine, bg = "NONE" } } },
    lualine_c = { { "branch", color = { fg = palette.foam, bg = "NONE" } } },
    lualine_x = {},
    lualine_y = {},
    lualine_z = { { "filename", color = { fg = palette.text, bg = "NONE" } } },
  },
})


-- GITSIGNS
require("gitsigns").setup()

vim.keymap.set("n", "<leader>gh", require("gitsigns").blame_line)
vim.keymap.set("n", "<leader>gd", require("gitsigns").preview_hunk)


-- CONFORM (format on save)
require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 2000,
    lsp_format = "fallback",
  },
})


-- TREE SITTER
require("nvim-treesitter").setup()

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
