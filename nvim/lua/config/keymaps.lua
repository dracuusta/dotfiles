vim.g.mapleader = " "
local o = vim.opt
o.relativenumber = true
local M = {}

vim.g.mapleader = " "
local o = vim.opt
--editor options--
o.number = true
o.autoindent = true
o.cursorline = true --highlight screenline of cursor when starting a new line --
o.shiftwidth = 2
o.tabstop = 2
o.expandtab = true

local nonoremap = function(mode, lhs, rhs, opts)
  local options = {}
  if opts then
    options = opts
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

nonoremap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
nonoremap("n", "<C-u", "<C-u>zz", { noremap = true, silent = true })
--remap auto keyword in vim--
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {
  noremap = true,
  silent = true,
})
vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])
vim.keymap.set("n", "<C-t>", ":Neotree toggle<CR>", { noremap = true })
vim.keymap.set("n", "<leader>e", ":Neotree toggle position=float<CR>", { noremap = true ,silent=true})
--remap Neotree toggle--

vim.keymap.set("n", "<leader>h", ":Neotree toggle<CR>", {
 noremap = true,silent=true,
})
-- Automatically save files when leaving insert mode or switching buffers
vim.api.nvim_create_augroup("autosave", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  group = "autosave",
  command = "silent! wall",
})
--LSP
