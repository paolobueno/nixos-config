# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, pkgs_i686, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi = {
      canTouchEfiVariables = true;
      # assuming /boot is the mount point of the  EFI partition in NixOS (as the installation section recommends).
      efiSysMountPoint = "/boot";
    };
  };
  # boot.blacklistedKernelModules = [ "nvidia" ];
  # boot.kernelParams = [
    # ''"acpi_osi="!Windows 2015"''
  # ];

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  sound.enable = true;
  hardware.bluetooth.enable = true;

  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    support32Bit = true;
  };

  boot.extraModprobeConfig = ''
    options ath10k_core skip_otp=y
  '';
  # hardware.enableAllFirmware = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = [ "main" "brackets" "pattern" ];
    };
    ohMyZsh.enable = true;
    ohMyZsh.plugins = ["git"];
    ohMyZsh.theme = "agnoster";
  };
  programs.adb.enable = true;

  networking = {
    firewall.enable = true;
    firewall.allowedTCPPorts = [3000 9418 8000 8080];
    firewall.allowedTCPPortRanges = [
      {from = 19000; to=19100;}
    ];
    networkmanager.enable = true;
    hostName = "paolo-nixos";
  };

  fonts.enableDefaultFonts = true;
  fonts.fonts = with pkgs; [
    fira-code
    fira-code-symbols
    powerline-fonts
    liberation_ttf
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    emojione
    symbola
  ];

  users.users.paolo = {
    isNormalUser = true;
    uid = 1000;
    initialPassword = "test";
    extraGroups = ["wheel" "networkmanager" "docker" "adbusers"];
    shell = pkgs.zsh;
  };

  systemd.user.services.powertop = {
    enable = true;
    description = "powertop autotune service";
    wantedBy = [ "multi-user.target" ];
    path = with pkgs; [ powertop ];
    serviceConfig = {
      ExecStart = "${pkgs.powertop}/bin/powertop --auto-tune";
      Type = "oneshot";
    };
  };

  nix = {
    autoOptimiseStore = true;
    buildCores = 4;
    gc.automatic = true;
  };

  #NVIDIA

  # hardware.bumblebee.enable = true;
  # hardware.bumblebee.connectDisplay = true;

  # hardware.opengl.driSupport32Bit = true;

  # disable card with bbswitch by default
  # hardware.nvidiaOptimus.disable = true;
  # install nvidia drivers in addition to intel one
  # hardware.opengl.extraPackages = [ nvidia.out ];
  # hardware.opengl.extraPackages32 = [ nvidia32.out ];

  virtualization.docker.enable = "true";

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      stable = import <stable> {
        config = config.nixpkgs.config;
      };
    };
  };
  environment.systemPackages = (import ./packages.nix pkgs);
  services = (import ./services.nix pkgs);

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.03"; # Did you read the comment?
}

