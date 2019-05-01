pkgs : with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
  pygments
  pip
  tensorflow
  numpy
  pandas
  scikitlearn
  matplotlib
  h5py
  conda
];
  my-python = python3.withPackages my-python-packages;
in
[
  (callPackage ./fhs.nix {})
  (import ./vim.nix pkgs)
  arandr              # Screen control
  bashmount           # Mount USB storage
  bind                # DNS utilities
  google-chrome       # Web browser
  chromium
  firefox
  curl                # Web client
  feh                 # Image viewer
  nomacs              # Image viewer
  gcc                 # C compiler
  git                 # Source control system
  gitAndTools.hub     # GitHub client, wrapper around `git`
  gnome3.dconf        # Gnome configuration module used by other gnome software
  gnumake             # Build tool
  gnupg               # Encryption toolset
  gparted             # Disk drive manager
  jmtpfs              # Android Phone mounter
  linuxPackages.perf  # Linux performance tools such as `time`
  lshw                # List hardware
  maim                # Takes screenshots
  imagemagick         # Image editing suite
  vips                # imagemagick alternative
  meld                # View differences between text files
  nnn                 # File browser
  psmisc              # Process management utilities
  slop                # Screen region selection tool
  tldr                # Linux command line cheat sheet
  tixati              # Torrent client
  unzip               # Zip archive extractor
  p7zip
  usbutils            # USB device management utilities
  mpv                 # Video player
  ffmpeg
  wget                # Web client
  which               # Linux executable finder
  xorg.xev            # List X events
  xsel                # Clipboard manager
  zip                 # Zip archive creator
  pciutils
  openconnect         # cisco vpn
  openvpn
  vpnc                # another cisco vpn client
  ntfs3g              # ntfs mount/format support
  s-tui               # cpu governor monitor and stress test runner
  stress              # stress runner, optional dep for s-tui
  htop                # task manager
  jq                  # sed for json
  tree                # tree
  gource              # vcs viz tool
  graphviz            # viz tools
  pv                  # monitor pipe progress
  xclip               # clipboard util
  appimage-run        # FHS script for AppImages
  blueman             # bluetooth suite
  xorg.xkill          # kill a process by it's X window
  pmutils             # pm-hibernate and other utils
  moreutils           # `sponge` and others
  libcaca             # render bitmaps as text
  (wine.override { wineBuild = "wineWow"; })
  caddy               # https server
  awscli # Abdul Works Smoothly CLI
  dmidecode # BIOS info parser
  glxinfo # GL tester
  acpi
  lm_sensors
  pandoc # anything-to-anything converter
  rename
  xorg.xbacklight
  opencv
  pkgconfig
  pass
  gopass
  qrencode

  # terminal stuff
  tmux                # terminal multiplexer
  (st.override {
    # conf = builtins.readFile ./st/config.def.h;
    patches = [
      ./st/scrollback.diff
      ./st/font.diff
      ./st/dracula.diff
    ];
  })
  rxvt_unicode
  ngrok
  alacritty         # GPU acellerated emulator

  # runtimes
  ruby
  my-python
  julia
  rustup
  pypi2nix
  # purescript
  # psc-package
  nodejs-10_x
  docker
  ## golang
  go
  libcap

  # desktop
  lxappearance
  arc-icon-theme
  arc-theme
  # gnome3.adwaita-icon-theme
  # capitaine-cursors
  moka-icon-theme
  hicolor-icon-theme
  xautolock
  i3lock-color
  i3status-rust
  j4-dmenu-desktop
  #(polybar.override{
    #pulseSupport = true;
    #i3Support = true;
  #})
  libnotify
  libinput-gestures

  # IDEs and devtools
  vscode
  neovim
  insomnia # better postman
  robo3t # robomongo
  krita # raster graphics editor
  pencil # GUI prototyping
  blender
  font-manager
  inkscape # SVG studio
  fontforge-gtk # font editor
  virtualbox # virt
  gnome3.gedit # notepad
  octaveFull # MATLAB as in beer
  mariadb
  postgresql
  binutils-unwrapped

  # GUI applets
  networkmanagerapplet # networkmanager front-end
  pavucontrol          # pulseaudio GUI
  pcmanfm # file browser
  slack # slack electron client
  fbreader             # epub reader
  zathura              # pdf reader
  freemind             # mind mapping tool
  libreoffice

  # extra, personal
  dropbox
  crawl
  openttd
  streamlink
  exercism # exercism learning website cli
  # steam
  # franz
] ++ (with nodePackages; [
  yarn                # Alternative to npm
  serve
  eslint              # linter
]) ++ (with haskellPackages; [
  ghc
  stack
])

