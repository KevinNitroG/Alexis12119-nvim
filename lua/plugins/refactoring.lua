---@type NvPluginSpec
return {
  "ThePrimeagen/refactoring.nvim",
  cmd = "Refactor",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  init = function()
    vim.keymap.set({ "n", "v" }, "<leader>uRs", function()
      -- require("refactoring").select_refactor()
      require("telescope").extensions.refactoring.refactors()
    end, { desc = "Refactor | Select", silent = true })
    vim.keymap.set(
      { "n", "v" },
      "<leader>uRi",
      "<cmd>Refactor inline_var<cr>",
      { desc = "Refactor | Extract Inline Variable", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>uRI",
      "<cmd>Refactor inline_func<cr>",
      { desc = "Refactor | Extract Inline Function", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>uRb",
      "<cmd>Refactor extract_block<cr>",
      { desc = "Refactor | Extract Block", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>uRB",
      "<cmd>Refactor extract_block_to_file<cr>",
      { desc = "Refactor | Extract Block to File", silent = true }
    )
    vim.keymap.set("v", "<leader>uRe", "<cmd>Refactor extract<cr>", { desc = "Refactor | Extract", silent = true })
    vim.keymap.set(
      "v",
      "<leader>uRf",
      "<cmd>Refactor extract_to_file<cr>",
      { desc = "Refactor | Extract to File", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>uRv",
      "<cmd>Refactor extract_var<cr>",
      { desc = "Refactor | Extract Variable", silent = true }
    )
    vim.keymap.set("n", "<leader>uRn", "<cmd>Refactor refactor_names<cr>", { desc = "Refactor | Names", silent = true })
  end,
  opts = {
    prompt_func_return_type = {
      c = false,
      cpp = false,
      cxx = false,
      go = false,
      h = false,
      hpp = false,
      java = false,
    },
    prompt_func_param_type = {
      c = false,
      cpp = false,
      cxx = false,
      go = false,
      h = false,
      hpp = false,
      java = false,
    },
    printf_statements = {},
    print_var_statements = {},
    show_success_message = false,
  },
  config = function(_, opts)
    require("refactoring").setup(opts)
  end,
}
