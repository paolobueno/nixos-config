pkgs : with pkgs;
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
  meld                # View differences between text files
  nnn                 # File browser
  psmisc              # Process management utilities
  slop                # Screen region selection tool
  tldr                # Linux command line cheat sheet
  tixati              # Torrent client
  unzip               # Zip archive extractor
  usbutils            # USB device management utilities
  mpv                 # Video player
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
  unstable.appimage-run        # FHS script for AppImages
  blueman             # bluetooth suite
  xorg.xkill          # kill a process by it's X window
  pmutils             # pm-hibernate and other utils
  moreutils           # `sponge` and others
  libcaca             # render bitmaps as text
  (wine.override { wineBuild = "wineWow"; })
  awscli
  dmidecode
  glxinfo
  acpi
  lm_sensors
  pandoc
  rename
  python27Packages.pygments
  xorg.xbacklight
  opencv
  pkgconfig
  pass

  # terminal stuff
  tmux                # terminal multiplexer
  (st.override {
    # conf = builtins.readFile ./st/config.def.h;
    patches = [
      ./st/st-scrollback-0.8.diff
      ./st/font.diff
      ./st/dracula.diff
      ./st/st-fix-keyboard-input-20180605-dc3b5ba.diff
    ];
  })
  rxvt_unicode
  # alacritty         # GPU acellerated emulator

  # runtimes
  ruby
  python
  rustup
  # purescript
  # psc-package
  unstable.nodejs-10_x
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
  #(polybar.override{
    #pulseSupport = true;
    #i3Support = true;
  #})
  libnotify
  libinput-gestures

  # IDEs and devtools
  unstable.vscode
  insomnia
  robo3t
  libreoffice
  krita
  pencil
  font-manager
  inkscape
  fontforge-gtk
  virtualbox
  gnome3.gedit
  octaveFull

  # GUI applets
  networkmanagerapplet # networkmanager front-end
  pavucontrol          # pulseaudio GUI
  pcmanfm
  slack
  fbreader

  # extra, personal
  dropbox
  crawl
  openttd
  streamlink
  steam
  #(let
      #version = "5.0.0-beta.18";
    #in
    #franz.overrideAttrs (oldAttrs: rec {
      #name = "franz-${version}";
      #src = fetchurl {
        #url = "https://github.com/meetfranz/franz/releases/download/v${version}/franz-${version}.tar.gz";
        #sha256 = "96090ae3722f43c2f03ea9412edaf1436a25fc19bbccf30ab1f0fe494ec01825";
      #};
    #})
  #)
] ++ (with nodePackages; [
  unstable.yarn                # Alternative to npm
  eslint              # linter
]) ++ (with haskellPackages; [
  unstable.ghc
  unstable.stack
])
