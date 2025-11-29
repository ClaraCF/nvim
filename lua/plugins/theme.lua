-- Themes --
-- In this file are all plugins that either define a theme,
-- icons, bar, or anything UI/UX and visual not related
-- specifically to programming or a programming language.

return {
    {
        'lewis6991/gitsigns.nvim',
        opts = {},
    },

    { 'nvim-tree/nvim-web-devicons' },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    { 'EdenEast/nightfox.nvim' },

    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
            }
        end,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    {
        'rcarriga/nvim-notify',
        lazy = true,
        opts = {},
    },

    {
        'ya2s/nvim-cursorline',
        opts = {},
    },
}

