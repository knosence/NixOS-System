{
  # Rebindings
  ls = "colorls";
  la = "colorls -a";
  ".." = "cd .. && ls";
  "f" = "fzf --print0 | xargs -0 -o vim";

  # Flakes commands for quicker access
  nix-prisma = "cp ~/.system/User/flakes/prisma.nix flake.nix";
  run-flake = "nix develop";

  # shorten system update, upgrades, and garbage collection
  sgc =
    "sudo nixos-rebuild switch && home-manager switch && nix-collect-garbage --delete-older-than 5d";
  sys = "sudo nixos-rebuild switch";
  home = "home-manager switch";
  gc = "nix-collect-garbage --delete-older-than 5d";
  ## Flakes
  "home." = "cd ~/.system && home-manager switch --flake .";
  "sys." = "cd ~/.system && sudo nixos-rebuild switch --flake .";
  update = "cd ~/.system && nix flake update";

  # Projects
  nvim-unity-market = "cd ~/Projects/unity-market-admin && zellij && nvim .";
  code = "zellij --layout ~/.config/zellij/layouts/default.kdl";
}
