return {
  {
    "numToStr/Comment.nvim",
    event = "InsertEnter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = {
      toggler = {
        line = "<c-.>",
      },
      opleader = {
        line = "<c-/>",
      },
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    },
  },
}
