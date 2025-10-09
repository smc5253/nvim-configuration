return {
  "nvim-mini/mini.nvim",
  version = false,
  config = function() 
    require("mini.pairs").setup{}
    require("mini.surround").setup{}
    require("mini.statusline").setup{}
    require("mini.tabline").setup{}
  end,
}


