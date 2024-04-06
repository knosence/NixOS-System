return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local wk = require "which-key"
    wk.register {
      ["<leader>"] = {
        ["l"] = {
          name = "[L]sp",
          ["r"] = { "<cmd>Telescope lsp_references<CR>", "[LSP] [R]eferences" },
        },
      },
    }
    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    -- vim.keymap.set("n", "<space>ce", vim.diagnostic.open_float)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<C-q>", vim.diagnostic.setloclist)

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "[Lsp] [R]eferences"
        keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "[Lsp] De[c]laration"
        keymap.set("n", "<leader>lc", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "[Lsp] De[f]initions"
        keymap.set("n", "<leader>lf", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "[Lsp] [I]mplementations"
        keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "[Lsp] [T]ype Definitions"
        keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "[Lsp] [Q]uick List"
        keymap.set({ "n", "v" }, "<leader>lq", vim.diagnostic.setloclist, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "[Code] Code [A]ctions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "[Lsp] Smart [R]ename"
        keymap.set("n", "<leader>lR", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "[Lsp] [B]uffer Diagnostics"
        keymap.set("n", "<leader>lb", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "[Code] Show [L]ine diagnostics"
        keymap.set("n", "<leader>cl", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "[Lsp] [P]revious diagnostic"
        keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "[Lsp] [N]ext diagnostic"
        keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "[Lsp] [R]estart"
        keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- Setup language servers.
    local lspconfig = require "lspconfig"
    --
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require "cmp_nvim_lsp"

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()
    lspconfig.emmet_ls.setup {
      capabilities = capabilities,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    }
    lspconfig.cssls.setup {
      capabilities = capabilities,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    }
    lspconfig.tailwindcss.setup {
      capabilities = capabilities,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    }
    lspconfig.prismals.setup {
      capabilities = capabilities,
    }
    lspconfig.html.setup {
      capabilities = capabilities,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    }
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    }
    lspconfig.nil_ls.setup {
      capabilities = capabilities,
    }
    lspconfig.tsserver.setup {
      capabilities = capabilities,
    }
    lspconfig.rust_analyzer.setup {
      -- Server-specific settings. See `:help lspconfig-setup`
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {},
      },
    }

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
  end,
}
