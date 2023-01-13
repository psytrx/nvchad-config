local M = {}

M.custom = {
  n = {
    ["<C-d>"] = { "<C-d>zz", "Jump half screen down" },
    ["<C-u>"] = { "<C-u>zz", "Jump half screen up" },
    ["n"] = { "nzz", "Jump to next occurence" },
    ["N"] = { "Nzz", "Jump to previous occurence" },
  },
}

M.undotree = {
  n = {
    ["<leader>ut"] = { vim.cmd.UndotreeToggle, "Toggle Undotree" },
  },
}

local function fn_harpoon_nav_file(n)
  return function()
    require("harpoon.ui").nav_file(n)
  end
end

M.harpoon = {
  n = {
    ["<leader>h"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Open harpoon quick menu",
    },
    ["<leader>a"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Add harpoon mark",
    },
    ["<leader>1"] = { fn_harpoon_nav_file(1), "Open harpoon file 1" },
    ["<leader>2"] = { fn_harpoon_nav_file(2), "Open harpoon file 2" },
    ["<leader>3"] = { fn_harpoon_nav_file(3), "Open harpoon file 3" },
    ["<leader>4"] = { fn_harpoon_nav_file(4), "Open harpoon file 4" },
  },
}

return M
