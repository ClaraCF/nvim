return function ()
    local server_config = require('rustaceanvim.config.server')

    vim.g.rustaceanvim = {
        tools = {
            cargo_override = nil,
            enable_nextest = true,
            enable_clippy = true,

            -- Use flyCheck
            -- on_initialized = function() vim.cmd.RustLsp('flyCheck') end,

            reload_workspace_from_cargo_toml = true,

            hover_actions = {
                replace_builtin_hover = false,
            },

            code_actions = {
                group_icon = ' ▶',
                ui_select_fallback = false,
            },

            float_win_config = {
                auto_focus = false,

                open_split = 'horizontal',
            },

            crate_graph = {
                backend = 'wayland',
                output = nil,
                full = true,
                pipe = nil,
            },
        },

        server = {
            capabilities = server_config.create_client_capabilities(),
            standalone = false,

            settings = function(project_root, default_settings)
                return server_config.load_rust_analyzer_settings(project_root, { default_settings = default_settings })
            end,

            default_settings = {
                ['rust-analyzer'] = {
                    -- Disable checkOnSave as flyCheck is in use
                    -- checkOnSave = false,
                },
            },
            load_vscode_settings = false,
            status_notify_level = 'error',
        },

        dap = {

        },
    }
end
