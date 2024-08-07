return {
  "rest-nvim/rest.nvim",
  ft = "http",
  dependencies = {
    {
      "vhyrro/luarocks.nvim",
      opts = {
        rocks = {
          "lua-curl",
          "nvim-nio",
          "mimetypes",
          "xml2lua",
        },
      },
    },
  },
  keys = {
    { "<leader>AL", "<cmd>Rest log<cr>", desc = "Rest | Log", ft = "http", silent = true },
    { "<leader>Al", "<cmd>Rest last<cr>", desc = "Rest | Last", ft = "http", silent = true },
    { "<leader>Ae", "<cmd>Rest env<cr>", desc = "Rest | Env", ft = "http", silent = true },
    { "<leader>Ar", "<cmd>Rest run<cr>", desc = "Rest | Run", ft = "http", silent = true },
    { "<leader>AR", "<cmd>Rest result<cr>", desc = "Rest | Result", ft = "http", silent = true },
  },
  opts = {},
  config = function(_, opts)
    require("rest-nvim").setup(opts)
  end,
}
