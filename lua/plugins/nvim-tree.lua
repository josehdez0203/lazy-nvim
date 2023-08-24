return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
  opts = {
    renderer = {
      icons = {
        webdev_colors = true,
        glyphs = {
          folder = {
            arrow_closed = "", -- arrow when folder is closed
            arrow_open = "", -- arrow when folder is open
          },
        },
      },
    },
    -- disable window_picker for
    -- explorer to work well with
    -- window splits
    actions = {
      open_file = {
        quit_on_open = true,
        resize_window = true,
        window_picker = {
          enable = false,
        },
      },
    },
  },
  keys = {
    { "<leader>e", ":NvimTreeToggle<CR>", desc = "Abre archivos" },
    { "<leader>E", ":NvimTreeFindFile<CR>", desc = "Abre archivos" },
  },
}
