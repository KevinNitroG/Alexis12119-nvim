---@type NvPluginSpec
-- NOTE: Linting
return {
  "mfussenegger/nvim-lint",
  event = "User FilePost",
  enabled = true,
  config = function()
    local linters = require("lint").linters
    vim.list_extend(linters.ruff.args, { "--select=I", "--ignore=F401" })

    require("lint").linters_by_ft = {
      python = { "ruff" },
      -- markdown = { "markdownlint" },
      latex = { "vale" },
      -- cpp = { "cpplint" },
      javascript = { "eslint" },
      typescript = { "eslint" },
      ghaction = { "actionlint" },
      bash = { "shellcheck" },
      sh = { "shellcheck" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
