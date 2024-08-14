return {
	{ "digitaltoad/vim-pug" },
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "folke/neodev.nvim", opts = {} },
		},
		{
			"hrsh7th/nvim-cmp",
			-- load cmp on InsertEnter
			event = "InsertEnter",
			-- these dependencies will only be loaded when cmp loads
			-- dependencies are always lazy-loaded unless specified otherwise
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
			config = function()
				local cmp = require("cmp")

				local icons = {
					Text = "   (Text) ",
					Method = "   (Method)",
					Function = "   (Function)",
					Constructor = "   (Constructor)",
					Field = " ﴲ  (Field)",
					Variable = "   (Variable)",
					Class = "   (Class)",
					Interface = " ﰮ  (Interface)",
					Module = "   (Module)",
					Property = " 襁 (Property)",
					Unit = "   (Unit)",
					Value = "   (Value)",
					Enum = " 練 (Enum)",
					Keyword = "   (Keyword)",
					Snippet = "   (Snippet)",
					Color = "   (Color)",
					File = "   (File)",
					Reference = "   (Reference)",
					Folder = "   (Folder)",
					EnumMember = "   (EnumMember)",
					Constant = " ﲀ  (Constant)",
					Struct = " ﳤ  (Struct)",
					Event = "   (Event)",
					Operator = "   (Operator)",
					TypeParameter = "   (TypeParameter)",
				}

				cmp.setup({
					snippet = {
						expand = function(args)
							require("luasnip").lsp_expand(args.body)
						end,
					},
					completion = {
						throttle_time = 80,
						source_timeout = 200,
						resolve_timeout = 800,
						incomplete_delay = 400,
						max_abbr_width = 100,
						max_kind_width = 100,
						max_menu_width = 100,
					},
					sources = {
						{ name = "luasnip" },
						{ name = "nvim_lsp" },
						{ name = "path" },
						{ name = "buffer", keyword_length = 4 },
					},
					mapping = {
						["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
						["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
						["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
						["<CR>"] = cmp.mapping.confirm({ select = true }),
						["<C-d>"] = cmp.mapping.scroll_docs(-4),
						["<C-f>"] = cmp.mapping.scroll_docs(4),
					},
					formatting = {
						format = function(_, vim_item)
							vim_item.kind = icons[vim_item.kind]
							return vim_item
						end,
					},
				})
			end,
		},
		config = function()
			local nvim_lsp = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			local protocol = require("vim.lsp.protocol")

			local on_attach = function(client, bufnr)
				-- format on save
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

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			mason_lspconfig.setup_handlers({
				function(server)
					nvim_lsp[server].setup({
						capabilities = capabilities,
					})
				end,
				["tsserver"] = function()
					nvim_lsp["tsserver"].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
				["cssls"] = function()
					nvim_lsp["cssls"].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
				["tailwindcss"] = function()
					nvim_lsp["tailwindcss"].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
				["html"] = function()
					nvim_lsp["html"].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
				["jsonls"] = function()
					nvim_lsp["jsonls"].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
				["eslint"] = function()
					nvim_lsp["eslint"].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
				["pyright"] = function()
					nvim_lsp["pyright"].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
			})
		end,
	},
}
