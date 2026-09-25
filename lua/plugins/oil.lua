return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    config = function()
      require("oil").setup({
        -- Your custom oil configurations go here (or leave empty for defaults)
        default_file_explorer = true,
      })

      -- Open parent directory with '-'
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  },
}
