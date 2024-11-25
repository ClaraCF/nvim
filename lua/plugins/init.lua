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

    -- Mason LSP server, debugger and linter Manager --
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },

    {
        'saghen/blink.cmp',
        version = 'v0.*',
        lazy = false, -- lazy loading handled internally
        dependencies = 'rafamadriz/friendly-snippets',
    },


    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },
        opts = {
            setup = {
                rust_analyzer = function()
                    return true 
                end,
            },
        },
        config = function(_, opts)
            local lspconfig = require('lspconfig')
            for server, config in pairs(opts.servers or {}) do
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end
        end,
    },

    -- Completion framework --
    -- {'hrsh7th/nvim-cmp'},
    {
        'saghen/blink.cmp',
        lazy = false, -- lazy loading handled internally
        dependencies = 'rafamadriz/friendly-snippets',
    },

    -- LSP completion source --
    -- {'hrsh7th/cmp-nvim-lsp'},

    -- Useful completion sources --
    -- {'hrsh7th/cmp-nvim-lua'},
    -- {'hrsh7th/cmp-nvim-lsp-signature-help'},

    {
        "L3MON4D3/LuaSnip",
        build = "mqake install_jsregexp"
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

    -- ------------------ --


    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Tree Sitter --
    {'nvim-treesitter/nvim-treesitter'},


    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false, -- This plugin is already lazy
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
    {'RRethy/vim-illuminate'},
    {'folke/trouble.nvim'},

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
