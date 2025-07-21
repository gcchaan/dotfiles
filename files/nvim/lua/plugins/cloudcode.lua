return {
  "coder/claudecode.nvim",
  opts = {},
  keys = {
    { "<leader>vv", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>vf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>vr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { "<leader>vC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>vb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { "<leader>vs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    {
      "<leader>vs",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil" },
    },
    -- Diff management
    { "<leader>va", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>vd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  },
}
