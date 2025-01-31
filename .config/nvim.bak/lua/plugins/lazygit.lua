return {
  "kdheepak/lazygit.nvim",
  keys = {
    {
      "<leader>gs",
      ":LazyGit<Return>",
      silent = true,
      noremap = true,
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
