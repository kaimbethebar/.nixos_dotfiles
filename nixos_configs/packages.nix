{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    swaybg 
    vim
    kitty
    cava
    wofi
    waybar
    neofetch
    btop
    git
    grim
    slurp
    ranger
    gimp
    alejandra
    firefox
    webcord
    imv
    mpv
    unzip
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  hardware.opengl.driSupport32Bit = true;


  fonts.packages = with pkgs; [
    font-awesome
    nerdfonts
  ];

}
