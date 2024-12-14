return {
    -- Discord Rich Presence --
    {'andweeb/presence.nvim'},

    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = require 'plugins.opts.lazydev',
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },

    -- Git Signs --
    {
        'lewis6991/gitsigns.nvim',
        opts = {},
    },

    {
        'saghen/blink.cmp',
        build = 'cargo build --release',
        lazy = false, -- lazy loading handled internally
        dependencies = 'rafamadriz/friendly-snippets',
        opts = require 'plugins.opts.blink',
    },

    -- Mason LSP server, debugger and linter Manager --
    {
        'williamboman/mason.nvim',
        config = require 'plugins.configs.mason',
    },

    {
        'williamboman/mason-lspconfig.nvim',
        config = require 'plugins.configs.mason-lspconfig',
    },

    {
        'neovim/nvim-lspconfig',
        dependencies = { 
            'williamboman/mason.nvim',
            'mason-lspconfig.nvim',
            'saghen/blink.cmp'
        },
        config = require 'plugins.configs.lspconfig',
    },

    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp"
    },

    -- Icons --
    {'nvim-tree/nvim-web-devicons'},

    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Tree Sitter --
    {
        'nvim-treesitter/nvim-treesitter',
        config = require 'plugins.configs.treesitter',
        lazy = false,
    },

    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false, -- This plugin is already lazy
        config = require 'plugins.configs.rustaceanvim',
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
        config = function(_, opts) require'lsp_signature'.setup(opts) end
    },

    {
        "chrisgrieser/nvim-lsp-endhints",
        event = "LspAttach",
        opts = {},
    },

    {
        'saecki/crates.nvim',
        event = { "BufRead Cargo.toml" },
        config = function()
            require('crates').setup()
        end,
    },

    {
        "glebzlat/arduino-nvim",
        opts = {},
        config = {
            function() require("arduino-nvim").setup() end,
            filetype = "arduino",
        }
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

    {
        'rcarriga/nvim-notify',
        lazy = true,
        opts = {},
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Other --
    {'voldikss/vim-floaterm'},

    -- {'RRethy/vim-illuminate'},
    {
        'yamatsum/nvim-cursorline',
        opts = {},
    },

    {
        'folke/trouble.nvim',
        opts = {},
        cmd = "Trouble",
    },

    {'numToStr/Comment.nvim'},

    {
        'windwp/nvim-autopairs',
        opts = {},
    },

    {
        'nvim-tree/nvim-tree.lua',
        opts = {},
    },

    {
        'stevearc/conform.nvim',
        opts = {},
    },
}
