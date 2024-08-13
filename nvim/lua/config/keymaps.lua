vim.g.mapleader=" "
local o=vim.opt
--editor options--
o.number=true
o.autoindent=true
o.cursorline=true --highlight screenline of cursor when starting a new line --
o.shiftwidth=2
--remap auto keyword in vim--
vim.keymap.set('n','<leader>pv',vim.cmd.Ex,{
	noremap=true,silent=true})
