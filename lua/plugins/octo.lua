return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Octo",
  config = true,
  keys = {
    { "<leader>gp", "<cmd>Octo pr list<cr>", desc = "PR List" },
    { "<leader>gP", "<cmd>Octo pr search<cr>", desc = "PR Search" },
  },
}
