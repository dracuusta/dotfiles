require("config.lazy")
require("config.keymaps")
require("config.settings")
require("mason").setup()
require("lazy").setup("plugins")
require("netrw").setup({})
require'lspconfig'.tsserver.setup{}
require'lspconfig'.pyright.setup{}
