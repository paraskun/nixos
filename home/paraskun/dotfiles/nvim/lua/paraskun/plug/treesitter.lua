return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",

    config = function()
      require("nvim-treesitter").setup({})
    end,

    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end
      })

      require("nvim-treesitter").install({
        "c",
        "cpp",
        "go",
        "lua",
        "markdown",
        "bash",
      })
    end
  },
  {
    "nathanalderson/yang.vim",
  },
}
