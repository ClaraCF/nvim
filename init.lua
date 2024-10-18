-- Disable netrw --
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Speed up the loading process --
vim.loader.enable()

vim.g.mapleader = " "

-- Tab indentation settings --
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.copyindent = true

-- Other editor configs --
vim.opt.number = true
vim.opt.relativenumber = true

-- Other configs --
vim.opt.termguicolors = true

-- Load Plug-ins --
--require('plug')
require("config.lazy")

-- Plug-ins configs --
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = 'deus'

-- Color Theme
vim.g.terminal_colors = true
--require('monokai').setup()
--vim.cmd.colorscheme "catppuccin-mocha"
require('onedark').setup {
    style = 'warmer'
}
require('onedark').load()

-- Set up Comment.nvim --
require('Comment').setup()

-- Set up nvim-autopairs --
require("nvim-autopairs").setup()

-- Nvim tree --
require("nvim-tree").setup()

-- Mason Setup --
require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})
require("mason-lspconfig").setup()

-- Rust Tools --
local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

-- LSP Diagnostics Options Setup --
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = 'X'})
sign({name = 'DiagnosticSignWarn', text = '!'})
sign({name = 'DiagnosticSignHint', text = '?'})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severitysort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Completion Plugin Setup
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  -- Installed sources:
  sources = {
    { name = 'path' },                              -- file paths
    { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
    { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
    { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'buffer', keyword_length = 2 },        -- source current buffer
    { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
    { name = 'calc'},                               -- source for math calculation
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },
})

-- -- Treesitter Plugin Setup --
-- require('nvim-treesitter.configs').setup {
--   ensure_installed = { "lua", "rust", "toml" },
--   auto_install = true,
--   highlight = {
--     enable = true,
--     additional_vim_regex_highlighting=false,
--   },
--   ident = { enable = true }, 
--   rainbow = {
--     enable = true,
--     extended_mode = true,
--     max_file_lines = nil,
--   }
-- }


-- Vimwiki --
vim.g.vimwiki_list = {{
    path = '~/Documents/Vimwiki',
    template_path = '~/Documents/Vimwiki/Templates/wiki/templates',
    template_default = 'def_template',
    template_ext = '.html',
    syntax = 'default',
    ext = '.wiki',
    path_html = '~/Documents/Vimwiki/HTML',
    --custom_wiki2html = '~/.local/share/python/bin/vimwiki_markdown',
    html_filename_parameterization = 1,
}}
vim.g.vimwiki_global_ext = 0

require('opts')
require('keys')

-- require('gitsigns').setup()

--require('pandoc').setup()
