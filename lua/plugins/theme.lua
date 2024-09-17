return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    -- require("catppuccin").setup() not needed
    vim.cmd.colorscheme("catppuccin")
  end,
}
