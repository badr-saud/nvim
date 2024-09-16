return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({

				flavour = "mocha",
				transparent_background = true,
			})
		end,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.everforest_enable_italic = false
			vim.g.everforest_transparent_background = 1
		end,
	},
	{
		"rmehri01/onenord.nvim",
		config = function()
			require("onenord").setup({
				theme = "dark",
				borders = true,
				disable = {
					background = true,
				},
			})
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "auto", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				styles = {
					bold = true,
					italic = false,
					transparency = true,
				},
			})
			--vim.cmd.colorscheme("rose-pine")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				sidebars = { "Neo-tree" },
				disable_sidebar_background = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require("nightfox").setup({
				options = {
					transparent = true,
				},
			})
		end,
	}, -- lazy
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({
				transparent_background = true,
				filter = "machine", -- classic | octagon | pro | machine | ristretto | spectrum
				devicons = true,
				background_clear = {
					"neo-tree",
					"bufferline",
				},
			})
		end,
	},
}
