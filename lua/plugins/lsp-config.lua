return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"eslint",
					"texlab",
					"tsserver",
					"ltex",
					"gopls",
					"clangd",
					"cssls",
					"bashls",
					"typescript-language-server",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			-- TypeScript
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			-- Python
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			-- JavaScript
			lspconfig.eslint.setup({
				capabilities = capabilities,
			})

			-- c++
			lspconfig.clangd.setup({
				on_attached = function(client, bufnr)
					client.server_capabilities.signatureHelpProvider = false
				end,
				capabilities = capabilities,
			})

			-- go lang
			lspconfig.gopls.setup({
				capabilities = capabilities,
				cmd = { "gopls" },
				file_types = { "go", "gomod", "gowork", "gotmpl" },
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analysis = {
							unusedparams = true,
						},
					},
				},
			})

			-- LaTeX
			lspconfig.texlab.setup({
				capabilities = capabilities,
				settings = {
					texlab = {
						build = {
							onSave = true, -- Automatically build on save
							executable = "latexmk",
							args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
						},
						forwardSearch = {
							executable = "zathura", -- Replace with your PDF viewer
							args = { "--synctex-forward", "%l:1:%f", "%p" },
						},
						chktex = {
							onOpenAndSave = true,
							onEdit = true,
						},
					},
				},
			})

			-- LaTeX with ltex for grammar checking
			lspconfig.ltex.setup({
				capabilities = capabilities,
				settings = {
					ltex = {
						language = "en", -- Set your preferred language
					},
				},
			})

			-- HTML with Jinja support
			lspconfig.html.setup({
				capabilities = capabilities,
				filetypes = { "html", "jinja", "jinja.html" }, -- Add Jinja filetypes
				settings = {
					html = {
						format = {
							templating = true, -- Enable templating for Jinja
						},
					},
				},
			})

			-- CSS/SCSS support
			lspconfig.cssls.setup({
				capabilities = capabilities,
				filetypes = { "css", "scss", "less" }, -- Add SCSS and Less
				settings = {
					css = {
						validate = true,
					},
					scss = {
						validate = true,
					},
					less = {
						validate = true,
					},
				},
			})

			-- Shell scripting (Bash)
			lspconfig.bashls.setup({
				capabilities = capabilities,
				filetypes = { "sh", "bash", "zsh" }, -- Shell file types
			})

			-- Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
