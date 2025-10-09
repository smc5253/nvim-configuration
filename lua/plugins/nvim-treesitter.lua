local win_id, l_num = nil, nil

local function close_floating_window(winid)
  if type(winid) == "number" and vim.api.nvim_win_is_valid(winid) then
    win_id= vim.api.nvim_win_close(winid, true)
  end
end

local function toggle_diagnostic_float()
  if win_id == nil then
    _, win_id = vim.diagnostic.open_float(nil)
  else
    win_id = close_floating_window(win_id)
  end
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,

    opts = {
     ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>ss",
          node_incremental = "<leader>ni",
          scope_incremental = "<leader>si",
          node_decremental = "<leader>nd",
        },
      },

      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
            ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
            ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            -- You can also use captures from other query groups like `locals.scm`
            ["ab"] = { query = "@block.outer", desc = "Select outer assignment" },
            ["ib"] = { query = "@block.inner", desc = "Select inner assignment (rhs)" },
          },
          include_surrounding_whitespace = true,
        },
      },
    },

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      local ts_folding_group = vim.api.nvim_create_augroup("TreeSitter", {clear = true})
      vim.api.nvim_create_autocmd({ "CursorMoved" }, {
        group = ts_folding_group,
        callback = function()
          if l_num == nil then
            l_num = vim.api.nvim_win_get_cursor(0)[1] - 1
          end
          local bufnr = vim.api.nvim_get_current_buf()
          local l = vim.api.nvim_win_get_cursor(0)[1] - 1
          local diagnostics = vim.diagnostic.get(bufnr, { lnum = l })
          if win_id ~= nil and l_num ~= l then  -- close if line has changed
            print("in 1st condition")
            win_id = close_floating_window(win_id)
            l_num = l
          elseif  win_id ~= nil and l_num == l and #diagnostics == 0 then -- close if line has changed and error gone
            win_id = close_floating_window(win_id)
          end
        end
      })
      vim.api.nvim_create_autocmd( {"BufRead", "BufWinEnter"}, {
        group = ts_folding_group,
        callback = function()
          if require("nvim-treesitter.parsers").has_parser() then
            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          end
          vim.opt.foldenable = false  -- prevents collapsed code if folding enabled
        end,
      })
      vim.keymap.set("n", "<leader>gf", toggle_diagnostic_float, { desc = "Toggle diagnostics" })
    end
  },

  { "nvim-treesitter/nvim-treesitter-textobjects" }
}
