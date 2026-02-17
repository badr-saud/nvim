return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "eslint",
          "texlab",
          "tsserver",
          "ltex",
          "gopls",
          "clangd",
          "cssls",
          "bashls",
          "typescript-language-server",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Emmet LSP
vim.lsp.config("emmet_language_server", {
  capabilities = capabilities,
})
vim.lsp.enable("emmet_language_server")

-- Lua
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
})
vim.lsp.enable("lua_ls")

-- TypeScript
vim.lsp.config("tsserver", {
  capabilities = capabilities,
})
vim.lsp.enable("tsserver")

-- Python
vim.lsp.config("pyright", {
  capabilities = capabilities,
})
vim.lsp.enable("pyright")

-- JavaScript/ESLint
vim.lsp.config("eslint", {
  capabilities = capabilities,
})
vim.lsp.enable("eslint")

-- C/C++
vim.lsp.config("clangd", {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Disable signature help if needed
    client.server_capabilities.signatureHelpProvider = false
  end,
})
vim.lsp.enable("clangd")

-- Go
vim.lsp.config("gopls", {
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analysis = {
        unusedparams = true,
      },
    },
  },
})
vim.lsp.enable("gopls")

-- LaTeX (Texlab)
vim.lsp.config("texlab", {
  capabilities = capabilities,
  settings = {
    texlab = {
      build = {
        onSave = true,
        executable = "latexmk",
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
      },
      forwardSearch = {
        executable = "zathura", -- your PDF viewer
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
      chktex = {
        onOpenAndSave = true,
        onEdit = true,
      },
    },
  },
})
vim.lsp.enable("texlab")

-- LaTeX Grammar Checking (LTEX)
vim.lsp.config("ltex", {
  capabilities = capabilities,
  settings = {
    ltex = {
      language = "en",
    },
  },
})
vim.lsp.enable("ltex")

-- HTML with Jinja support
vim.lsp.config("html", {
  capabilities = capabilities,
  filetypes = { "html", "jinja", "jinja.html" },
  settings = {
    html = {
      format = { templating = true },
    },
  },
})
vim.lsp.enable("html")

-- CSS/SCSS/LESS
vim.lsp.config("cssls", {
  capabilities = capabilities,
  filetypes = { "css", "scss", "less" },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
})
vim.lsp.enable("cssls")

-- Shell scripting
vim.lsp.config("bashls", {
  capabilities = capabilities,
  filetypes = { "sh", "bash", "zsh" },
})
vim.lsp.enable("bashls")      -- Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
