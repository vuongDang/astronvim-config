if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "mrcjkb/rustaceanvim",
  version = "^4",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
    {
      "lvimuser/lsp-inlayhints.nvim",
      opts = {},
    },
  },
  ft = { "rust" },
  -- Configure inlay hints, this should be different when switching to neovim 0.10
  config = function()
    vim.g.rustaceanvim = {
      inlay_hints = {
        -- highlight = "NonText",
      },
      tools = {
        -- hover_actions = {
        --   auto_focus = true,
        -- },
      },
      server = {
        on_attach = function(client, bufnr) require("lsp-inlayhints").on_attach(client, bufnr) end,
        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev" },
              extraArgs = { "--profile", "rust-analyzer" },
            },
          },
        },
      },
    }
  end,
}
