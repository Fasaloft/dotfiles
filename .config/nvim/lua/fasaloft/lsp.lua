vim.lsp.enable({ "lua_ls", "ts_ls" })

require("mason").setup()

require("blink.cmp").setup({
  completion = { menu = { auto_show = true } },
  enabled = function()
    return vim.bo.filetype ~= "markdown"
  end,
})

