require("config.lazy")
require("config.keymaps")
require("mason").setup()
require("netrw").setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").cssls.setup({})
