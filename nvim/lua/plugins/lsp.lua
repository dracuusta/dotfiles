return { "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        local nvim_lsp = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Function to set up LSP keybindings
        local on_attach = function(client, bufnr)
            local buf_set_keymap = function(mode, lhs, rhs, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, lhs, rhs, opts)
            end

            -- Keybindings buf_set_keymap('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
            buf_set_keymap('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })
            buf_set_keymap('n', 'gr', vim.lsp.buf.references, { desc = "Find references" })
            buf_set_keymap('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to implementation" })
            buf_set_keymap('n', 'K', vim.lsp.buf.hover, { desc = "Hover documentation" })
            buf_set_keymap('n', '<C-k>', vim.lsp.buf.signature_help, { desc = "Signature help" })
            buf_set_keymap('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })
            buf_set_keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action" })
            buf_set_keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action" })

            -- Format on save
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("Format", { clear = true }),
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format()
                    end,
                })
            end
        end

        mason_lspconfig.setup_handlers({
            function(server)
                nvim_lsp[server].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end,
            ["tssserver"] = function()
                nvim_lsp.tsserver.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["cssls"] = function()
                nvim_lsp.cssls.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["tailwindcss"] = function()
                nvim_lsp.tailwindcss.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
    filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "pug" },
                })
            end,
            ["html"] = function()
                nvim_lsp.html.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["jsonls"] = function()
                nvim_lsp.jsonls.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["eslint"] = function()
                nvim_lsp.eslint.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["pyright"] = function()
                nvim_lsp.pyright.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,1
                })
            end,
        })
    end,
}
