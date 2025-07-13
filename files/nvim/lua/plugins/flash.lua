return {
  "folke/flash.nvim",
  keys = {
    -- <c-s> is used by tmux prefix key.
    { "<c-s>", false },
    {
      "<c-f>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
}
