{pkgs, pkgsi686Linux} : pkgs.buildFHSUserEnv {
  name = "f";
  targetPkgs = pkgs: with pkgs; [
    nodejs-10_x
    python
    gnumake
    logger
    nodePackages.yarn

    # Julia Arpack
    gfortran.cc
    (pkgs.runCommand "openblas64_" {} ''
      mkdir -p "$out"/lib/
        ln -s ${openblasCompat}/lib/libopenblas.so "$out"/lib/libopenblas64_.so.0
    '')
    # cuda toolkit
    cudnn

    stdenv.cc.cc
    at-spi2-core
    alsaLib
    atk
    at-spi2-atk
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
    gnome3.dconf
    gtk2
    gtk3
    icu
    libcap
    libgnome-keyring3
    libgpgerror
    libnotify
    libsecret
    libxml2
    libpng12
    libxslt
    libuuid
    netcat
    nspr
    nspr
    nss
    nss
    openssl
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
