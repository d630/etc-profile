#!/bin/sh
#
# ProfileRcExt.

ProfileRcExtAtSpi() {
    NO_AT_BRIDGE=1
    export NO_AT_BRIDGE
}

ProfileRcExtBc() {
    BC_LINE_LENGTH=0
    export BC_LINE_LENGTH
}

ProfileRcExtCabal() {
    CABAL_CONFIG=${XDG_OPT_HOME:?}/cabal/config
    export CABAL_CONFIG
}

ProfileRcExtDbus() {
    : "${XDG_RUNTIME_DIR:=/run/user/$(exec /usr/bin/id -u)}"
    : "${DBUS_SESSION_BUS_ADDRESS:=unix:path=$XDG_RUNTIME_DIR/bus}"

    export \
        DBUS_SESSION_BUS_ADDRESS \
        XDG_RUNTIME_DIR

    command -- /usr/bin/dbus-update-activation-environment --systemd \
        DBUS_SESSION_BUS_ADDRESS \
        DISPLAY \
        GDK_SCALE \
        PATH \
        QT_ACCESSIBILITY \
        QT_AUTO_SCREEN_SCALE_FACTOR \
        QT_LINUX_ACCESSIBILITY_ALWAYS_ON \
        XAUTHORITY \
        X_DPI \
        X_XCLIENT
}

ProfileRcExtFreetype() {
    FREETYPE_PROPERTIES=truetype:interpreter-version=35
    export FREETYPE_PROPERTIES
}

ProfileRcExtGlib() {
    command -- /usr/bin/gsettings set org.gtk.Settings.FileChooser startup-mode cwd
    command -- /usr/bin/gsettings set org.gnome.desktop.interface gtk-key-theme Emacs

    if test "$X_DPI" -gt 96; then
        command -- /usr/bin/gsettings set org.gnome.desktop.interface scaling-factor 2
    else
        command -- /usr/bin/gsettings set org.gnome.desktop.interface scaling-factor 1
    fi
}

ProfileRcExtGtk() {
    : "$((GDK_SCALE = X_DPI > 96 ? 2 : 1))"
    export GDK_SCALE
}

ProfileRcExtGo() {
    GOPATH=${XDG_OPT_HOME:?}/go
    export GOPATH
}

ProfileRcExtInfo() {
    INFODIR=${XDG_DATA_HOME:?}/info:/usr/local/share/info:/usr/share/info
    export INFODIR
}

ProfileRcExtJava() {
    _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
    export _JAVA_OPTIONS
}

ProfileRcExtLess() {
    LESSCHARSET=UTF-8
    # LESSCOLORIZER=$XDG_BIN_HOME/highlighter;
    LESS=-R\ -cfMS\ --shift\ 5
    LESSCOLOR=1
    LESSHISTFILE=/dev/null
    LESSOPEN='|"${XDG_BIN_HOME:?}/lesspipew" %s'

    export \
        LESSCHARSET \
        LESS \
        LESSCOLOR \
        LESSHISTFILE \
        LESSOPEN
}

ProfileRcExtLs() {
    eval "$(exec /usr/bin/dircolors -b "${XDG_DATA_HOME:?}/dircolors/${1:?}")"
}

ProfileRcExtMan() {
    MANPATH=${XDG_DATA_HOME:?}/man:/usr/local/share/man:/usr/share/man
    MANWIDTH=80

    export \
        MANPATH \
        MANWIDTH
}

ProfileRcExtNet() {
    DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_CLI_TELEMETRY_OPTOUT
}

ProfileRcExtNode() {
    NODE_PATH=/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript
    export NODE_PATH
}

ProfileRcExtNodeNpm() {
    NPM_CONFIG_USERCONFIG=${HOME:-/home/$(exec /usr/bin/id -un)}/.npmrc
    MANPATH=${XDG_OPT_HOME:?}/npm/share/man${MANPATH:+:$MANPATH}

    export \
        NPM_CONFIG_USERCONFIG \
        MANPATH
}

ProfileRcExtPerl() {
    eval "$(exec /usr/bin/perl -I"${XDG_OPT_HOME:?}/perl5/lib/perl5" -M"local::lib=$XDG_OPT_HOME/perl5")"

    MANPATH=${HOME:-/home/$(exec /usr/bin/id -un)}/perl5/man${MANPATH:+:$MANPATH}
    export MANPATH
}

ProfileRcExtPerlCpanm() {
    PERL_CPANM_HOME=${XDG_OPT_HOME:?}/cpanm
    export PERL_CPANM_HOME
}

ProfileRcExtPhpComposer() {
    COMPOSER_HOME=${XDG_OPT_HOME:?}/composer
    export COMPOSER_HOME
}

ProfileRcExtPipx() {
    PIPX_HOME=${PYTHONUSERBASE:?}/lib/pipx
    PIPX_BIN_DIR=$PYTHONUSERBASE/bin-pipx
    export \
        PIPX_HOME \
        PIPX_BIN_DIR
}

ProfileRcExtPython() {
    PYTHONUSERBASE=${XDG_OPT_HOME:?}/python
    export PYTHONUSERBASE
}

ProfileRcExtPyenv() {
    PYENV_ROOT=${PYTHONUSERBASE:?}/lib/pyenv
    export PYENV_ROOT
}

ProfileRcExtQt() {
    QT_ACCESSIBILITY=1
    QT_AUTO_SCREEN_SCALE_FACTOR=1
    QT_LINUX_ACCESSIBILITY_ALWAYS_ON=1
    QT_STYLE_OVERRIDE=gtk2

    export \
        QT_ACCESSIBILITY \
        QT_AUTO_SCREEN_SCALE_FACTOR \
        QT_LINUX_ACCESSIBILITY_ALWAYS_ON \
        QT_STYLE_OVERRIDE
}

ProfileRcExtReadline() {
    INPUTRC=${XDG_CONFIG_HOME:?}/inputrc
    export INPUTRC
}

ProfileRcExtRustCargo() {
    CARGO_HOME=${XDG_OPT_HOME:?}/cargo
    export CARGO_HOME
}

ProfileRcExtSxhkd() {
    SXHKD_SHELL=/bin/sh
    export SXHKD_SHELL
}

ProfileRcExtTaskum() {
    TASKUM_DATA=${XDG_VAR_HOME:?}/lib/taskum
    export TASKUM_DATA
}

ProfileRcExtTerminfo() {
    TERMINFO_DIRS=:${XDG_CONFIG_HOME:?}/terminfo:/usr/local/share/terminfo
    export TERMINFO_DIRS
}

ProfileRcExtTex() {
    TEXINPUTS=${XDG_DATA_HOME:?}/texmf/tex///:
    export TEXINPUTS
}

ProfileRcExtUrimark() {
    URIMARK_DATA_DIR=${XDG_VAR_HOME:?}/lib/urimark/data
    export URIMARK_DATA_DIR
}

ProfileRcExtUrldiff() {
    URLDIFF_DATA=${XDG_VAR_HOME:?}/lib/urldiff
    URLDIFF_MAILTO=urldiff@urldiff

    export \
        URLDIFF_DATA \
        URLDIFF_MAILTO
}

ProfileRcExtX() {
    ICEAUTHORITY=${XDG_VAR_HOME:?}/spool/ICEauthority
    XAPPLRESDIR=${XDG_DATA_HOME:?}/X11
    XAUTHORITY=$XDG_VAR_HOME/spool/Xauthority
    XERRFILE=${TMPDIR:-/tmp}/xsession-errors
    XINITRC=${HOME:-/home/$(exec /usr/bin/id -un)}/.xinitrc
    X_XCLIENT=bspwm

    XUSERFILESEARCHPATH=${XAPPLRESDIR:?}/%L/%N%C:$XAPPLRESDIR/%l/%N%C:$XAPPLRESDIR/%N%C:$XAPPLRESDIR/%L/%N:$XAPPLRESDIR/%l/%N:$XAPPLRESDIR/%N

    export \
        ICEAUTHORITY \
        XAPPLRESDIR \
        XAUTHORITY \
        XERRFILE \
        XINITRC \
        X_XCLIENT \
        XUSERFILESEARCHPATH
}

# vim: set ft=sh :
