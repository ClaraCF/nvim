vim.opt.termguicolors = true

-- Color Theme --
vim.cmd("colorscheme carbonfox")

-- Status Line --
require('lualine').setup ({
    options = {
        icons_enabled = true,
        theme = 'carbonfox',
    }
})

vim.notify = require('notify')

