pkgs : {

  # neo4j.enable = false;
  ipfs.enable = false;
  # redis.enable = true;
  teamviewer.enable = false;
  # mysql.enable = true;
  # couchdb.enable = true;
  # postgresql.enable = false;
  # printing.enable = true;
  illum.enable = true;

  # mysql.package = pkgs.mysql;
  # couchdb.package = pkgs.couchdb2;
  # postgresql.package = pkgs.postgresql;
  # postgresql.authentication = "host all all 127.0.0.1/32 trust";
  # printing.drivers = [ pkgs.hplip pkgs.gutenprint ];

  xserver = {
    enable = true;
    enableTCP = false;
    exportConfiguration = true;

    layout = "us";
    xkbVariant = ",";
    xkbOptions = "grp:toggle";

    videoDrivers = [ "intel" "xf86-video-intel-2015-11-14" "xf86-video-intel" "intel-2015-11-14" ];

    desktopManager = {
      xterm.enable = false;
      xfce.enable = false;
      default = "none";
    };

    displayManager = {
      slim.enable = true;
      # slim.defaultUser = "paolo";
      sessionCommands = ''
        ${pkgs.xlibs.xset}/bin/xset r rate 230 65
        ${pkgs.xlibs.xsetroot}/bin/xsetroot -cursor_name left_ptr
      '';
    };

    windowManager = {
      i3.enable = true;
      # xmonad.enable = true;
      # xmonad.enableContribAndExtras = true;
      default = "i3";
    };

    synaptics = {
      enable = true;
      horizEdgeScroll = false;
      vertEdgeScroll = false;
      fingersMap = [ 1 3 3 ];
      twoFingerScroll = true;
      horizTwoFingerScroll = false;
      maxSpeed = "1.8";
    };

  };

}
