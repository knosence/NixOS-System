local wk = require "which-key"

return {
  "folke/which-key.nvim",
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "whichkey")
    require("which-key").setup(opts)

    wk.register {
      -- Control Calls
      -- Meta Calls
      -- Leader Calls
      ["<leader>"] = {
        u = { name = "UndoTree" },
        -- stylua: ignore start
        -- [" "] = { name = " Quick" },
        b     = { name = "󰈔 Buffer" },
        c     = { name = "󰘦 Code" },
        co    = { name = " Copilot" },
        g     = { name = "󰊤 Git" },
        gw    = { name = "󰉋 Workspace" },
        h     = { name = "󰛢 Harpoon/Hop" },
        l     = { name = "󰐰 Lsp" },
        n     = { name = "󰐕 new" },
        o     = { name = "󰘖 Open" },
        p     = { name = "󰈈 Preview" },
        q     = { name = "󰁯 Session" },
        r     = { name = "󰑇 Refactor" },
        f     = { name = "󱦞 Find" },
        t     = { name = "󰓩 Tab" ,
          n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
          N = { "<cmd>tabnew %<cr>", "New Tab" },
          o = { "<cmd>tabonly<cr>", "Only" },
          h = { "<cmd>-tabmove<cr>", "Move Left" },
          l = { "<cmd>+tabmove<cr>", "Move Right" },
        },
        x     = { name = "󰙨 Test" },
        T     = { name = " Toggle" },
        Tn    = { name = " Line number" },
        w     = { name = " Window",
          ['o'] = {"<cmd><cr>", name = "Open Window"}
        },
        z     = { name = "󰍻 Extras" },
      },
    }
  end,
  opts = {
    icons = {
      group = "", -- disable + to make Nerf fonts usable
    },
  },
}
