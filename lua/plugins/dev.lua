-- Development --
-- In this file are all plugins related to QoL
-- regarding development in general, not specific
-- to a language in particular.

return {
    {
        'L3MON4D3/LuaSnip',
        build = 'make install_jsregexp',
        cmd = { 'LuaSnipListAvailable', 'LuaSnipUnlinkCurrent' },
    },

    -- Tree Sitter --
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        config = require 'plugins.configs.treesitter',
    },

    {
        'ray-x/lsp_signature.nvim',
        event = 'InsertEnter',
        opts = {
            bind = true,
            handler_opts = {
                border = 'rounded'
            }
        },
        config = function(_, opts) require 'lsp_signature'.setup(opts) end
    },

    {
        'chrisgrieser/nvim-lsp-endhints',
        event = 'LspAttach',
    },

    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true
    },

    {
        'numToStr/Comment.nvim',
        opts = {},
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        ---@module 'ibl'
        ---@type ibl.config
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'folke/trouble.nvim',
        cmd = 'Trouble',
        opts = {},
        keys = {
            {
                '<leader>xx',
                '<cmd>Trouble diagnostics toggle<cr>',
                desc = 'Diagnostics (Trouble)',
            },
            {
                '<leader>xX',
                '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
                desc = 'Buffer Diagnostics (Trouble)',
            },
            {
                '<leader>cs',
                '<cmd>Trouble symbols toggle focus=false<cr>',
                desc = 'Symbols (Trouble)',
            },
            {
                '<leader>cl',
                '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
                desc = 'LSP Definitions / references / ... (Trouble)',
            },
            {
                '<leader>xL',
                '<cmd>Trouble loclist toggle<cr>',
                desc = 'Location List (Trouble)',
            },
            {
                '<leader>xQ',
                '<cmd>Trouble qflist toggle<cr>',
                desc = 'Quickfix List (Trouble)',
            },
        },
    },
}

