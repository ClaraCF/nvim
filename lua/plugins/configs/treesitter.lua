return function()
    vim.wo.foldmethod = 'expr'
    vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
    vim.opt.foldenable = false

    require 'nvim-treesitter.configs'.setup {
        illuminate = {
            enable = true,
        },

        indent = {
            enable = true,
        },

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },

        incremental_selection = {
            enable = true,
        }
    }
end
