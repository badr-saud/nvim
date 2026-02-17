return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require "nvim-treesitter".setup({
			auto_install = true,
			highlight = { enable = true, disable = {"latex"} },
			indent = { enable = true, disable={"latex"} },
		})
	end,
}
