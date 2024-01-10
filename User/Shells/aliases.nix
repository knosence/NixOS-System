{
  # Rebindings
    ls = "colorls";
    la = "colorls -a";
    ".." = "cd ..";
    "hm." = "cd ~/.system && home-manager switch --flake .";
    update = "cd ~/.system && nix flake update";

  # shorten system update, upgrades, and garbage collection
    switch = "sudo nixos-rebuild switch && home-manager switch && nix-collect-garbage";
    nixos-switch = "sudo nixos-rebuild switch";
    home-switch = "home-manager switch";
    collect-garbage = "nix-collect-garbage";


}
