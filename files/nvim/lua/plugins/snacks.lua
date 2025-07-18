return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      hidden = true,
      previewers = {
        diff = {
          builtin = false,
          cmd = { "delta", "--no-gitconfig", "--line-numbers" },
        },
      },
    },
  },
}
