local M = {}

local function map(mode, l, r, opts)
	opts = opts or {}
	vim.keymap.set(mode, l, r, opts)
end
vim.g.mapleader = " "
local o = vim.opt
--editor options--
o.number = true
o.autoindent = true
o.cursorline = true --highlight screenline of cursor when starting a new line --
o.shiftwidth = 2
--remap auto keyword in vim--
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {
	noremap = true,
	silent = true,
})
--remap Neotree toggle--

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", {
	noremap = true,
})
-- Automatically save files when leaving insert mode or switching buffers
vim.api.nvim_create_augroup("autosave", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	group = "autosave",
	command = "silent! wall",
})
--LSP
M.lsp_bindings = function()
	map("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
	map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
	map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true })
	map("n", "<A-CR>", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })
	map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })
	map("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true })
	map("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true })
	map("n", "<leader>q", "<cmd>lua vim.diagnostic.setqflist()<CR>", { noremap = true })
	map("n", "<space>D", vim.lsp.buf.type_definition, { noremap = true })
end
