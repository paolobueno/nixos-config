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

  # terminal stuff
  tmux                # terminal multiplexer
  (st.override {
    conf = builtins.readFile ./st/config.def.h;
    patches = [
      ./st/st-clipboard-0.8.1.diff
      ./st/st-scrollback-0.8.diff
      # ./st/st-xresources-20180309-c5ba9c0.diff
    ];
  })
  rxvt_unicode
  # alacritty         # GPU acellerated emulator

  # runtimes
  ruby
  python
  stable.purescript
  psc-package
  nodejs-10_x
  docker

  # gtk theming
  lxappearance
  arc-icon-theme
  arc-theme
  moka-icon-theme

  # IDEs and devtools
  vscode
  insomnia
  robo3t

  # GUI applets
  networkmanagerapplet # networkmanager front-end
  pavucontrol          # pulseaudio GUI

  # extra, personal
  dropbox
  spotify
  franz
] ++ (with nodePackages; [
  yarn                # Alternative to npm
  eslint              # linter
]) ++ (with haskellPackages; [
  ghc
])
