pkgs : {
  neo4j.enable = false;
  ipfs.enable = false;
  redis.enable = false;
  teamviewer.enable = false;
  mysql.enable = true;
  couchdb.enable = false;
  mongodb.enable = false;
  postgresql.enable = false;
  printing.enable = true;
  illum.enable = true;

  compton.enable = true;
  # compton.backend = "glx";
  tlp = {
    enable = true;
    extraConfig = ''
      RUNTIME_PM_BLACKLIST="01:00.0"
    '';
  };

  openssh.enable = true;

  mysql.package = pkgs.mysql;
  couchdb.package = pkgs.couchdb2;
  postgresql.package = pkgs.postgresql;
  postgresql.authentication = "host all all 127.0.0.1/32 trust";
  printing.drivers = [ pkgs.hplip pkgs.gutenprint ];
  printing.browsing = true;

  avahi.enable = true;
  avahi.publish.enable = true;
  avahi.publish.userServices = true;
  avahi.nssmdns = true;

  mosquitto = {
    enable = false;
    host = "0.0.0.0";
  };

  xserver = {
    enable = true;
    enableTCP = false;
    exportConfiguration = true;

    layout = "us";
    xkbVariant = ",";
    xkbOptions = "grp:toggle";

    videoDrivers = [ "intel" ];
    desktopManager = {
      xterm.enable = false;
      xfce.enable = false;
      default = "none";
    };

    displayManager = {
      lightdm.enable = true;
      sessionCommands = ''
        ${pkgs.xlibs.xset}/bin/xset r rate 230 65
        ${pkgs.xlibs.xsetroot}/bin/xsetroot -cursor_name left_ptr
        export TERMINAL=st
      '';
    };

    windowManager = {
      i3.enable = true;
      default = "i3";
    };

    xautolock = {
      enable = true;
      extraOptions = [ "-detectsleep" ];

      time = 15; # default
      locker = "${pkgs.i3lock-color}/bin/i3lock-color -k -c 282a36";

      enableNotifier = true;
      notifier = ''
        ${pkgs.libnotify}/bin/notify-send "Locking in 10 seconds"
      '';
    };

    libinput = {
      enable = true;
      disableWhileTyping = true;
    };
  };
}
