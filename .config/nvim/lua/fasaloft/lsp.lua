vim.lsp.enable({ "lua_ls", "ts_ls" })

require("mason").setup()

require("blink.cmp").setup({
  completion = {
    menu = { auto_show = true },
    list = { selection = { preselect = true, auto_insert = false } },
  },
  keymap = {
    ["<CR>"] = { "accept", "fallback" },
    ["<C-y>"] = {},
  },
  enabled = function()
    return vim.bo.filetype ~= "markdown"
  end,
})

