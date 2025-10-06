return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    filters = {
      dotfiles = false,
    },
  },
  keys = {
    {
      "<leader>e", 
      function() require("nvim-tree.api").tree.toggle() end,
      desc = "Toggle Explorer",
    }
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
