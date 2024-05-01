{ pkgs, ... }:
let

  linuxPackages = with pkgs; [ neovide ];
in
{
  home.packages = with pkgs; [ ] ++ (linuxPackages);

  programs.yazi = {
    enable = true;
  };

  home.file."./.config/yazi/" = {
    source = ./yazi;
    recursive = true;
    force = true;
  };

  # home.sessionVariables = {
  #   LIBLLDB_PATH = "${lldbAdapter}/lib/libcodelldb.so";
  #   CODELLDB_PATH = "${lldbAdapter}/bin/codelldb";
  # };
}
