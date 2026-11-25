return {
  -- Snacks.nvim Explorer (LazyVim default in v14+)
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            layout = {
              preset = "sidebar",
              layout = {
                position = "right",
              },
            },
          },
        },
      },
    },
  },

  -- Disable neo-tree so it doesn't open alongside Snacks.explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
}
