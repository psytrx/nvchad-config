local M = {}

M.custom = {
  n = {
    ["<C-d>"] = { "<C-d>zz", "jump half screen down" },
    ["<C-u>"] = { "<C-u>zz", "jump half screen up" },
    ["n"] = { "nzz", "jump to next occurence" },
    ["N"] = { "Nzz", "jump to previous occurence" },
  },
}

M.undotree = {
  n = {
    ["<leader>ut"] = { vim.cmd.UndotreeToggle, "toggle Undotree" },
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
      "open harpoon quick menu",
    },
    ["<leader>a"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Add harpoon mark",
    },
    ["<leader>1"] = { fn_harpoon_nav_file(1), "open harpoon file 1" },
    ["<leader>2"] = { fn_harpoon_nav_file(2), "open harpoon file 2" },
    ["<leader>3"] = { fn_harpoon_nav_file(3), "open harpoon file 3" },
    ["<leader>4"] = { fn_harpoon_nav_file(4), "open harpoon file 4" },
  },
}

return M
