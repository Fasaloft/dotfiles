require("rose-pine").setup({
  styles = {
    transparency = true,
  },
})

vim.cmd("colorscheme rose-pine")
vim.cmd(":hi statusline guibg=NONE")
