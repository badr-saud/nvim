return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.latexindent,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.ltex,
        null_ls.builtins.diagnostics.gopls,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.formatting.google_java_format,
        null_ls.builtins.diagnostics.checkstyle.with({
          extra_args = { "-c", vim.fn.expand("~/.config/checkstyle/google_checks.xml") },
        }),
      },
    })
    vim.keymap.set("n", "<space>gf", vim.lsp.buf.format, {})
  end,
}
