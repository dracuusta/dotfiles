require("config.lazy")
require("config.keymaps")
require("mason").setup()
require("netrw").setup({})
require("lspconfig").ts_ls.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").cssls.setup({})
