local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neodev.nvim",
    },
  },
  opts = {
    inlay_hint = { enabled = true },
  },
}

-- local function lsp_keymaps(bufnr)
--   local opts = { noremap = true, silent = true }
--   local keymap = vim.api.nvim_buf_set_keymap
--   keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--   keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--   keymatringp(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--   keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--   keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--   keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- end

-- M.on_attach = function(client, bufnr)
--   lsp_keymaps(bufnr)
--
--   if client.supports_method "textDocument/inlayHint" then
--     vim.lsp.inlay_hint.enable(bufnr, true)
--   end
-- end

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

M.toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
end

function M.config()
  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, { desc = "[D]iagnostic" })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
  vim.keymap.set("n", "<leader>S", vim.diagnostic.setloclist, { desc = "Set Loclist" })

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to Declaration" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover" })
      vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "Go to Implementation" })
      vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature Help" })
      vim.keymap.set(
        "n",
        "<leader>nw",
        vim.lsp.buf.add_workspace_folder,
        { buffer = ev.buf, desc = "[N]ew: [W]orkspace Folder" }
      )
      vim.keymap.set(
        "n",
        "<leader>kw",
        vim.lsp.buf.remove_workspace_folder,
        { buffer = ev.buf, desc = "[k]ill: [W]orkspace Folder" }
      )
      vim.keymap.set("n", "<leader>W", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, { buffer = ev.buf, desc = "Workspace Folder" })
      vim.keymap.set(
        "n",
        "<leader>ot",
        vim.lsp.buf.type_definition,
        { buffer = ev.buf, desc = "[O]pen: [T]ype Definitions" }
      )
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "[C]ode: [R]ename" })
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "[C]ode: [A]ction" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "Go to references" })
      vim.keymap.set("n", "<space>cf", function()
        vim.lsp.buf.format { async = true }
      end, { buffer = ev.buf, desc = "[C]ode: [F]ormat" })
      vim.keymap.set("n", "<leader>lh", M.toggle_inlay_hints, { buffer = ev.buf, desc = "[L]sp: Inlay Hints" })
    end,
  })

  --   local wk = require "which-key"
  --   wk.register {
  --     ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "[C]ode: [A]ction" },
  --     ["<leader>lf"] = {
  --       "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
  --       "Code: [F]ormat",
  --     },
  --     ["<leader>li"] = { "<cmd>LspInfo<cr>", "[I]nfo" },
  --     ["<leader>]d"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
  --     ["<leader>lh"] = { "<cmd>lua require('lspconfig').toggle_inlay_hints()<cr>", "[H]ints" },
  --     ["<leader>[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
  --     ["<leader>od"] = { "<cmd>vim.diagnostic.open_float()<cr>", "Open Diagnostic" },
  --     ["<leader>ll"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "Code[L]ens Action" },
  --     ["<leader>lq"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "[Q]uickfix" },
  --     ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "[R]ename" },
  --   }
  --
  --   wk.register {
  --     ["<leader>ca"] = {
  --       a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code [A]ction", mode = "v" },
  --     },
  --   }
  --
  local lspconfig = require "lspconfig"
  local icons = require "../config/icons"

  local servers = {
    "lua_ls",
    "cssls",
    "html",
    "eslint",
    "tailwindcss",
    "emmet_ls",
    "tsserver",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "nil_ls",
    "rust_analyzer",
    "prismals",
  }

  local default_diagnostic_config = {
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
      },
    },
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }
  vim.diagnostic.config(default_diagnostic_config)

  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  require("lspconfig.ui.windows").default_options.border = "rounded"

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup {}
    end

    lspconfig[server].setup(opts)
  end
end

return M
