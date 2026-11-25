-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- -----------------------------------------------------------------------------
-- Seamless Navigation between Neovim splits & Zellij panes
-- Works across Windows, WSL, and Linux (auto-detects zellij or zellij.exe)
-- -----------------------------------------------------------------------------
local function get_zellij_bin()
  if vim.fn.executable("zellij") == 1 then
    return "zellij"
  elseif vim.fn.executable("zellij.exe") == 1 then
    return "zellij.exe"
  end
  return nil
end

local function nav(short_dir, zellij_dir)
  local cur_win = vim.api.nvim_get_current_win()
  vim.cmd("wincmd " .. short_dir)
  local new_win = vim.api.nvim_get_current_win()

  -- If the window didn't change, we've reached the boundary of Neovim:
  -- send focus command to the adjacent Zellij pane
  if cur_win == new_win then
    local bin = get_zellij_bin()
    if bin then
      vim.fn.system(bin .. " action move-focus " .. zellij_dir)
    end
  end
end

-- Normal mode keymaps
vim.keymap.set("n", "<C-h>", function() nav("h", "left") end, { desc = "Navigate Left (Zellij/Split)", silent = true })
vim.keymap.set("n", "<C-j>", function() nav("j", "down") end, { desc = "Navigate Down (Zellij/Split)", silent = true })
vim.keymap.set("n", "<C-k>", function() nav("k", "up") end, { desc = "Navigate Up (Zellij/Split)", silent = true })
vim.keymap.set("n", "<C-l>", function() nav("l", "right") end, { desc = "Navigate Right (Zellij/Split)", silent = true })

-- Terminal mode keymaps
vim.keymap.set("t", "<C-h>", function() nav("h", "left") end, { desc = "Navigate Left (Zellij/Split)", silent = true })
vim.keymap.set("t", "<C-j>", function() nav("j", "down") end, { desc = "Navigate Down (Zellij/Split)", silent = true })
vim.keymap.set("t", "<C-k>", function() nav("k", "up") end, { desc = "Navigate Up (Zellij/Split)", silent = true })
vim.keymap.set("t", "<C-l>", function() nav("l", "right") end, { desc = "Navigate Right (Zellij/Split)", silent = true })
