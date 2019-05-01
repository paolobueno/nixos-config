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
    # systemd-boot.enable = true;
    efi = {
      canTouchEfiVariables = true;
      # assuming /boot is the mount point of the  EFI partition in NixOS (as the installation section recommends).
      efiSysMountPoint = "/boot";
    };
    grub = {
      devices = [ "nodev" ];
      efiSupport = true;
      enable = true;
      version = 2;
    };
  };

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
  hardware.opengl.extraPackages = [ pkgs.vaapiIntel ];

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
  programs.mosh.enable = true;
  programs.java.enable = true;
  programs.ssh = {
    startAgent = true;
  };

  networking = {
    firewall.enable = true;
    firewall.allowedTCPPorts = [22 3000 9418 8000 8080 443 80];
    firewall.allowedTCPPortRanges = [
      {from = 19000; to=19100;}
    ];
    networkmanager = {
      enable = true;
      enableStrongSwan = true;
      packages = [ pkgs.networkmanager-openconnect ];
    };
    hostName = "paolo-nixos";
  };

  fonts = {
    enableDefaultFonts = true;
    fontconfig.penultimate.enable = true;
    fonts = with pkgs; [
      fira-code
      fira-code-symbols
      powerline-fonts
      liberation_ttf
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      emojione
      symbola
      # nerdfonts
      font-awesome_5
      iosevka-bin
      monoid
    ];
  };

  environment.variables = {
    EDITOR = "vim";
    TERMINAL = "st";
  };
  users.users.paolo = {
    isNormalUser = true;
    uid = 1000;
    initialPassword = "test";
    extraGroups = ["wheel" "networkmanager" "docker" "adbusers"];
    shell = pkgs.zsh;
  };

  nix = {
    autoOptimiseStore = true;
    buildCores = 4;
    gc.automatic = true;
  };

  hardware.opengl.driSupport32Bit = true;

  #NVIDIA

  ## bumblebee
  hardware.bumblebee.enable = true;
  hardware.bumblebee.driver = "nvidia";
  hardware.bumblebee.pmMethod = "bbswitch";
  hardware.bumblebee.connectDisplay = true;

  ## Optimus
  # hardware.nvidiaOptimus.disable = true;
  # hardware.opengl.extraPackages = [ pkgs.linuxPackages.nvidia_x11.out ];
  # hardware.opengl.extraPackages32 = [ pkgs_i686.linuxPackages.nvidia_x11.out ];

  ## Prime
  # hardware.nvidia.optimus_prime = {
    # enable = true;
    # nvidiaBusId = "PCI:1:0:0";
    # intelBusId = "PCI:0:2:0";
  # };

  # https://bbs.archlinux.org/viewtopic.php?id=223056
  boot.kernelParams = [
    ''acpi_rev_override=5''
    # ''acpi_osi=! acpi_osi="Windows 2009"''
    # ''pcie_port_pm=off''
  ];

  virtualisation.docker.enable = true;

  powerManagement = {
    enable = true;
  };

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

  system.stateVersion = "19.03";
}

