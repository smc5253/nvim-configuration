return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    { "telescope", winopts = { preview = { default = "bat" } } },
    grep = {
      cmd = "rg --uuu",
    },
  },
  config = function()
    require("fzf-lua").setup(_, opts)
    local km = vim.keymap

    km.set("n", "<leader>ff", require("fzf-lua").files, { silent = true, desc = "FZF Files" })
    km.set("n", "<leader><leader>", require("fzf-lua").resume, { silent = true, desc = "FZF Resume" })
    km.set("n", "<leader>r", require("fzf-lua").registers, { silent = true, desc = "Registers" })
    km.set("n", "<leader>m", require("fzf-lua").marks, { silent = true, desc = "Marks" })
    km.set("n", "<leader>k", require("fzf-lua").keymaps, { silent = true, desc = "Keymaps" })
    km.set("n", "<leader>f", require("fzf-lua").live_grep, { silent = true, desc = "FZF Grep" })
    km.set("n", "<leader>b", require("fzf-lua").buffers, { silent = true, desc = "FZF Buffers" })
    km.set("v", "<leader>8", require("fzf-lua").grep_visual, { silent = true, desc = "FZF Selection" })
    km.set("n", "<leader>7", require("fzf-lua").grep_cword, { silent = true, desc = "FZF Word" })
    km.set("n", "<leader>j", require("fzf-lua").helptags, { silent = true, desc = "Help Tags" })
    km.set("n", "<leader>gc", require("fzf-lua").git_bcommits, { silent = true, desc = "Browse File Commits" })
    km.set("n", "<leader>gs", require("fzf-lua").git_status, { silent = true, desc = "Git Status" })
    km.set("n", "<leader>s", require("fzf-lua").spell_suggest, { silent = true, desc = "Spelling Suggestions" })
    km.set("n", "<leader>cj", require("fzf-lua").lsp_definitions, { silent = true, desc = "Jump to Definition" })
  end,
}
