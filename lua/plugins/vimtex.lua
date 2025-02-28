return {
  "lervag/vimtex",
  config = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_quickfix_mode = 0
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
