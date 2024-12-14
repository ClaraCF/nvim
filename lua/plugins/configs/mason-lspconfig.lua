return function()
    require('mason-lspconfig').setup()

    require('mason-lspconfig').setup_handlers {
        -- Default handler for all LSPs
        function (server_name)
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            require('lspconfig')[server_name].setup({ capabilities = capabilities })
        end,

        -- Disable Rust Analyzer and Cargo
        -- It conflicts with rustaceanvim
        ['rust_analyzer'] = function() end,
    }
end
