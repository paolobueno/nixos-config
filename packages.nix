pkgs: with pkgs;
[
  # Images
  feh                 # Image viewer
  imagemagick         # Image editing suite

  # Version control
  git                 # Source control system
  gitAndTools.hub     # GitHub client, wrapper around `git`
  pre-commit

  # terminal stuff
  tmux                # terminal multiplexer

  # rxvt_unicode
  ngrok
  # alacritty         # GPU acellerated emulator


  # runtimes
  ruby
  julia
  rustc
  cargo
  pypi2nix
  vlang
  # purescript
  # psc-package
  nodejs-12_x
  elixir
  # pharo
  # pharo-launcher
  # pharo-spur64
  ## golang
  go


  pkgconfig
  pass
  gopass
  qrencode            # generates qr codes
  vips                # imagemagick alternative
  watchman            # file watcher

  # Editors and tools
  neovim                 # new vim
  jq
  # postman
  # virtualbox             # virtual machines
  docker                 # virtual processes
  docker-compose
  # octaveFull             # MATLAB as in beer
  mariadb                # mariadb/mysql client
  redis
  postgresql_10          # pg client
  openssl
  binutils-unwrapped
  # android-studio
  hexedit
  hugo                  # static website gen
  # silver-searcher
  # john                   # brute force tool
  # awscli                 # Abdul Works Smoothly CLI
  # aws-sam-cli
  # terraform_0_12
  # heroku
]
