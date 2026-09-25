return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "intelephense" },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "php",
        callback = function(args)
          -- phpcs runs on every keystroke; virtual_text turns each finding
          -- into an end-of-line comment that clutters the buffer while
          -- typing. Keep signs/underline so problems are still visible,
          -- but only surface the text via <leader>cd (hover) or Trouble.
          vim.diagnostic.config({ virtual_text = false }, require("lint").get_namespace("phpcs"))

          vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, {
            buffer = args.buf,
            desc = "Line Diagnostics (phpcs)",
          })
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          -- di-websites-platform has nested composer.json files under
          -- domains/localhost/ and individual dealer-themes/<slug>/ dirs.
          -- Always root at the outermost composer.json (or .git) so
          -- intelephense keeps indexing app/vendor + app/dealer-inspire/wp
          -- instead of rooting inside a single dealer theme.
          root_dir = function(bufnr, on_dir)
            local util = require("lspconfig.util")
            local fname = vim.api.nvim_buf_get_name(bufnr)
            local git_root = util.root_pattern(".git")(fname)
            local root = git_root or util.root_pattern("composer.json")(fname)
            on_dir(root)
          end,
        },
      },
    },
  },
}
