{
  programs.nixvim.plugins = {
    nvim-tree = {
      enable = true;
      modified.enable = true;
      autoClose = true;
      # notify.threshold = "error";
      selectPrompts = true;
      # view.float.enable = true;
      disableNetrw = true;
      hijackCursor = true;
      hijackNetrw = true;
      hijackUnnamedBufferWhenOpening = true;
      actions.openFile.quitOnOpen = true;

      diagnostics = {
        enable = true;
        showOnDirs = true;
      };
      git = {
        enable = true;
        ignore = false;
        };
      ui.confirm = {
        remove = true;
        trash = true;
      };
      renderer = {
        addTrailing = true;
        highlightGit = true;
        highlightModified = "all";
      };
    };
  };
}
