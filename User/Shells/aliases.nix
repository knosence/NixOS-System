{
  # Rebindings
    ls = "colorls";
    la = "colorls -a";
    ".." = "cd ..";
    "home." = "cd ~/.system && home-manager switch --flake .";
    "sys." = "cd ~/.system && sudo nixos-rebuild switch --flake .";
    update = "cd ~/.system && nix flake update";
  
  

  # shorten system update, upgrades, and garbage collection
    sgc = "sudo nixos-rebuild switch && home-manager switch && nix-collect-garbage";
    sys = "sudo nixos-rebuild switch";
    home = "home-manager switch";
    gc = "nix-collect-garbage";


}
