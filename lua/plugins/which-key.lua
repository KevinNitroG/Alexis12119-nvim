-- NOTE: Keymaps Popup/Guide
return {
  "folke/which-key.nvim",
  opts = {
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "", -- symbol prepended to a group
    },
    window = {
      border = "single",
    },
  },
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "whichkey")
    require("which-key").setup(opts)
    require("which-key").register {
      {
        ["<leader>"] = {
          a = { name = " AI" },
          d = { name = "󰃤 Debugger" },
          r = { name = " Runner" },
          R = { name = "󰮓 Refactor" },
          s = { name = "󰔚 Sessions" },
          f = { name = " Find" },
          g = { name = "󰊢 Git" },
          -- h = { name = " Harpoon" },
          l = { name = " LSP" },
          m = { name = " Markdown" },
          n = { name = " Neovim" },
          o = { name = " Options" },
          p = { name = " Plugins" },
          t = { name = " Terminal" },
          T = { name = "󰙨 Tests" },
          v = { name = " Venv" },
          z = { name = "󰡌 Zen" },
        },
      },
    }
  end,
  keys = {
    "<",
    ">",
    "[",
    "]",
    "c",
    "d",
    "g",
    "s",
    "y",
    "z",
  },
}
