return {
    'nvim-treesitter/nvim-treesitter',
    opts = {
        ensure_installed = {
            -- languages
            'bash',
            'c',
            'go',
            'lua',
            'php',
            'python',
            'rust',
            'tsx',
            'typescript',
            -- documents
            'css',
            'scss',
            'diff',
            'dockerfile',
            'html',
            'json',
            'toml',
            'yaml',
            'markdown',
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<A-Up>',
                node_incremental = '<A-Up>',
                node_decremental = '<A-Down>',
                scope_incremental = '<A-Right>',
            },
        },
    },
    config = function(_, opts)
        require 'nvim-treesitter.configs'.setup(opts)
    end
}
