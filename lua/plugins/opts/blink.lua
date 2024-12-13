return {
    keymap = { preset = "super-tab" },

    appearance = {
        -- nightfox theme does not support this plugin
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
    },

    snippets = {
        expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
        active = function(filter)
            if filter and filter.direction then
                return require('luasnip').jumpable(filter.direction)
            end
            return require('luasnip').in_snippet()
        end,
        jump = function(direction) require('luasnip').jump(direction) end,
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        -- optionally disable cmdline completions
        -- cmdline = {},
    }
}
