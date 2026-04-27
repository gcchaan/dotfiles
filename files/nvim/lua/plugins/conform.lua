return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        sqlfluff = {
          -- ルートディレクトリが見つからなくても実行を許可する設定
          require_cwd = false,
        },
      },
      formatters_by_ft = {
        sql = { "sqlfluff" },
      },
    },
  },
}
