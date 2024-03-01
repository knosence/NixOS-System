{
  programs.nixvim.plugins = {

    noice = {
      enable = true;

      cmdline = {
        enabled = true;
        opts = { bottom_search = false; };
      };

      lsp = {
        hover.enabled = true;
        message = {
          enabled = true;
          view = "notify";
        };
      };

      notify.enabled = true;

      popupmenu = {
        enabled = true;
        backend = "nui";
      };

      smartMove.enabled = true;

      messages.enabled = false;

    };

    notify = { enable = true; };
  };
}
