{
  programs.nixvim.plugins = {

    noice = {
      enable = true;

      lsp = {
        hover.enabled = true;
        message = {
          enabled = true;
          view = "notify";
        };
        progress = {
          enabled = true;
          format = "lsp_progress";
          formatDone = "lsp_progress";
          view = "mini";
        };
        signature = {
          enabled = true;
        };
      };

      notify.enabled = true;

      popupmenu = {
        enabled = true;
        backend = "nui";
      };

      smartMove.enabled = true;
      
      messages.enabled = true;

    };

    notify = {
      enable = true;
    };
  };
}
