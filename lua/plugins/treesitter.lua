return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- last release is way too old and doesn't work on Windows
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "p00f/nvim-ts-rainbow",
      "folke/twilight.nvim",
      init = function()
        -- disable rtp plugin, as we only need its queries for mini.ai
        -- In case other textobject modules are enabled, we will load them
        -- once nvim-treesitter is loaded
        require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
        load_textobjects = true
      end,
    },
  },
  cmd = { "TSUpdateSync" },
  keys = {
    { "<c-space>", desc = "Increment selection" },
    { "<bs>", desc = "Decrement selection", mode = "x" },
  },
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    highlight = {
      enable = true,
    },
    indent = { enable = true },
    rainbow = {
      colors = {
        "#cc241d",
        "#a89984",
        "#b16286",
        "#d79921",
        "#689d6a",
        "#d65d0e",
        "#458588",
      },
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },
    ensure_installed = {
      "bash",
      "c",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
  ---@param opts TSConfig
  config = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      ---@type table<string, boolean>
      local added = {}
      opts.ensure_installed = vim.tbl_filter(function(lang)
        if added[lang] then
          return false
        end
        added[lang] = true
        return true
        ---@diagnostic disable-next-line: param-type-mismatch
      end, opts.ensure_installed)
    end
    require("nvim-treesitter.configs").setup(opts)

    if load_textobjects then
      -- PERF: no need to load the plugin, if we only need its queries for mini.ai
      ---@diagnostic disable-next-line: undefined-field
      if opts.textobjects then
        for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
          ---@diagnostic disable-next-line: undefined-field
          if opts.textobjects[mod] and opts.textobjects[mod].enable then
            local Loader = require("lazy.core.loader")
            Loader.disabled_rtp_plugins["nvim-treesitter-textobjects"] = nil
            local plugin = require("lazy.core.config").plugins["nvim-treesitter-textobjects"]
            require("lazy.core.loader").source_runtime(plugin.dir, "plugin")
            break
          end
        end
      end
    end
  end,
}
