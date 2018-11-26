{pkgs, pkgsi686Linux} : pkgs.buildFHSUserEnv {
  name = "f";
  targetPkgs = pkgs: with pkgs; [
    nodejs-10_x
    python
    gnumake
    logger
    nodePackages.yarn

    stdenv.cc.cc
    alsaLib
    atk
    cairo
    cups
    dbus
    expat
    file
    fontconfig
    freetype
    gdb
    gdk_pixbuf
    git
    glib
    gnome2.GConf
    gtk2
    gtk3
    libcap
    libgnome-keyring3
    libgpgerror
    libnotify
    libsecret
    libxml2
    libxslt
    netcat
    nspr
    nspr
    nss
    nss
    pango
    pangox_compat
    strace
    systemd
    udev
    watch
    wget
    which
    xorg.libX11
    xorg.libxcb
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXi
    xorg.libxkbfile
    xorg.libXrandr
    xorg.libXrender
    xorg.libXScrnSaver
    xorg.libXtst
    xorg.xcbutilkeysyms
    libGL
    libpulseaudio
    zlib
  ];
  runScript = "$SHELL";
}
