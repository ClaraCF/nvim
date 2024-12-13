return {
    -- Discord Rich Presence --
    {'andweeb/presence.nvim'},

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
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        config = require 'plugins.configs.mason'
    },


    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },
        config = require 'plugins.configs.lspconfig',
    },

    -- Completion framework --
    -- {'hrsh7th/nvim-cmp'},
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp"
    },

    -- {'hrsh7th/cmp-path'},
    -- {'hrsh7th/cmp-buffer'},

    -- Icons --
    {'nvim-tree/nvim-web-devicons'},

    -- Color Theme --
    -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

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
        lazy = true,
    },

    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false, -- This plugin is already lazy
        config = require 'plugins.configs.rustaceanvim',
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
