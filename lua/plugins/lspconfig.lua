local lsp_on_attach = function(server) 
  local default_on_attach = vim.lsp.config[server].on_attach
  return function(client, bufnr)
    if default_on_attach then default_on_attach(client, bufnr) end
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
    vim.keymap.set("n", "gh",vim.lsp.buf.hover, {buffer = bufnr, desc = "Go to hover"})
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer = bufnr, desc = "Rename symbol"})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = bufnr, desc = "Go to implementation"})
    vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = bufnr, desc = "Go to references"})
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = bufnr, desc = "Go to type definition"})
  end
end

return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    {
      "neovim/nvim-lspconfig",
      config = function()
        vim.lsp.enable("clangd")
        vim.lsp.config("clangd", {
          on_attach = lsp_on_attach("clangd"),
          filetypes = { 'c', 'cpp' },
        })
      end,
    }
  },
  opts = {
    ensure_installed = { "lua_ls" },
  },
  config = function(_, opts)
    require("mason-lspconfig").setup(opts)
    local installed = require("mason-lspconfig").get_installed_servers()

    for _, server in ipairs(installed) do
      vim.lsp.config(server, {
        on_attach = lsp_on_attach(server),
      })
    end

    vim.lsp.config('lua_ls', {
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if
            path ~= vim.fn.stdpath('config')
            and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
          then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            version = 'LuaJIT',
            path = {
              'lua/?.lua',
              'lua/?/init.lua',
            },
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              vim.env.VIMRUNTIME .. "/lua",
              unpack(vim.api.nvim_get_runtime_file("lua", true)),
            }
          }
        })
      end,
      settings = {
        Lua = {}
      }
    })
    end,
}
