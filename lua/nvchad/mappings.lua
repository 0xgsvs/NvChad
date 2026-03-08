-- //========== keymaps ==========//

local map = vim.keymap.set

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- telescope
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>sg", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", { desc = "telescope search keymaps" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)
map(
  "n",
  "<leader>e",
  "<cmd>Telescope find_files follow=true no_ignore=false hidden=false<CR>",
  { desc = "telescope find all files" }
)

-- Swap v and V for visual modes
map("n", "<A-v>", "V", { noremap = true })

-- copy entire file
map("n", "<C-c>", "<cmd>:%y<CR>", { noremap = true })

-- comment
map("n", "<leader>;", "gcc", { desc = "comment toggle", remap = true })
map("v", "<leader>;", "gc", { desc = "comment toggle", remap = true })

-- pairing of brackets
map({ "n", "x", "s" }, "<a-e>", "%", { noremap = true, silent = true })

-- enter the command mode
map("n", ":", "/", { desc = "Search inside the file" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", ";;", ":! ", { desc = "CMD enter command mode" })

-- shortcut for escape
map({ "i", "c" }, "jk", "<cmd>noh<CR><ESC>")
map({ "n", "i", "c" }, "<ESC>", "<cmd>noh<CR><ESC>")
map("v", "u", "<cmd>noh<CR><ESC>")

-- terminal
map("t", "jk", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map("t", "<ESC>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- write and exit commands
map({ "n", "v" }, ";e", "<cmd> wqa <cr>")
map({ "n", "v" }, ";n", "<cmd> qa! <cr>")

-- move to beginning and end of line in normal and insert mode
map({ "n", "v", "o" }, "<S-h>", "^", { desc = "move beginning of line" })
map({ "n", "v", "o" }, "<S-l>", "g_", { desc = "move end of line" })

--remap of arrow keys
map({ "i" }, "<A-h>", "<Left>", { desc = "move left" })
map({ "i" }, "<A-l>", "<Right>", { desc = "move right" })
map({ "i" }, "<A-j>", "<Down>", { desc = "move down" })
map({ "i" }, "<A-k>", "<Up>", { desc = "move up" })

--navigating windows
map("n", "<A-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<A-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<A-k>", "<c-w>k", { desc = "switch window up" })
map("n", "<A-j>", "<C-w>j", { desc = "switch window down" })

----------------------------------------------------------------------------------------------------------------------
---   USES NVCHAD APIS (NOT NATIVE TO NEOVIM)

-- tabufline
if require("nvconfig").ui.tabufline.enabled then
  map("n", "<tab>", function()
    require("nvchad.tabufline").next()
  end, { desc = "Buffer goto next" })

  map("n", "<S-tab>", function()
    require("nvchad.tabufline").prev()
  end, { desc = "Buffer goto prev" })

  map("n", "<leader>bd", function()
    require("nvchad.tabufline").close_buffer()
  end, { desc = "[B]uffer [D]elete" })

  map("n", "<leader>bo", function()
    require("nvchad.tabufline").closeAllBufs(false) -- excludes current buf
  end, { desc = "Delete other buffers" })
end

-- Theme
map("n", "<leader>tT", function()
  require("nvchad.themes").open()
end, { desc = "Nvchad themes list" })
