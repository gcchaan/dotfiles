local in_japanese_plz = "日本語でお願いします。"

return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = {
    prompts = {
      Explain = {
        prompt = "Write an explanation for the selected code as paragraphs of text." ..
          in_japanese_plz,
        system_prompt = "COPILOT_EXPLAIN",
      },
      Review = {
        prompt = "Review the selected code." ..
          in_japanese_plz,
        system_prompt = "COPILOT_REVIEW",
      },
      Fix = {
        prompt = "There is a problem in this code. Identify the issues and rewrite the code with fixes. Explain what was wrong and how your changes address the problems.",
      },
      Optimize = {
        prompt = "Optimize the selected code to improve performance and readability. Explain your optimization strategy and the benefits of your changes.",
      },
      Docs = {
        prompt = "Please add documentation comments to the selected code.",
      },
      Tests = {
        prompt = "Please generate tests for my code.",
      },
      Commit = {
        prompt = "Write commit message for the change with commitizen convention. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block.",
        context = "git:staged",
      },
    },
  },
}
