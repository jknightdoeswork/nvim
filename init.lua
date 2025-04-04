vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = true
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
vim.opt.breakindent = true
vim.opt.updatetime = 250
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.g.have_nerd_font = false
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 30

-- Keymaps
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Map Ctrl+C to Esc" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-c>", "<cmd>nohlsearch<CR>")
-- Navigate diagnostics
vim.keymap.set("n", "<leader>ne", function()
	vim.diagnostic.goto_next({severity=vim.diagnostic.severity.ERROR})
end, { noremap = true, silent = true, desc = "[N]ext [E]rror" })

vim.keymap.set("n", "<leader>pe", function() 
	vim.diagnostic.goto_prev({severity=vim.diagnostic.severity.ERROR})
end, { noremap = true, silent = true, desc = "[P]revious [E]rror" })

vim.opt.showmode = false
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

require("config.lazy")
