pkgs : {

  neo4j.enable = false;
  ipfs.enable = false;
  redis.enable = true;
  teamviewer.enable = false;
  mysql.enable = true;
  couchdb.enable = true;
  mongodb.enable = true;
  postgresql.enable = true;
  printing.enable = false;
  illum.enable = true;

  compton.enable = true;
  # compton.backend = "glx";

  mysql.package = pkgs.mysql;
  couchdb.package = pkgs.couchdb2;
  postgresql.package = pkgs.postgresql;
  postgresql.authentication = "host all all 127.0.0.1/32 trust";
  printing.drivers = [ pkgs.hplip pkgs.gutenprint ];

  mosquitto = {
    enable = false;
    host = "0.0.0.0";
  };

  mopidy = {
    enable = false;
    configuration = ''
[mpd]
hostname = ::

[spotify]
username = paolohaji@gmail.com
password = yugidlk77
client_id = 1b4d3af3-858f-473d-8403-ac3f5eb2a5c0
client_secret = _AcX5r-LZbY2P2shnrKVeo1WfsVUVdHsZcX24q-s-g4=
'';
    extensionPackages = [ pkgs.mopidy-spotify ];
  };

  xserver = {
    enable = true;
    enableTCP = false;
    exportConfiguration = true;

    layout = "us";
    xkbVariant = ",";
    xkbOptions = "grp:toggle";

    videoDrivers = [ "nvidia" "intel" ];

    desktopManager = {
      xterm.enable = false;
      xfce.enable = false;
      default = "none";
    };

    displayManager = {
      slim.enable = true;
      slim.defaultUser = "paolo";
      sessionCommands = ''
        ${pkgs.xlibs.xset}/bin/xset r rate 230 65
        ${pkgs.xlibs.xsetroot}/bin/xsetroot -cursor_name left_ptr
      '';
    };

    windowManager = {
      i3.enable = true;
      default = "i3";
    };

    libinput = {
      enable = true;
    };
  };
}
