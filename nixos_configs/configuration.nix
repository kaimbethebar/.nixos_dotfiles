{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Package List 
      ./packages.nix 
    ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = false;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      devices = [ "nodev" ];
      enable = true;
      efiSupport = true;
      useOSProber = true;
    };
  };

  networking.hostName = "Nixie"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
	LC_ADDRESS = "en_US.UTF-8";
	LC_IDENTIFICATION = "en_US.UTF-8";
	LC_MEASUREMENT = "en_US.UTF-8";
	LC_MONETARY = "en_US.UTF-8";
	LC_NAME = "en_US.UTF-8";
	LC_NUMERIC = "en_US.UTF-8";
	LC_PAPER = "en_US.UTF-8";
	LC_TELEPHONE = "en_US.UTF-8";
	LC_TIME = "en_US.UTF-8";
  };
  
  # Enable Sway
  programs.sway.enable = true;

  # Setup xserver for GDM
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver = {
	layout = "us";
	xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jesse = {
	isNormalUser = true;
	description = "Jesse Rowan";
	extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
  };

  # Enable Firewall and SSH
  networking.firewall.enable = true;  
  services.openssh.enable = true;

  # Auto Upgrade
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "23.05";
}
