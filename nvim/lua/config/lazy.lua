local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({

	spec = {
		-- import your plugins
		{ import = "plugins" },
		{ "prichrd/netrw.nvim", opts = {} },
		{
			"williamboman/mason.nvim",
			dependencies = {
				"williamboman/mason-lspconfig.nvim",
				"WhoIsSethDaniel/mason-tool-installer.nvim",
			},
			config = function()
				require("mason").setup()

				require("mason-lspconfig").setup({
					automatic_installation = true,
					ensure_installed = {
						"cssls",
						"eslint",
						"html",
						"jsonls",
						"tsserver",
						"pyright",
						"tailwindcss",
					},
				})

				require("mason-tool-installer").setup({
					ensure_installed = {
						"prettier",
						"stylua", -- lua formatter
						"isort", -- python formatter
						"black", -- python formatter
						"pylint",
						"eslint_d",
					},
				})
			end,
		},
		{
			"camspiers/luarocks",
			dependencies = {
				"rcarriga/nvim-notify", -- Optional dependency
			},
			opts = {
				rocks = { "fzy" }, -- Specify LuaRocks packages to install
			},
		},
	},
	checker = { enabled = true },
})
