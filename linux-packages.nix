pkgs : with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
    # pygments
    # pylint
    # pip
    # tensorflow
    # numpy
    # pandas
    # scikitlearn
    # matplotlib
    # h5py
    conda
    binwalk-full
    cfn-lint
    # azure-cli-core # not yet :(
  ];
  my-python = python3.withPackages my-python-packages;
in
[
  (callPackage ./fhs.nix {})
  (import ./vim.nix pkgs)
  arandr              # Screen control
  bashmount           # Mount USB storage
  bind                # DNS utilities
  nomacs              # Image viewer
  google-chrome       # Web browser
  firefox
  gcc                 # C compiler
  gnumake             # Build tool
  gnupg               # Encryption toolset
  pinentry
  gparted             # Disk drive manager
  curl                # Web client
  jmtpfs              # Android Phone mounter
  linuxPackages.perf  # Linux performance tools such as `time`
  lshw                # List hardware
  maim                # Takes screenshots
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
  # s-tui               # cpu governor monitor and stress test runner
  # stress              # stress runner, optional dep for s-tui
  htop                # task manager
  jq                  # sed for json
  tree                # tree
  graphviz            # viz tools
  pv                  # monitor pipe progress
  xclip               # clipboard util
  appimage-run        # FHS script for AppImages
  # blueman             # bluetooth suite
  xorg.xkill          # kill a process by it's X window
  pmutils             # pm-hibernate and other utils
  moreutils           # `sponge` and others
  libcaca             # render bitmaps as text
  # (wine.override { wineBuild = "wineWow"; })
  caddy               # https server
  dmidecode           # BIOS info parser
  glxinfo             # GL tester
  acpi
  lm_sensors
  pandoc              # anything-to-anything converter
  rename
  xorg.xbacklight
  # opencv
  meld                # View differences between text files

  (st.override {
    # conf = builtins.readFile ./st/config.def.h;
    patches = [
      ./st/scrollback.diff
      ./st/font.diff
      ./st/dracula.diff
    ];
  })

  # runtimes
  my-python
  dotnet-sdk
  libcap

  # desktop
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
  udiskie
  xdotool
  cudnn
  # qdirstat

  ## Gnome
  lxappearance
  arc-icon-theme
  arc-theme
  # gnome3.adwaita-icon-theme
  # gnome3.gnome-control-center
  # gnome3.dconf        # Gnome configuration module used by other gnome software
  capitaine-cursors
  vanilla-dmz
  # moka-icon-theme

  # IDEs and devtools
  vscode                 # M$ Overlords
  robo3t                 # mongodb client, ex-robomongo
  insomnia               # better postman
  gnome3.gedit           # notepad

  # GUI apps
  networkmanagerapplet   # networkmanager tray front-end
  pavucontrol            # pulseaudio GUI

  pcmanfm                # file browser
  slack                  # slack electron client
  # fbreader              # epub reader
  zathura                # pdf reader
  okular                 # pdf reader - annotations support
  # freemind              # mind mapping tool
  libreoffice            # Office
  pencil                 # GUI prototyping
  blender                # 3D editor
  krita                  # raster graphics editor
  inkscape               # vector graphics editor
  fontforge-gtk          # font editor
  dbeaver                # global database client
  steghide               # finds files hidden inside other files

  # Networking
  # openconnect         # cisco vpn
  # openvpn
  # vpnc                # another cisco vpn client

  # Extra, personal
  # dropbox
  crawl
  streamlink
  keybase
  keybase-gui
  discord

  # Gaems
  openttd
  steam
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
]) ++ (import ./packages.nix pkgs)
