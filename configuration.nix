# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
# Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  sound.enable = true;
  hardware.bluetooth.enable = true;

  hardware.pulseaudio.enable = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;
  boot.extraModprobeConfig = ''
    options ath10k_core skip_otp=y
  '';
  # hardware.enableAllFirmware = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    ohMyZsh.enable = true;
    ohMyZsh.plugins = ["git"];
    ohMyZsh.theme = "robbyrussell";
  };

  networking = {
    firewall.enable = true;
    firewall.allowedTCPPorts = [3000 9418];
    networkmanager.enable = true;
    hostName = "paolo-nixos";
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  fonts.enableDefaultFonts = true;
  fonts.fonts = with pkgs; [
    fira-code
    powerline-fonts
    xlsfonts
  ];

  users.users.paolo = {
    isNormalUser = true;
    uid = 1000;
    initialPassword = "test";
    extraGroups = ["wheel" "networkmanager" "docker"];
    shell = pkgs.zsh;
    packages = [
      pkgs.steam
      pkgs.steam-run
    ];
  };

  # #NVIDIA

  # hardware.bumblebee.enable = true;
  # hardware.bumblebee.connectDisplay = true;

  # disable card with bbswitch by default
  # hardware.nvidiaOptimus.disable = true;
  # install nvidia drivers in addition to intel one
  # hardware.opengl.extraPackages = [ config.boot.kernelPackages.nvidia_x11.out ];
  # hardware.opengl.extraPackages32 = [ pkgs_i686.linuxPackages.nvidia_x11.out ];

  virtualization.docker.enable = "true";

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = (import ./packages.nix pkgs);
  services = (import ./services.nix pkgs);

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.nixos.stateVersion = "18.03"; # Did you read the comment?
}

