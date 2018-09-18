pkgs : with pkgs;
[
  (import ./fhs.nix pkgs)
  (import ./vim.nix pkgs)
  arandr              # Screen control
  bashmount           # Mount USB storage
  bind                # DNS utilities
  google-chrome       # Web browser
  chromium
  curl                # Web client
  feh                 # Image viewer
  nomacs              # Image viewer
  gcc                 # C compiler
  git                 # Source control system
  gitAndTools.hub     # GitHub client, wrapper around `git`
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
  vpnc                # another cisco vpn client
  ntfs3g              # ntfs mount/format support
  s-tui               # cpu governor monitor and stress test runner
  stress              # stress runner, optional dep for s-tui
  htop                # task manager
  jq                  # sed for json
  pv                  # monitor pipe progress
  xclip               # clipboard util
  appimage-run        # FHS script for AppImages
  blueman             # bluetooth suite
  xorg.xkill          # kill a process by it's X window
  pmutils             # pm-hibernate and other utils
  moreutils           # `sponge` and others
  libcaca             # render bitmaps as text
  awscli
  dmidecode
  glxinfo
  acpi
  lm_sensors
  pandoc
  rename
  python27Packages.pygments
  skype

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
  stable.purescript
  psc-package
  nodejs-10_x
  docker

  # desktop
  lxappearance
  arc-icon-theme
  arc-theme
  moka-icon-theme
  xautolock
  i3lock-color
  i3status-rust
  libnotify

  # IDEs and devtools
  vscode
  insomnia
  robo3t
  libreoffice
  krita
  pencil

  # GUI applets
  networkmanagerapplet # networkmanager front-end
  pavucontrol          # pulseaudio GUI
  pcmanfm

  # extra, personal
  stable.dropbox
  spotify
  crawl
  openttd
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
  yarn                # Alternative to npm
  eslint              # linter
]) ++ (with haskellPackages; [
  ghc
])
