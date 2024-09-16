return {
  "lervag/vimtex",
  config = function()
    -- Vimtex settings
    vim.g.vimtex_view_method = "zathura" -- Set PDF viewer (adjust if using a different viewer)
    vim.g.vimtex_quickfix_mode = 0     -- Disable quickfix mode

    -- Optional: Set additional Vimtex options
    vim.g.vimtex_compiler_method = "latexmk" -- Use latexmk for compilation
    vim.g.vimtex_compiler_latexmk = {
      --build_dir = "",
      executable = "latexmk",
      options = {
        "-pdf",                 -- Generate PDF
        "-shell-escape",        -- Enable shell escape
        "-interaction=nonstopmode", -- Continue on errors
        "-file-line-error",     -- Show file and line numbers in errors
      },
    }
  end,
}
