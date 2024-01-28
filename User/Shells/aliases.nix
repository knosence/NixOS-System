{
  # Rebindings
  ls = "colorls";
  la = "colorls -a";
  ".." = "cd ..";
  "f" = "fzf --print0 | xargs -0 -o vim";

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
}
