return {
  "lervag/vimtex",
  lazy = false, -- load immediately so filetype plugin/syntax works
  ft = { "tex", "latex" }, -- optional but good practice
  config = function()
    -- Set the PDF viewer
    vim.g.vimtex_view_method = "sumatrapdf"

    -- Disable quickfix auto open
    vim.g.vimtex_quickfix_mode = 0

    -- Use latexmk for compilation
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      executable = "latexmk",
      options = {
        "-pdf",
        "-pdflatex=xelatex",
        "-shell-escape",
        "-interaction=nonstopmode",
        "-file-line-error",
        "-synctex=1",
        "-verbose"
      },
    }
  end,
}

