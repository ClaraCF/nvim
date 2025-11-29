return {
    -- Discord Rich Presence --
    { 'andweeb/presence.nvim' },

    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = require 'plugins.opts.lazydev',
    },
    
    {
        'voldikss/vim-floaterm',
        cmd = {'FloatermToggle', 'FloatermNew'},
    },
}

