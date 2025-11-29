-- Development --
-- In this file are all plugins related to QoL
-- regarding development in general, not specific
-- to a language in particular.

return {
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp"
    },

    -- Tree Sitter --
    {
        'nvim-treesitter/nvim-treesitter',
        config = require 'plugins.configs.treesitter',
        lazy = false,
    },

    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {
            bind = true,
            handler_opts = {
                border = "rounded"
            }
        },
        config = function(_, opts) require 'lsp_signature'.setup(opts) end
    },

    {
        "chrisgrieser/nvim-lsp-endhints",
        event = "LspAttach",
        opts = {},
    },

    {
        'windwp/nvim-autopairs',
        opts = {},
    },

    { 'numToStr/Comment.nvim' },

    {
        'nvim-tree/nvim-tree.lua',
        opts = {},
    },

    {
        'stevearc/conform.nvim',
        opts = {},
    },

    {
        'saghen/blink.cmp',
        build = 'cargo build --release',
        lazy = false, -- lazy loading handled internally
        dependencies = 'rafamadriz/friendly-snippets',
        opts = require 'plugins.opts.blink',
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'folke/trouble.nvim',
        opts = {},
        cmd = "Trouble",
    },
}

