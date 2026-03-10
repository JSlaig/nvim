return {
    'mfussenegger/nvim-dap',
    dependencies = {
        -- UI for the debugger
        'rcarriga/nvim-dap-ui',

        -- Required depency
        'nvim-neotest/nvim-nio',

        -- Optional
        'mason-org/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',

        -- Inline variable values
        'theHamsta/nvim-dap-virtual-text',
    },
    keys = {
        {
            '<leader>dap',
            function()
                require('dap').continue()
            end,
            desc = 'Debug: Start/Continue',
        },
        {
            '<leader>di',
            function()
                require('dap').step_into()
            end,
            desc = 'Debug: Step into',
        },
        {
            '<leader>do',
            function()
                require('dap').step_over()
            end,
            desc = 'Debug: Step over',
        },
        {
            '<leader>dot',
            function()
                require('dap').step_out()
            end,
            desc = 'Debug: Step out',
        },
        {
            '<leader>db',
            function()
                require('dap').toggle_breakpoint()
            end,
            desc = 'Debug: Toggle breakpoint',
        },
    },
    config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'

        dapui.setup {
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        }

        -- Auto open/close DAP UI
        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        -- Setup virtual text to show variable values inline
        require("nvim-dap-virtual-text").setup()

        require("mason-nvim-dap").setup({
            ensure_installed = { "js-debug-adapter" },
            automatic_setup = true,
        })

        -- 3️⃣ Chrome debug adapter (add here!)
        local mason_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"

        vim.env.PATH = vim.env.PATH .. ";C:\\Program Files\\nodejs"

        dap.adapters.chrome = {
            type = "server",
            host = "127.0.0.1",
            port = 8124,
            executable = {
                command = "node",
                args = { mason_path .. "/js-debug/src/dapDebugServer.js" },
            }
        }

        dap.configurations.javascript = {
            {
                type = "chrome",
                request = "launch",
                name = "Launch Chrome against localhost",
                url = "https://localhost:8443",        -- your dev server
                webRoot = "${workspaceFolder}/igs-atm-core/web-client-extjs",      -- project root
                sourceMaps = true,
            },
        }

        -- Optional: TypeScript support
        dap.configurations.typescript = dap.configurations.javascript

    end,
}
