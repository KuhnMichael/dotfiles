return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      custom_highlights = function(colors)
        return {
          WinSeparator = {
            fg = colors.surface0,
          },
        }
      end,
      color_overrides = {
        -- mocha = {
        --    base = "#000000",
        --    mantle = "#000000",
        -- },
      },
      integrations = {
        mason = true,
        fzf = true,
        snacks = true,
        lsp_trouble = true,
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
      },
    },
    init = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    config = function()
      vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
      vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
      vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
      vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
      vim.keymap.set("n", "<C-c>", "<C-w>c")

      vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
      vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
      vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
      vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)

      -- for mac
      vim.keymap.set("n", "˙", require("smart-splits").resize_left)
      vim.keymap.set("n", "∆", require("smart-splits").resize_down)
      vim.keymap.set("n", "˚", require("smart-splits").resize_up)
      vim.keymap.set("n", "¬", require("smart-splits").resize_right)
    end,
  },
}
