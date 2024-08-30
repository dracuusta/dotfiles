local M = {}
vim.g.mapleader = " "
local o = vim.opt
--editor options--
o.relativenumber = true
o.number = true
o.autoindent = true
o.cursorline = true --highlight screenline of cursor when starting a new line --
o.shiftwidth = 1
o.tabstop = 4
o.expandtab = true


vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])

--NeoTree Toggles--
vim.keymap.set("n", "<C-t>", ":Neotree toggle<CR>", { noremap = true })
vim.keymap.set("n", "<leader>e", ":Neotree toggle position=float<CR>", { noremap = true ,silent=true})
vim.keymap.set("n", "<leader>h", ":Neotree toggle<CR>", {
 noremap = true,silent=true,
})

--General--
vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>", { noremap = true ,silent=true})
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {
  noremap = true,
  silent = true,
})
nonoremap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
nonoremap("n", "<C-u", "<C-u>zz", { noremap = true, silent = true })
-- Automatically save files when leaving insert mode or switching buffers
vim.api.nvim_create_augroup("autosave", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  group = "autosave",
  command = "silent! wall",
})

--buffer shortcuts--
vim.keymap.set("n","<Tab>",":bnext<CR>",{remap=true,silent=true})
vim.keymap.set("n","<S-Tab>",":bprev<CR>",{remap=true,silent=true})
