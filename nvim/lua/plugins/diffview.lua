return {
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
      "DiffviewFileHistory",
    },
    keys = {
      {
        "<leader>gd",
        function()
          if next(require("diffview.lib").views) == nil then
            vim.cmd("DiffviewOpen")
          else
            vim.cmd("DiffviewClose")
          end
        end,
        desc = "Toggle Diffview",
      },
      {
        "<leader>gD",
        "<cmd>DiffviewFileHistory %<cr>",
        desc = "Diffview File History (Current File)",
      },
      {
        "<leader>gD",
        ":'<,'>DiffviewFileHistory<cr>",
        mode = "v",
        desc = "Diffview File History (Selected Range)",
      },
    },
    opts = {},
  },
}
