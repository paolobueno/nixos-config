pkgs : with pkgs;

[
  (import ./fhs.nix pkgs)
  (import ./vim.nix pkgs)
  arandr              # Screen control
  bashmount           # Mount USB storage
  bind                # DNS utilities
  google-chrome       # Web browser
  curl                # Web client
  feh                 # Image viewer
  gcc                 # C compiler
  git                 # Source control system
  gitAndTools.hub     # github compiler
  gnome3.dconf        # GNome configuration module used by other gnome software
  gnumake             # Build tool
  gnupg               # Encryption toolset
  gparted             # Disk drive manager
  jmtpfs              # Android Phone mounter
  linuxPackages.perf  # Linux performance tools such as `time`
  lshw                # List hardware
  maim                # Takes screenshots
  imagemagick         # Image editing suite
  meld                # View differences between text files
  nnn                 # File browser
  psmisc              # Process management utilities
  slop                # Screen region selection tool
  tldr                # Linux command line cheat sheet
  tixati
  unzip               # Zip archive extractor
  usbutils            # USB device management utilities
  mpv                 # Video player
  wget                # Web client
  which               # Linux executable finder
  xdo                 # X Server client
  xorg.xev
  xorg.xf86videointel
  xsel                # Clipboard manager
  zip                 # Zip archive creator
  pciutils
  openconnect         # cisco vpn
  vpnc                # another cisco vpn client
  ntfs3g

  # runtimes
  ruby
  python
  nodejs-10_x
  docker

  # terminal and utils
  tmux
  st
  rxvt_unicode
  htop
  jq
  pv
  xclip
  appimage-run

  # gtk theming
  lxappearance
  arc-icon-theme
  arc-theme
  moka-icon-theme

  # IDEs and devtools
  vscode
  insomnia
  robo3t

  # gui applets
  networkmanagerapplet
  blueman
  pavucontrol

  # extra, personal
  dropbox
  spotify
  franz
] ++ (with nodePackages; [
  yarn                # Alternative to npm
  eslint              # linter
])
