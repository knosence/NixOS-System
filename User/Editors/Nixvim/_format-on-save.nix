{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        pname = "format-on-save.nvim";
        version = "main";
        src = pkgs.fetchFromGitHub {
          owner = "elentok";
          repo = "format-on-save.nvim";
          rev = "25c13e0ce167db0255456cac10158b27d2be30c0";
          sha256 = "0bsxfj6g8fii9nn92vl15hdhafx3fikgiz4srr7y10pxz01c5s4c";
        };
      })
    ];
    extraConfigLua = ''
      require('format-on-save').setup()
    '';
  };
}
