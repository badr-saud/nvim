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
        -- eslint, ltex and gopls diagnostics already come from their real LSP
        -- servers in lsp-config.lua; shellcheck has no LSP server here, so it
        -- stays as a null-ls diagnostics source.
        null_ls.builtins.diagnostics.shellcheck,
      },
    })
    vim.keymap.set("n", "<space>gf", vim.lsp.buf.format, {})
  end,
}
