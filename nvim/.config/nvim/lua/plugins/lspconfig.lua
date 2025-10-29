-- Language-server related plugins and their configuration
-- Modified from https://github.com/NoOPeEKS/DataNvim/blob/main/lua/plugins/lspconfig.lua
return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "r_language_server" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = vim.lsp.config
            vim.lsp.config('lua_ls', {
                capabilities = capabilities,
            })
            vim.lsp.config('pyright', {
                capabilities = capabilities,
            })
            vim.lsp.config('r_language_server', {
                capabilities = capabilities,
            })

            -- Key bindings to interact with the language server. I've disabled most of them for now.
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
            -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
            -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, {})
            -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, {})
            -- vim.keymap.set("n", "<space>wl", function()
            --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            -- end, {})
            -- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, {})
            -- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
            -- vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            -- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, {})
            -- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, {})


            -- Keep language server diagnostics off by default, toggle with a key binding
            vim.diagnostic.enable(false)
            vim.keymap.set('n', '<leader>td', function()
              vim.diagnostic.enable(not vim.diagnostic.is_enabled())
            end, { silent = true, noremap = true })

        end,
    },
}
