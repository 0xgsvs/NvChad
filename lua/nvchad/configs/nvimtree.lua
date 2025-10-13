dofile(vim.g.base46_cache .. "nvimtree")

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"
  local map = vim.keymap.set

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)
  map("n", "-", "<Nop>", opts "Disabled")
  map("n", "<C-m>", "<Nop>", opts "Disabled")
  -- custom mappings
  map("n", "w", api.tree.change_root_to_parent, opts "Up")

  map("n", "e", api.tree.change_root_to_node, opts "Down")
  map("n", "h", function()
    api.node.navigate.parent_close()
  end, opts "Close Directory")

  map("n", "l", function()
    api.node.open.edit()
  end, opts "Open Directory")

  map("n", "i", function()
    api.live_filter.start()
  end, opts "Filter")

  map("n", "?", api.tree.toggle_help, opts "Help")
end

return {
  on_attach = my_on_attach,
  filters = { enable = true, dotfiles = true },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = false,
  },
}
