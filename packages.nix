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
  firefox             # Web browser
  gcc                 # C compiler
  git                 # Source control system
  gitAndTools.hub     # github compiler
  gnome3.dconf        # GNome configuration module used by other gnome software
  gnumake             # Build tool
  gnupg               # Encryption toolset
  gopass              # Password manager compatible with Pass
  gparted             # Disk drive manager
  jmtpfs              # Android Phone mounter
  linuxPackages.perf  # Linux performance tools such as `time`
  lshw                # List hardware
  maim                # Takes screenshots
  imagemagick         # Image editing suite
  meld                # View differences between text files
  nixops              # Devops tools by Nix
  nnn                 # File browser
  pass                # Password manager
  psmisc              # Process management utilities
  slop                # Screen region selection tool
  tldr                # Linux command line cheat sheet
  transmission        # Torrenting software
  tixati
  unzip               # Zip archive extractor
  usbutils            # USB device management utilities
  vlc                 # Video player
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
  nwjs

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
  arduino
  android-studio
  insomnia
  robo3t

  # gui applets
  networkmanagerapplet
  blueman
  pavucontrol

  # extra, personal
  dropbox
  ncmpcpp
  primus
  spotify
  franz
  # mudlet # TODO: Fix and update to 3.10
] ++ (with haskellPackages; [
  ghc                 # Haskell compiler
]) ++ (with nodePackages; [
  dat                 # Decentralized web client
  node2nix            # Converts package.json to default.nix
  yarn                # Alternative to npm
  eslint              # linter
  bower               # legacy front end package manager
  grunt-cli           # legacy task runner
])
