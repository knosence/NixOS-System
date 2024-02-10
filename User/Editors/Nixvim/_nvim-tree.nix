{
  programs.nixvim.plugins = {
    nvim-tree = {
      enable = true;
      diagnostics = {
        enable = true;
        showOnDirs = true;
      };
      git = {
        enable = true;
        ignore = false;
        };
      modified.enable = true;
      autoClose = true;
      ui.confirm = {
        remove = true;
        trash = true;
      };
      renderer = {
        addTrailing = true;
        highlightGit = true;
        highlightModified = "all";
      };
      # notify.threshold = "error";
      selectPrompts = true;
      # view.float.enable = true;
    };
  };
}
