-- LSP --
-- In this file are all plugins related to LSP
-- and tooling management.

return {
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
}
