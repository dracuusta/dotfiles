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
o.termguicolors=true

vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])

--NeoTree Toggles--
vim.keymap.set("n", "<C-t>", ":Neotree toggle<CR>", { noremap = true })
vim.keymap.set("n", "<leader>e", ":Neotree toggle position=float<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":Neotree toggle<CR>", {
	noremap = true,
	silent = true,
})
vim.keymap.set("n","<leader>y","")
vim.keymap.set("v","<leader>h",'<C-w>h',{noremap=true,silent=true})
vim.keymap.set('v', '<leader>l', '<C-w>l', {noremap=true,silent=true})
vim.keymap.set('v', '<leader>j', '<C-w>j', {noremap=true,silent=true})
vim.keymap.set('v', '<leader>k', '<C-w>k', {noremap=true,silent=true})
vim.keymap.set('v','<leader>y','"+y',{noremap=true,silent=true})
vim.keymap.set('n', '<A-1>', ':BufferGoto 1<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<A-2>', ':BufferGoto 2<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<A-3>', ':BufferGoto 3<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<A-4>', ':BufferGoto 4<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<A-5>', ':BufferGoto 5<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<A-6>', ':BufferGoto 6<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<A-7>', ':BufferGoto 7<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<A-8>', ':BufferGoto 8<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<A-9>', ':BufferGoto 9<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<A-0>', ':BufferLast<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<leader>b', ":BufferPick<CR>", {noremap=true})

--General--
vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {
	noremap = true,
	silent = true,
})
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Automatically save files when leaving insert mode or switching buffers
vim.api.nvim_create_augroup("autosave", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	group = "autosave",
	command = "silent! wall",
})

--buffer shortcuts--
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { remap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { remap = true, silent = true })
