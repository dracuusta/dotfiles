vim.g.mapleader = " "
local o = vim.opt
--editor options--
o.relativenumber = true
o.autoindent = true
o.cursorline = true --highlight screenline of cursor when starting a new line --
o.shiftwidth = 2
--remap auto keyword in vim--
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {
	noremap = true,
	silent = true,
})
vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])
vim.keymap.set("n", "<C-t>", ":Neotree toggle<CR>", { noremap = true })
