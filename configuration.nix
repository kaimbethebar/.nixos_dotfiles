# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
	[ # Include the results of the hardware scan.
  	  ./hardware-configuration.nix
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
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Gnome and remove unwanted software
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
	gnome-photos
	gnome-tour
  ]) ++ (with pkgs.gnome; [
	cheese # webcam tool
	gnome-music
	gedit # text editor
	epiphany # web browser
	geary # email reader
	evince # document viewer
	gnome-characters
	tali # poker game
	iagno # go game
	hitori # sudoku game
	atomix # puzzle game
  ]);

  # Configure keymap in X11
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
	extraGroups = [ "networkmanager" "wheel" ];
	packages = with pkgs; [	];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	vim
	neofetch
	btop
        git
        gimp
        firefox
        discord
  ];

  # Enable Firewall
  networking.firewall.enable = true;  

  # Enable Steam
  programs.steam = {
	enable = true;
	remotePlay.openFirewall = true;
	dedicatedServer.openFirewall = true;
  };
  hardware.opengl.driSupport32Bit = true;

  services.openssh.enable = true;


  system.stateVersion = "23.05"; # Did you read the comment?
}



