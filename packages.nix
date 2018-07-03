pkgs : with pkgs; [
  # (import ./node-v10.nix {
  #   inherit stdenv;
  #   inherit callPackage;
  #   inherit lib;
  # })
  (import ./vim.nix pkgs)
  arandr              # Screen control
  bashmount           # Mount USB storage
  bind                # DNS utilities
  google-chrome       # Web browser
  curl                # Web client
  # dmenu2              # Customizable start meny used in xmonad config
  feh                 # Image viewer
  firefox             # Web browser
  gcc                 # C compiler
  git                 # Source control system
  gnome3.dconf        # GNome configuration module used by other gnome software
  gnumake             # Build tool
  gnupg               # Encryption toolset
  gopass              # Password manager compatible with Pass
  gparted             # Disk drive manager
  jmtpfs              # Android Phone mounter
  linuxPackages.perf  # Linux performance tools such as `time`
  lshw                # List hardware
  maim                # Takes screenshots
  meld                # View differences between text files
  newsboat            # RSS Reader
  nixops              # Devops tools by Nix
  nnn                 # File browser
  pass                # Password manager
  pidgin-with-plugins # Chat client
  psmisc              # Process management utilities
  slop                # Screen region selection tool
  tldr                # Linux command line cheat sheet
  transmission        # Torrenting software
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

  # runtimes
  ruby
  python
  nodejs-10_x
  docker

  # terminal and utils
  tmux
  st
  htop
  jq

  # IDEs
  vscode
  arduino
  android-studio

  # gui applets
  networkmanagerapplet
  blueman
  pavucontrol

  # extra
  dropbox

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
