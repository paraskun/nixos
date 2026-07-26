return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "hrsh7th/cmp-nvim-lsp"
    },

    config = function()
      local caps = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.enable("clangd")
      vim.lsp.enable("gopls")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("nil")

      vim.lsp.config("*", { capabilities = caps })

      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gs", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>gi", vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action, {})

      vim.keymap.set("n", "<leader>n", function()
        vim.diagnostic.jump({ count = 1, float = true })
      end, {})

      vim.keymap.set("n", "<leader>e", function()
        vim.diagnostic.open_float({})
      end, {})
    end
  },
}
