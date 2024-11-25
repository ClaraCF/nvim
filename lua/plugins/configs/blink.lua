require("blink.cmp").setup {
    -- The keymap can be:
    --   - A preset ('default' | 'super-tab' | 'enter')
    --   - A table of keys => command[] (optionally with a "preset" key to merge with a preset)
    --
    -- When specifying 'preset' in the keymap table, the custom key mappings are merged with the preset,
    -- and any conflicting keys will overwrite the preset mappings.
    -- The "fallback" command will run the next non blink keymap.
    --
    -- Example:
    --
    -- keymap = {
    --   preset = 'default',
    --   ['<Up>'] = { 'select_prev', 'fallback' },
    --   ['<Down>'] = { 'select_next', 'fallback' },
    -- 
    --   -- disable a keymap from the preset
    --   ['<C-e>'] = {},
    -- },
    --
    -- When defining your own keymaps without a preset, no keybinds will be assigned automatically.
    --
    -- Available commands:
    --   show, hide, accept, select_and_accept, select_prev, select_next, show_documentation, hide_documentation,
    --   scroll_documentation_up, scroll_documentation_down, snippet_forward, snippet_backward, fallback
    --
    -- "default" keymap
    --   ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    --   ['<C-e>'] = { 'hide' },
    --   ['<C-y>'] = { 'select_and_accept' },
    --
    --   ['<C-p>'] = { 'select_prev', 'fallback' },
    --   ['<C-n>'] = { 'select_next', 'fallback' },
    --
    --   ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    --   ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    --
    --   ['<Tab>'] = { 'snippet_forward', 'fallback' },
    --   ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
    --
    -- "super-tab" keymap
    --   you may want to set `trigger.completion.show_in_snippet = false`
    --   or use `window.autocomplete.selection = "manual" | "auto_insert"`
    --
    --   ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    --   ['<C-e>'] = { 'hide', 'fallback' },
    --
    --   ['<Tab>'] = {
    --     function(cmp)
    --       if cmp.is_in_snippet() then return cmp.accept()
    --       else return cmp.select_and_accept() end
    --     end,
    --     'snippet_forward',
    --     'fallback'
    --   },
    --   ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
    --
    --   ['<Up>'] = { 'select_prev', 'fallback' },
    --   ['<Down>'] = { 'select_next', 'fallback' },
    --   ['<C-p>'] = { 'select_prev', 'fallback' },
    --   ['<C-n>'] = { 'select_next', 'fallback' },
    --
    --   ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    --   ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    --
    -- "enter" keymap
    --   you may want to set `window.autocomplete.selection = "manual" | "auto_insert"`
    --
    --   ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    --   ['<C-e>'] = { 'hide', 'fallback' },
    --   ['<CR>'] = { 'accept', 'fallback' },
    --
    --   ['<Tab>'] = { 'snippet_forward', 'fallback' },
    --   ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
    --
    --   ['<Up>'] = { 'select_prev', 'fallback' },
    --   ['<Down>'] = { 'select_next', 'fallback' },
    --   ['<C-p>'] = { 'select_prev', 'fallback' },
    --   ['<C-n>'] = { 'select_next', 'fallback' },
    --
    --   ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    --   ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    keymap = {
        -- preset = 'enter',
        -- ['<Tab>'] = { 'select_next', 'fallback' },
        -- ['<S-Tab>'] = { 'select_prev', 'fallback' },
        preset = 'enter',
    },

    accept = {
        create_undo_point = true,
        -- Function used to expand snippets, some possible values:
        -- require('luasnip').lsp_expand     -- For `luasnip` users.
        -- require('snippy').expand_snippet  -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"]          -- For `ultisnips` users.
        expand_snippet = vim.snippet.expand,

        auto_brackets = {
            enabled = true,
            default_brackets = { '(', ')' },
            override_brackets_for_filetypes = {},
            -- Overrides the default blocked filetypes
            force_allow_filetypes = {},
            blocked_filetypes = {},
            -- Synchronously use the kind of the item to determine if brackets should be added
            kind_resolution = {
                enabled = true,
                blocked_filetypes = { 'typescriptreact', 'javascriptreact', 'vue' },
            },
            -- Asynchronously use semantic token to determine if brackets should be added
            semantic_token_resolution = {
                enabled = true,
                blocked_filetypes = {},
                -- How long to wait for semantic tokens to return before assuming no brackets should be added
                timeout_ms = 400,
            },
        },
    },

    trigger = {
        completion = {
            -- 'prefix' will fuzzy match on the text before the cursor
            -- 'full' will fuzzy match on the text before *and* after the cursor
            -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
            keyword_range = 'prefix',
            -- regex used to get the text when fuzzy matching
            -- changing this may break some sources, so please report if you run into issues
            -- TODO: shouldnt this also affect the accept command? should this also be per language?
            keyword_regex = '[%w_\\-]',
            -- after matching with keyword_regex, any characters matching this regex at the prefix will be excluded
            exclude_from_prefix_regex = '[\\-]',
            -- LSPs can indicate when to show the completion window via trigger characters
            -- however, some LSPs (i.e. tsserver) return characters that would essentially
            -- always show the window. We block these by default
            blocked_trigger_characters = { ' ', '\n', '\t' },
            -- when true, will show the completion window when the cursor comes after a trigger character after accepting an item
            show_on_accept_on_trigger_character = true,
            -- when true, will show the completion window when the cursor comes after a trigger character when entering insert mode
            show_on_insert_on_trigger_character = true,
            -- list of additional trigger characters that won't trigger the completion window when the cursor comes after a trigger character when entering insert mode/accepting an item
            show_on_x_blocked_trigger_characters = { "'", '"', '(' },
            -- when false, will not show the completion window automatically when in a snippet
            show_in_snippet = true,
        },

        signature_help = {
            enabled = false,
            blocked_trigger_characters = {},
            blocked_retrigger_characters = {},
            -- when true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
            show_on_insert_on_trigger_character = true,
        },
    },

    fuzzy = {
        -- when enabled, allows for a number of typos relative to the length of the query
        -- disabling this matches the behavior of fzf
        use_typo_resistance = true,
        -- frencency tracks the most recently/frequently used items and boosts the score of the item
        use_frecency = true,
        -- proximity bonus boosts the score of items matching nearby words
        use_proximity = true,
        max_items = 200,
        -- controls which sorts to use and in which order, these three are currently the only allowed options
        sorts = { 'label', 'kind', 'score' },

        prebuilt_binaries = {
            -- Whether or not to automatically download a prebuilt binary from github. If this is set to `false`
            -- you will need to manually build the fuzzy binary dependencies by running `cargo build --release`
            download = true,
            -- When downloading a prebuilt binary, force the downloader to resolve this version. If this is unset
            -- then the downloader will attempt to infer the version from the checked out git tag (if any).
            --
            -- Beware that if the FFI ABI changes while tracking main then this may result in blink breaking.
            force_version = nil,
            -- When downloading a prebuilt binary, force the downloader to use this system triple. If this is unset
            -- then the downloader will attempt to infer the system triple from `jit.os` and `jit.arch`.
            -- Check the latest release for all available system triples
            --
            -- Beware that if the FFI ABI changes while tracking main then this may result in blink breaking.
            force_system_triple = nil,
        },
    },

    sources = {
        -- list of enabled providers
        completion = {
            enabled_providers = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
        },

        -- Please see https://github.com/Saghen/blink.compat for using `nvim-cmp` sources
        providers = {
            lsp = {
                name = 'LSP',
                module = 'blink.cmp.sources.lsp',

                --- *All* of the providers have the following options available
                --- NOTE: All of these options may be functions to get dynamic behavior
                --- See the type definitions for more information
                enabled = true, -- whether or not to enable the provider
                transform_items = nil, -- function to transform the items before they're returned
                should_show_items = true, -- whether or not to show the items
                max_items = nil, -- maximum number of items to return
                min_keyword_length = 0, -- minimum number of characters to trigger the provider
                fallback_for = {}, -- if any of these providers return 0 items, it will fallback to this provider
                score_offset = 0, -- boost/penalize the score of the items
                override = nil, -- override the source's functions
            },
            path = {
                name = 'Path',
                module = 'blink.cmp.sources.path',
                score_offset = 3,
                opts = {
                    trailing_slash = false,
                    label_trailing_slash = true,
                    get_cwd = function(context) return vim.fn.expand(('#%d:p:h'):format(context.bufnr)) end,
                    show_hidden_files_by_default = false,
                }
            },
            snippets = {
                name = 'Snippets',
                module = 'blink.cmp.sources.snippets',
                score_offset = -3,
                opts = {
                    friendly_snippets = true,
                    search_paths = { vim.fn.stdpath('config') .. '/snippets' },
                    global_snippets = { 'all' },
                    extended_filetypes = {},
                    ignored_filetypes = {},
                }

                --- Example usage for disabling the snippet provider after pressing trigger characters (i.e. ".")
                -- enabled = function(ctx) return ctx ~= nil and ctx.trigger.kind == vim.lsp.protocol.CompletionTriggerKind.TriggerCharacter end,
            },
            buffer = {
                name = 'Buffer',
                module = 'blink.cmp.sources.buffer',
                fallback_for = { 'lsp' },
            },
        },
    },
    windows = {
        autocomplete = {
            min_width = 15,
            max_height = 10,
            border = 'none',
            winblend = 0,
            winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
            -- keep the cursor X lines away from the top/bottom of the window
            scrolloff = 2,
            -- note that the gutter will be disabled when border ~= 'none'
            scrollbar = true,
            -- which directions to show the window,
            -- falling back to the next direction when there's not enough space
            direction_priority = { 's', 'n' },
            -- Controls whether the completion window will automatically show when typing
            auto_show = true,
            -- Controls how the completion items are selected
            -- 'preselect' will automatically select the first item in the completion list
            -- 'manual' will not select any item by default
            -- 'auto_insert' will not select any item by default, and insert the completion items automatically when selecting them
            selection = 'preselect',
            -- Controls the cycling behavior when reaching the beginning or end of the completion list.
            cycle = {
                -- When `true`, calling `select_next` at the *bottom* of the completion list will select the *first* completion item.
                from_bottom = true,
                -- When `true`, calling `select_prev` at the *top* of the completion list will select the *last* completion item.
                from_top = true,
            },
        },
        documentation = {
            min_width = 10,
            max_width = 60,
            max_height = 20,
            border = 'padded',
            winblend = 0,
            winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
            -- note that the gutter will be disabled when border ~= 'none'
            scrollbar = true,
            -- which directions to show the documentation window,
            -- for each of the possible autocomplete window directions,
            -- falling back to the next direction when there's not enough space
            direction_priority = {
                autocomplete_north = { 'e', 'w', 'n', 's' },
                autocomplete_south = { 'e', 'w', 's', 'n' },
            },
            -- Controls whether the documentation window will automatically show when selecting a completion item
            auto_show = false,
            auto_show_delay_ms = 500,
            update_delay_ms = 50,
            -- whether to use treesitter highlighting, disable if you run into performance issues
            -- WARN: temporary, eventually blink will support regex highlighting
            treesitter_highlighting = true,
        },
        signature_help = {
            min_width = 1,
            max_width = 100,
            max_height = 10,
            border = 'padded',
            winblend = 0,
            winhighlight = 'Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder',
            -- note that the gutter will be disabled when border ~= 'none'
            scrollbar = false,

            -- which directions to show the window,
            -- falling back to the next direction when there's not enough space
            direction_priority = { 'n', 's' },
            -- whether to use treesitter highlighting, disable if you run into performance issues
            -- WARN: temporary, eventually blink will support regex highlighting
            treesitter_highlighting = true,
        },
        ghost_text = {
            enabled = true,
        },
    },

    highlight = {
        ns = vim.api.nvim_create_namespace('blink_cmp'),
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = true,
    },

    -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'normal',

    -- don't show completions or signature help for these filetypes. Keymaps are also disabled.
    blocked_filetypes = {},

    kind_icons = {
        Text = '󰉿',
        Method = '󰊕',
        Function = '󰊕',
        Constructor = '󰒓',

        Field = '󰜢',
        Variable = '󰆦',
        Property = '󰖷',

        Class = '󱡠',
        Interface = '󱡠',
        Struct = '󱡠',
        Module = '󰅩',

        Unit = '󰪚',
        Value = '󰦨',
        Enum = '󰦨',
        EnumMember = '󰦨',

        Keyword = '󰻾',
        Constant = '󰏿',

        Snippet = '󱄽',
        Color = '󰏘',
        File = '󰈔',
        Reference = '󰬲',
        Folder = '󰉋',
        Event = '󱐋',
        Operator = '󰪚',
        TypeParameter = '󰬛',
    },
}