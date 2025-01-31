local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	local git_repo = "git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable"
	vim.fn.system({ git_repo, lazypath })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("fasaloft.plugins")
