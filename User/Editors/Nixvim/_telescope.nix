{
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>fg" = "live_grep";
      "<leader>fb" = "buffer";
      "<leader>fh" = "help_tags";
      "<C-p>" = {
        action = "git_files";
        desc = "telescope Git Files";
      };
    };
    extensions.fzf-native = {enable = true;};
  };
}
