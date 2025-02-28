return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  config = function()
    local jdtls = require("jdtls")
    local root_markers = { "gradlew", ".git", "mvnw" }
    local root_dir = vim.fs.dirname(vim.fs.find(root_markers, { upward = true })[1]) or vim.loop.cwd()

    local config = {
      cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" },
      root_dir = root_dir,
      settings = {
        java = {
          format = { enabled = true },
          completion = { enabled = true },
          saveActions = { organizeImports = true },
        },
      },
    }

    jdtls.start_or_attach(config)
  end,
}
