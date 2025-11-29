-- Languages --
-- This file contains plugins specific for a particular language.

return {
    {
        'saecki/crates.nvim',
        event = { 'BufRead Cargo.toml' },
        config = function()
            require('crates').setup {
                completion = {
                    cmp = {
                        enabled = true
                    },
                },
            }
        end,
    },

    {
        'mrcjkb/rustaceanvim',
        lazy = false,   -- This plugin is already lazy
        config = require 'plugins.configs.rustaceanvim',
    },

    {
        'nvim-java/nvim-java',
        ft = 'java',
        config = require 'plugins.configs.nvim-java',
    },

    {
        'glebzlat/arduino-nvim',
        ft = 'arduino',
        opts = {},
        config = {
            function() require('arduino-nvim').setup() end,
            filetype = 'arduino',
        },
    },
}

