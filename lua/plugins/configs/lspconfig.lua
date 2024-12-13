return function(_, opts)
    local lspconfig = require('lspconfig')

    lspconfig.lua_ls.setup {
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using
                    -- (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {
                        'vim',
                        'require'
                    },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    }

    lspconfig.clangd.setup {}

    lspconfig.zls.setup {}

    for server, config in pairs(opts.servers or {}) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
    end

    -- Disable Rust Analyzer
    -- It conflicts with Rustaceanvim
    lspconfig.rust_analyzer = function() end
    lspconfig.cargo = function() end

    -- Enable function signatures for all attached Language Servers
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local bufnr = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)

            -- if vim.tbl_contains({ 'null-ls' }, client.name) then
            --     return
            -- end

            require("lsp_signature").on_attach({}, bufnr)
        end,
    })
end
