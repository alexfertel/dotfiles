---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<leader>e"] = "",
    ["<leader>h"] = "",
  }
}

M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    ["C-s"] = { ":update<CR>", "Save file", opts = { silent = true, noremap = true } },
    ["yaa"] = { "<cmd> %y+<CR>", "Copy whole file", opts = { silent = true, noremap = true } },

    -- nvim-tree mapppings
    ["<leader>ntt"] = { ":NvimTreeToggle<CR>", "Toggle nvim-tree" },
    ["<leader>nte"] = { ":NvimTreeRefresh<CR>", "Refresh nvim-tree" },
    ["<leader>ntn"] = { ":NvimTreeFindFile<CR>", "Find file in nvim-tree" },

    -- Switch between windows.
    ["<C-h>"] = { ":wincmd h<CR>", "Window left" },
    ["<C-l>"] = { ":wincmd l<CR>", "Window right" },
    ["<C-j>"] = { ":wincmd j<CR>", "Window down" },
    ["<C-k>"] = { ":wincmd k<CR>", "Window up" },

    -- Telescope overrides.
    ["<C-p>"] = { "<cmd>Telescope find_files<CR>", "Find files", opts = { noremap = true } },
    ["<leader>lg"] = { "<cmd>Telescope live_grep<CR>", "Live grep", opts = { noremap = true } },
    ["<leader>fB"] = { "<cmd>Telescope git_branches<CR>", "Find branches", opts = { noremap = true } },
    ["<leader>fq"] = { "<cmd>Telescope quickfix<CR>", "Quick fix", opts = { noremap = true } },
  },
  v = {
    ["C-s"] = {"<C-c>:update<CR>", "Save file", opts = { silent = true, noremap = true } },
  },
  i = {
    ["C-s"] = {"<C-o>:update<CR>", "Save file", opts = { silent = true, noremap = true } },
  }
}

return M