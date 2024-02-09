{
  programs.nixvim.plugins = {
    nvim-tree = {
      enable = true;
      git.enable = true;
      modified.enable = true;
    };
  };
}
