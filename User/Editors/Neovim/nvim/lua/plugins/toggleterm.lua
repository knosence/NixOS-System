return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup {
      persist_size = false,
      open_mapping = [[<M-t>]],
      shell = "zsh",
      direction = "float",
    }
    local Terminal = require("toggleterm.terminal").Terminal
    local defaults = {
      direction = "float",
      float_opts = {
        border = "single",
      },
      shade_terminals = false,
    }

    local lazygit = Terminal:new(vim.tbl_deep_extend("force", {
      cmd = "lazygit -ucd ~/.config/lazygit/",
      dir = "git_dir",
      hidden = true,
    }, defaults))

    function _toggle_lazygit()
      lazygit:toggle()
    end

    local irb = Terminal:new(vim.tbl_deep_extend("force", {
      cmd = "irb --noautocomplete",
    }, defaults))

    function _toggle_irb()
      irb:toggle()
    end

    local htop = Terminal:new(vim.tbl_deep_extend("force", {
      cmd = "htop",
    }, defaults))

    function _toggle_htop()
      htop:toggle()
    end

    local wk = require "which-key"
    wk.register {
      ["<leader>"] = {
        ["G"] = {
          "<cmd>lua _lazygit_toggle()<cr>",
          "LazyGit",
        },
        ["x"] = {
          name = "[X]onsole",
          ["h"] = {
            "<cmd>lua _toggle_htop()<cr>",
            "[Console] [H]top",
          },
          ["c"] = {
            "<cmd>lua _toggle_console()<cr>",
            "[Console] [C]onsole",
          },
          ["l"] = {
            "<cmd>lua _toggle_lazygit()<cr>",
            "[Console] [L]azyGit",
          },
        },
      },
    }
  end,
}
