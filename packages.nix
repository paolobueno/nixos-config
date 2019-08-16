pkgs : with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
  pygments
  pylint
  pip
  tensorflow
  numpy
  pandas
  # scikitlearn
  matplotlib
  h5py
  conda
  binwalk-full
  # azure-cli
];
  my-python = python3.withPackages my-python-packages;
in
[
  (callPackage ./fhs.nix {})
  (import ./vim.nix pkgs)
  stable.arandr              # Screen control
  bashmount           # Mount USB storage
  bind                # DNS utilities
  google-chrome       # Web browser
  # chromium
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
  meld                # View differences between text files
  nnn                 # File browser
  psmisc              # Process management utilities
  slop                # Screen region selection tool
  tldr                # Linux command line cheat sheet
  tixati              # Torrent client
  unzip               # Zip archive extractor
  p7zip               # 7z
  usbutils            # USB device management utilities
  mpv                 # Video player
  ffmpeg
  wget                # Web client
  which               # Linux executable finder
  xorg.xev            # List X events
  xsel                # Clipboard manager
  zip                 # Zip archive creator
  unixtools.xxd       # hexdump
  pciutils
  ntfs3g              # ntfs mount/format support
  s-tui               # cpu governor monitor and stress test runner
  stress              # stress runner, optional dep for s-tui
  htop                # task manager
  jq                  # sed for json
  tree                # tree
  # gource              # animated viz for git repos
  graphviz            # viz tools
  pv                  # monitor pipe progress
  xclip               # clipboard util
  appimage-run        # FHS script for AppImages
  blueman             # bluetooth suite
  xorg.xkill          # kill a process by it's X window
  pmutils             # pm-hibernate and other utils
  moreutils           # `sponge` and others
  libcaca             # render bitmaps as text
  # (wine.override { wineBuild = "wineWow"; })
  caddy               # https server
  dmidecode # BIOS info parser
  glxinfo # GL tester
  acpi
  lm_sensors
  pandoc              # anything-to-anything converter
  rename
  xorg.xbacklight
  # opencv
  pkgconfig
  pass
  gopass
  qrencode            # generates qr codes
  udiskie
  xdotool
  vips                # imagemagick alternative
  cudnn
  watchman            # file watcher


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
  # rxvt_unicode
  ngrok
  # alacritty         # GPU acellerated emulator

  # runtimes
  ruby
  dotnet-sdk
  my-python
  # python2
  stable.julia_11
  rustup
  pypi2nix
  # purescript
  # psc-package
  nodejs-12_x
  pharo
  pharo-launcher
  pharo-spur64
  ## golang
  go
  hugo # static website gen
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
  font-manager
  libnotify
  libinput-gestures
  qdirstat

  # IDEs and devtools
  vscode                 # M$ Overlords
  sublime3
  neovim                 # new vim
  stable.insomnia               # better postman
  postman
  robo3t                 # mongodb client, ex-robomongo
  virtualbox             # virtual machines
  docker                 # virtual processes
  gnome3.gedit           # notepad
  octaveFull             # MATLAB as in beer
  mariadb                # mariadb/mysql client
  redis
  postgresql_10          # pg client
  dbeaver                # global database client
  openssl
  binutils-unwrapped
  android-studio
  hexedit
  silver-searcher
  john                   # brute force tool
  awscli                 # Abdul Works Smoothly CLI
  heroku
  steghide               # finds files hidden inside other files

  # GUI apps
  networkmanagerapplet   # networkmanager tray front-end
  pavucontrol            # pulseaudio GUI
  pcmanfm                # file browser
  slack                  # slack electron client
  # fbreader              # epub reader
  zathura                # pdf reader
  # freemind              # mind mapping tool
  libreoffice            # Office
  pencil                 # GUI prototyping
  blender                # 3D editor
  stable.krita                  # raster graphics editor
  inkscape               # vector graphics editor
  fontforge-gtk          # font editor

  # Networking
  # openconnect         # cisco vpn
  # openvpn
  # vpnc                # another cisco vpn client

  # extra, personal
  dropbox
  crawl
  openttd
  streamlink
  keybase
  keybase-gui
  # exercism             # exercism learning website cli
  discord
  # steam
  # franz
] ++ (with nodePackages; [
  yarn                   # Alternative to npm
  serve
  eslint                 # linter
  javascript-typescript-langserver
]) ++ (with haskellPackages; [
  ghc
  stack
]) ++ (with ocamlPackages; [
  merlin
])

