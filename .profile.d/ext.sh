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

ProfileRcExtCabal () {
	CABAL_CONFIG=${XDG_OPT_HOME:?}/cabal/config;
	export CABAL_CONFIG;
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
	GOPATH=${XDG_OPT_HOME:?}/go;
	export GOPATH;
};

ProfileRcExtInfo () {
	INFODIR=${XDG_DATA_HOME:?}/info:/usr/local/share/info:/usr/share/info;
	export INFODIR;
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
	LESSOPEN='|"${XDG_BIN_HOME:?}/lesspipew" %s';
};

ProfileRcExtLs () {
	eval "$(/usr/bin/dircolors -b "${XDG_DATA_HOME:?}/dircolors/${1:?}")";
};

ProfileRcExtMan () {
	MANPATH=${XDG_DATA_HOME:?}/man:/usr/local/share/man:/usr/share/man;
	MANWIDTH=80;

	export \
		MANPATH \
		MANWIDTH;
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
	NPM_CONFIG_USERCONFIG=${HOME:-/home/$(/usr/bin/id -un)}/.npmrc;
	MANPATH=${XDG_OPT_HOME:?}/npm/share/man${MANPATH:+:$MANPATH};

	export \
		NPM_CONFIG_USERCONFIG \
		MANPATH;
};

ProfileRcExtPerl () {
	eval "$(/usr/bin/perl -I"${XDG_OPT_HOME:?}/perl5/lib/perl5" -M"local::lib=$XDG_OPT_HOME/perl5")";

	MANPATH=${HOME:-/home/$(/usr/bin/id -un)}/perl5/man${MANPATH:+:$MANPATH};
	export MANPATH;
};

ProfileRcExtPerlCpanm () {
	PERL_CPANM_HOME=${XDG_OPT_HOME:?}/cpanm;
	export PERL_CPANM_HOME;
};

ProfileRcExtPhpComposer () {
	COMPOSER_HOME=${XDG_OPT_HOME:?}/composer;
	export COMPOSER_HOME;
};

ProfileRcExtPython () {
	PYTHONUSERBASE=${XDG_OPT_HOME:?}/python;
	export PYTHONUSERBASE;
};

ProfileRcExtPyenv () {
	PYENV_ROOT=${PYTHONUSERBASE:?}/lib/pyenv;
	export PYENV_ROOT;
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
	INPUTRC=${XDG_CONFIG_HOME:?}/inputrc;
	export INPUTRC;
};

ProfileRcExtRustCargo () {
	CARGO_HOME=${XDG_OPT_HOME:?}/cargo;
	export CARGO_HOME;
};

ProfileRcExtSxhkd () {
	export SXHKD_SHELL;
	SXHKD_SHELL=/bin/sh;
};

ProfileRcExtTaskum () {
	TASKUM_DATA=${XDG_VAR_HOME:?}/lib/taskum;
	export TASKUM_DATA;
};

ProfileRcExtTerminfo () {
	TERMINFO_DIRS=:${XDG_CONFIG_HOME:?}/terminfo:/usr/local/share/terminfo;
	export TERMINFO_DIRS;
};

ProfileRcExtTex () {
	TEXINPUTS=${XDG_DATA_HOME:?}/texmf/tex///:;
	export TEXINPUTS;
};

ProfileRcExtUrimark () {
	URIMARK_DATA_DIR=${XDG_VAR_HOME:?}/lib/urimark/data;
	export URIMARK_DATA_DIR;
};

ProfileRcExtUrldiff () {
	URLDIFF_DATA=${XDG_VAR_HOME:?}/lib/urldiff;
	URLDIFF_MAILTO=urldiff@urldiff;

	export \
		URLDIFF_DATA \
		URLDIFF_MAILTO;
};

ProfileRcExtX () {
	local -;
	set -a;

	ICEAUTHORITY=${XDG_VAR_HOME:?}/spool/ICEauthority;
	XAPPLRESDIR=${XDG_DATA_HOME:?}/X11;
	XAUTHORITY=$XDG_VAR_HOME/spool/Xauthority;
	XERRFILE=${TMPDIR:-/tmp}/xsession-errors;
	XINITRC=${HOME:-/home/$(/usr/bin/id -un)}/.xinitrc;
	X_XCLIENT=bspwm;

	XUSERFILESEARCHPATH=${XAPPLRESDIR:?}/%L/%N%C:$XAPPLRESDIR/%l/%N%C:$XAPPLRESDIR/%N%C:$XAPPLRESDIR/%L/%N:$XAPPLRESDIR/%l/%N:$XAPPLRESDIR/%N;
};

# vim: set ft=sh :
