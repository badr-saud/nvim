return {
	"rmehri01/onenord.nvim",
	config = function()
		require("onenord").setup({
			theme = "dark",
			borders = true,
			disable = {
				background = true,
			},
		})
		--vim.cmd.colorscheme("onenord")
	end,
}
