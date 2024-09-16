return {
  {
    "mattn/emmet-vim",
    config = function()
      -- Set up Emmet configuration here
      vim.g.user_emmet_mode = "n"
      vim.g.user_emmet_leader_key = "<C-e>"
      vim.g.user_emmet_settings = {
        javascript = {
          extends = "jsx",
        },
      }
    end,
  },
}
