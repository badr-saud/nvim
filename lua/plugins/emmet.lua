return {
	"mattn/emmet-vim",
	config = function()
		-- Set up Emmet configuration here
		vim.g.user_emmet_mode = "n"
		vim.g.user_emmet_leader_key = "<C-e>" -- Use a different leader key for now

		-- Map <Tab> in insert mode for HTML/Jinja files
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "html", "jinja", "jinja.html" },
			callback = function()
				vim.api.nvim_buf_set_keymap(
					0,
					"i",
					"<Tab>",
					"<Plug>(emmet-expand-abbr)",
					{ noremap = true, silent = true }
				)
			end,
		})
	end,
}
