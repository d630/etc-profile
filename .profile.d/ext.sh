#!/bin/sh
#
# ProfileRcExt.

ProfileRcExtAtSpi () {
    export NO_AT_BRIDGE;
    NO_AT_BRIDGE=1;
};

ProfileRcExtBc () {
    export BC_LINE_LENGTH;
    BC_LINE_LENGTH=0;
};

ProfileRcExtDbus () {
    : "${XDG_RUNTIME_DIR:=/run/user/$(/usr/bin/id -u)}";
    : "${DBUS_SESSION_BUS_ADDRESS:=unix:path=$XDG_RUNTIME_DIR/bus}";

    export \
		DBUS_SESSION_BUS_ADDRESS \
		XDG_RUNTIME_DIR;

    /usr/bin/dbus-update-activation-environment --systemd \
        DBUS_SESSION_BUS_ADDRESS \
        DISPLAY \
        GDK_SCALE \
        PATH \
        QT_ACCESSIBILITY \
        QT_AUTO_SCREEN_SCALE_FACTOR \
        QT_LINUX_ACCESSIBILITY_ALWAYS_ON \
        XAUTHORITY \
        X_DPI \
        X_XCLIENT;
};

ProfileRcExtFreetype () {
	export FREETYPE_PROPERTIES;
	FREETYPE_PROPERTIES=truetype:interpreter-version=35;
}

ProfileRcExtGlib () {
    /usr/bin/gsettings set org.gtk.Settings.FileChooser startup-mode cwd;
    /usr/bin/gsettings set org.gnome.desktop.interface gtk-key-theme Emacs;

    if
        test "$X_DPI" -gt 96;
    then
        /usr/bin/gsettings set org.gnome.desktop.interface scaling-factor 2;
    else
        /usr/bin/gsettings set org.gnome.desktop.interface scaling-factor 1;
    fi;
};

ProfileRcExtGtk () {
	export GDK_SCALE;

	if
		test "$X_DPI" -gt 96;
	then
		GDK_SCALE=2;
	else
		GDK_SCALE=1;
	fi;
};

ProfileRcExtGo () {
    export GOPATH;
    GOPATH=$XDG_OPT_HOME/go;

    PATH=$GOPATH/bin:$PATH;
};

ProfileRcExtHaskellCabal () {
	PATH=$XDG_OPT_HOME/cabal/bin:$PATH;
};

ProfileRcExtInfo () {
    export INFODIR;
    INFODIR=$XDG_DATA_HOME/info:/usr/local/share/info:/usr/share/info;
};

ProfileRcExtJava () {
	export _JAVA_OPTIONS;
	_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
};

ProfileRcExtLess () {
	local -;
	set -a;

	LESSCHARSET=UTF-8;
	# LESSCOLORIZER=$XDG_BIN_HOME/highlighter;
	LESS=-R\ -cfMS\ --shift\ 5;
	LESSCOLOR=1;
	LESSHISTFILE=/dev/null;
	LESSOPEN='|"$XDG_BIN_HOME/"lesspipew %s';
};

ProfileRcExtLs () {
    eval "$(/usr/bin/dircolors -b "$XDG_DATA_HOME/"dircolors"/${1:?}")";
};

ProfileRcExtMan () {
	export \
		MANPATH \
		MANWIDTH;

	MANPATH=$XDG_DATA_HOME/man:/usr/local/share/man:/usr/share/man;
	MANWIDTH=80;
};

ProfileRcExtNet () {
	export DOTNET_CLI_TELEMETRY_OPTOUT;
	DOTNET_CLI_TELEMETRY_OPTOUT=1;
};

ProfileRcExtNode () {
    export NODE_PATH;
    NODE_PATH=/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript;
};

ProfileRcExtNodeNpm () {
	PATH=$XDG_OPT_HOME/npm/bin:$PATH;

	export \
		NPM_CONFIG_USERCONFIG \
		MANPATH;

	NPM_CONFIG_USERCONFIG=$HOME/.npmrc;
	MANPATH=$XDG_OPT_HOME/npm/share/man:${MANPATH:?};
};

ProfileRcExtPerl () {
    eval "$(/usr/bin/perl -I"$XDG_OPT_HOME/"perl5/lib/perl5 -Mlocal::lib"=$XDG_OPT_HOME/"perl5)";
    export MANPATH;
    MANPATH=$HOME/perl5/man:$MANPATH;
};

ProfileRcExtPerlCpanm () {
    export PERL_CPANM_HOME;
    PERL_CPANM_HOME=$XDG_OPT_HOME/cpanm;
};

ProfileRcExtPhpComposer () {
	export COMPOSER_HOME;
	COMPOSER_HOME=$XDG_OPT_HOME/composer;

	PATH=$COMPOSER_HOME/vendor/bin:$PATH;
};

ProfileRcExtPython () {
	export PYTHONUSERBASE;
	PYTHONUSERBASE=$XDG_OPT_HOME/python;

	PATH=$PYTHONUSERBASE/bin:$PATH;
};

ProfileRcExtPyenv () {
	export PYENV_ROOT
	PYENV_ROOT=$PYTHONUSERBASE/lib/pyenv;

	PATH=$PYENV_ROOT/bin:$PATH;
};

ProfileRcExtQt () {
	export \
		QT_ACCESSIBILITY \
		QT_AUTO_SCREEN_SCALE_FACTOR \
		QT_LINUX_ACCESSIBILITY_ALWAYS_ON \
		QT_STYLE_OVERRIDE;

	QT_ACCESSIBILITY=1;
	QT_AUTO_SCREEN_SCALE_FACTOR=1;
	QT_LINUX_ACCESSIBILITY_ALWAYS_ON=1;
	QT_STYLE_OVERRIDE=gtk2;
};

ProfileRcExtReadline () {
    export INPUTRC;
    INPUTRC=$XDG_CONFIG_HOME/inputrc;
};

ProfileRcExtRustCargo () {
	PATH=$XDG_OPT_HOME/cargo/bin:$PATH;

	export CARGO_HOME
	CARGO_HOME=$XDG_OPT_HOME/cargo
};

ProfileRcExtSxhkd () {
    export SXHKD_SHELL;
    SXHKD_SHELL=/bin/sh;
};

ProfileRcExtTaskum () {
    export TASKUM_DATA;
    TASKUM_DATA=$XDG_VAR_HOME/lib/taskum;
};

# ProfileRcExtTaskwarrior () {
#     export TASKRC=./.taskrc;
#     export TASKHOME=$XDG_VAR_HOME/lib/taskwarrior/taskhome;
# };

ProfileRcExtTerminfo () {
    export TERMINFO_DIRS;
    TERMINFO_DIRS=:$XDG_CONFIG_HOME/terminfo:/usr/local/share/terminfo;
};

ProfileRcExtTex () {
    export TEXINPUTS;
    TEXINPUTS=$XDG_DATA_HOME/texmf/tex///:;
};

ProfileRcExtUrimark () {
    export URIMARK_DATA_DIR;
    URIMARK_DATA_DIR=$XDG_VAR_HOME/lib/urimark/data;
};

ProfileRcExtUrldiff () {
	export \
		URLDIFF_DATA \
		URLDIFF_MAILTO;

	URLDIFF_DATA=$XDG_VAR_HOME/lib/urldiff;
	URLDIFF_MAILTO=urldiff@urldiff;
};

ProfileRcExtX () {
    local -;
    set -a;

    ICEAUTHORITY=$XDG_VAR_HOME/spool/ICEauthority;
    XAPPLRESDIR=$XDG_DATA_HOME/X11;
    XAUTHORITY=$XDG_VAR_HOME/spool/Xauthority;
    XERRFILE=${TMPDIR:-/tmp}/xsession-errors;
    XINITRC=$HOME/.xinitrc;
    X_XCLIENT=bspwm;

    XUSERFILESEARCHPATH=$XAPPLRESDIR/%L/%N%C:$XAPPLRESDIR/%l/%N%C:$XAPPLRESDIR/%N%C:$XAPPLRESDIR/%L/%N:$XAPPLRESDIR/%l/%N:$XAPPLRESDIR/%N;
};

# vim: set ft=sh :
