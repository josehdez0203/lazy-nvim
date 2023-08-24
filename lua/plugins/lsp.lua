---@diagnostic disable: missing-fields
return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- pyright will be automatically installed with mason and loaded with lspconfig
      emmet_language_server = {},
      cssls = {},
    },
  },
}
