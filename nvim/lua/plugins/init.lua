return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},{"neovim/nvim-lspconfig"},
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
			local cmp = require'cmp'

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
				TypeParameter = "   (TypeParameter)"
			}

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				completion = {
					throttle_time = 80;
					source_timeout = 200;
					resolve_timeout = 800;
					incomplete_delay = 400;
					max_abbr_width = 100;
					max_kind_width = 100;
					max_menu_width = 100;
				},
				sources = {
					{name = 'luasnip' },
					{name = 'nvim_lsp'},
					{name = 'path'},
					{name = 'buffer', keyword_length=4},
				},
				mapping = {
					['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
					['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
					['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
					['<C-d>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
				},
				formatting = {
					format = function(_, vim_item)
						vim_item.kind = icons[vim_item.kind]
						return vim_item
					end
				}
			})
		end,
	},

}

