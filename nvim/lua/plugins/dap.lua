return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")
      -- Automatically load .vscode/launch.json if present
      if vim.fn.filereadable(".vscode/launch.json") == 1 then
        require("dap.ext.vscode").load_launchjs(nil, {
          ["go"] = { "go" },
          ["delve"] = { "go" },
        })
      end
    end,
  },
}
