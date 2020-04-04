#!/bin/sh
#
# ProfileRcBase.

ProfileRcBaseAlias () {
	alias 'sudo=/usr/bin/sudo -H --prompt="%u(%U): " ';

	for p in /sbin/?* /usr/sbin/?*;
	do
		alias "${p##*/}=sudo $p";
	done;
	unset -v p;

	unalias 'mklost+found' 2>/dev/null;

	alias 'o=open ';

	alias 'about=o -A about -f';
	alias 'c=o -A compose -f';
	alias 'cdog=o -A cdog -f';
	alias 'dog=o -A dog -f';
	alias 'e=o -A edit -f';
	alias 'gc=o -A gcompose -f';
	alias 'ge=o -A gedit -f';
	alias 'gv=o -A gview -f';
	alias 'v=o -A view -f';
	alias 'vc=o -A vcompose -f';
	alias 've=o -A vedit -f';
	alias 'vv=o -A vview -f';

	alias 'chmod=/bin/chmod -v';
	alias 'chown=/bin/chown -v';
	alias 'cp=/bin/cp -v';
	alias 'dash=/usr/bin/rlwrap -ic /bin/dash';
	alias "ed=/usr/bin/rlwrap /bin/ed -Gp '> '";
	alias 'dc=/usr/bin/rlwrap /usr/bin/dc';
	alias 'df=/bin/df -h';
	alias 'diff=/usr/bin/colordiff';
	alias 'dir=/bin/dir -h --color=never';
	alias 'du=/usr/bin/du -h';
	alias 'egrep=/bin/grep -E --color=auto';
	alias 'fgrep=/bin/grep -F --color=auto';
	alias 'gcc=/usr/bin/colorgcc';
	alias 'grep=/bin/grep --color=auto';
	alias 'ln=/bin/ln -v';
	alias 'ls=/bin/ls -h --color=auto';
	alias 'make=/usr/bin/colormake';
	alias 'mkdir=/bin/mkdir -v';
	alias 'mv=/bin/mv -v';
	alias 'nawk=/usr/bin/original-awk';
	alias 'nohup=/usr/bin/nohup ';
	alias 'rgrep=/bin/grep -r --color=auto';
	alias 'rm=/bin/rm -v';
	alias 'rsync=/usr/bin/rsync -v';
	alias 'tail=/usr/bin/colortail';
	alias 'vdir=/bin/vdir -h --color=never';
	alias 'vf=/usr/bin/vifm';

	alias ':q=exit';
	alias ':x=exit';
	alias 'XX=. startx.sh';
	alias 'chdir=cd';
	alias 'command=command ';
	alias 'console-color=\ProfileRcBaseConsole';
	alias 'd630=mutt--d630';
	alias 'dz=daemonize ';
	alias 'filetest=tcsh--filetest';
	alias 'forever=while :;';
	alias 'gmail=mutt--gmail';
	alias 'hotmail=mutt--hotmail';
	alias 'l1=ls -1';
	alias 'l=ls';
	alias 'la1=ls -1a';
	alias 'la=ls -a';
	alias 'lal=ls -al';
	alias 'll=ls -l';
	alias 'lla=ls -al';
	alias 'login=exec /bin/login';
	alias 'newgrp=exec /usr/bin/newgrp';
	alias 'not=! ';
	alias 'posteo1=mutt--posteo1';
	alias 'posteo=mutt--posteo';
	alias 'redirect=exec ';
	alias 'sac=sudo /usr/bin/apt-cache';
	alias 'sag=sudo /usr/bin/apt-get';
	alias 'spool=mutt--spool';
	alias 'stop=kill -s STOP ';
	alias 'unsetenv=unset';
	alias 'wl=wless';
	alias 'wv=wvim';
	alias 'zeit=show-zeit';
};

ProfileRcBaseConsole ()
case $TERM in
	(linux*)
		# export TERM=linux-16color
		/usr/bin/setterm --blank 0 --powerdown 0 --powersave 0 \
			--bfreq 0 --blength 0 1>/dev/null 2>&1;
		/usr/bin/sudo /sbin/kbdrate -d 250 -r 30.0 1>/dev/null 2>&1;
		/usr/bin/sudo /usr/bin/loadkeys \
			"${XDG_CONFIG_HOME:?}/xmodmap/us-altgr-german.rc.map" 1>/dev/null 2>&1;
		/usr/bin/mesg y 2>/dev/null;
		if
			test -e "${XDG_RUNTIME_DIR:?}/DAYLIGHT";
		then
			printf '\e]P0eee8d5'; # S_base02
			printf '\e]P7073642'; # S_base2
			printf '\e]P8fdf6e3'; # S_base03
			printf '\e]PA93a1a1'; # S_base01
			printf '\e]PB839496'; # S_base00
			printf '\e]PC657b83'; # S_base0
			printf '\e]PE586e75'; # S_base1
			printf '\e]PF002b36'; # S_base3
		else
			printf '\e]P0073642'; # S_base02
			printf '\e]P7eee8d5'; # S_base2
			printf '\e]P8002b36'; # S_base03
			printf '\e]PA586e75'; # S_base01
			printf '\e]PB657b83'; # S_base00
			printf '\e]PC839496'; # S_base0
			printf '\e]PE93a1a1'; # S_base1
			printf '\e]PFfdf6e3'; # S_base3
		fi;
		/usr/bin/setterm -store;
esac;

ProfileRcBaseLocale () {
	LANG=en_US.UTF-8;

	#LC_ALL=
	LC_COLLATE=C;
	LC_CTYPE=$LANG;
	#LC_MESSAGES=
	#LC_NUMERIC=
	LC_TIME=C;

	export \
		LANG \
		LC_COLLATE \
		LC_CTYPE \
		LC_TIME;
};

ProfileRcBaseMail () {
	MAIL=/var/mail/$(/usr/bin/id -un);
	MAILCHECK=0;
	#MAILPATH=

	export \
		MAIL \
		MAILCHECK;
};

ProfileRcBaseTerminfo () {
	{
		TI_AM=$(/usr/bin/tput am);

		TI_BLACK_F=$(/usr/bin/tput setaf 0);
		TI_BLACK_F_BOLD=${TI_BOLD}${TI_BLACK_F};

		TI_BLUE_F=$(/usr/bin/tput setaf 4 || /usr/bin/tput AF 4);
		TI_BLUE_F_BOLD=${TI_BOLD}${TI_BLUE_F};

		TI_BOLD=$(/usr/bin/tput bold || /usr/bin/tput md);
		TI_CIVIS=$(/usr/bin/tput civis || /usr/bin/tput vi);
		TI_CLEAR=$(/usr/bin/tput clear);
		TI_CNORM=$(/usr/bin/tput cnorm || /usr/bin/tput ve);

		TI_CYAN_F=$(/usr/bin/tput setaf 6);
		TI_CYAN_F_BOLD=$TI_BOLD$TI_CYAN_F;

		TI_ED=$(/usr/bin/tput ed);
		TI_EL=$(/usr/bin/tput el || /usr/bin/tput ce);

		TI_GREEN_B=$(/usr/bin/tput setab 2);
		TI_GREEN_F=$(/usr/bin/tput setaf 2 || /usr/bin/tput AF 2);
		TI_GREEN_F_BOLD=$TI_BOLD$TI_GREEN_F;

		TI_HOME=$(/usr/bin/tput home);

		TI_PURPLE_F=$(/usr/bin/tput setaf 5);
		TI_PURPLE_F_BOLD=$TI_BOLD$TI_PURPLE_F;

		TI_RED_B=$(/usr/bin/tput setab 1);
		TI_RED_F=$(/usr/bin/tput setaf 1);
		TI_RED_F_BOLD=$TI_BOLD$TI_RED_F;

		TI_RMAM=$(/usr/bin/tput rmam);
		TI_RMCUP=$(/usr/bin/tput rmcup || /usr/bin/tput te);
		TI_SGR0=$(/usr/bin/tput sgr0 || /usr/bin/tput me);
		TI_SMCUP=$(/usr/bin/tput smcup || /usr/bin/tput ti);

		TI_WHITE_B=$(/usr/bin/tput setab 7);
		TI_WHITE_F=$(/usr/bin/tput setaf 7 || /usr/bin/tput AF 7);
		TI_WHITE_F_BOLD=$TI_BOLD$TI_WHITE_F;

		TI_YELLOW_B=$(/usr/bin/tput setab 3);
		TI_YELLOW_F=$(/usr/bin/tput setaf 3);
		TI_YELLOW_F_BOLD=$TI_BOLD$TI_YELLOW_F;
	} 2>/dev/null;

	export \
		TI_AM \
		TI_BLACK_F \
		TI_BLACK_F_BOLD \
		TI_BLUE_F \
		TI_BLACK_F_BOLD \
		TI_BOLD \
		TI_CIVIS \
		TI_CLEAR \
		TI_CNORM \
		TI_CYAN_F \
		TI_CYAN_F_BOLD \
		TI_ED \
		TI_EL \
		TI_GREEN_B \
		TI_GREEN_F \
		TI_GREEN_F_BOLD \
		TI_HOME \
		TI_PURPLE_F \
		TI_PURPLE_F_BOLD \
		TI_RED_B \
		TI_RED_F \
		TI_RED_F_BOLD \
		TI_RMAM \
		TI_RMCUP \
		TI_SGR0 \
		TI_SMCUP \
		TI_WHITE_B \
		TI_WHITE_F \
		TI_WHITE_F_BOLD \
		TI_YELLOW_B \
		TI_YELLOW_F \
		TI_YELLOW_F_BOLD;
};

ProfileRcBaseTz () {
	TZ=Europe/Berlin;
	export TZ;
};

ProfileRcBaseUser () {
	: "${XDG_BIN_HOME:?}";

	AUDIO_PLAYER=/usr/bin/mpv;
	AUDIO_PLAYER_OPTS=--no-video\|--replaygain=track;
	BROWSER=/usr/bin/elinks;
	BROWSER_OPTS=;
	EDITOR=/bin/ed;
	EDITOR_OPTS=-Gp\|\>\ ;
	FB_IMAGE_VIEWER=/usr/bin/fbi;
	FB_IMAGE_VIEWER_OPTS=;
	FCEDIT=$XDG_BIN_HOME/fc-edit;
	FILE_BROWSER=/usr/bin/vifm;
	FILE_BROWSER_OPTS=;
	IMAGE_VIEWER=/usr/bin/w3m;
	IMAGE_VIEWER_OPTS=-o\|ext_image_viewer=off\|-o\|imgdisplay=w3mimgdisplay;
	MAIL_VIEWER=/usr/bin/mutt;
	MAIL_VIEWER_OPTS=-n;
	PAGER=/usr/bin/less;
	PDF_VIEWER=/usr/bin/mupdf;
	PDF_VIEWER_OPTS=;
	READLINE_EDITOR=/usr/bin/rlwrap;
	READLINE_EDITOR_OPTS=-H/dev/null;
	TERMINAL_D=/usr/local/bin/st-dark;
	TERMINAL_D_OPTS=;
	TERMINAL_L=/usr/local/bin/st-light;
	TERMINAL_L_OPTS=;
	VISUAL=/usr/bin/vim;
	VISUAL_OPTS=-f;
	X_AUDIO_PLAYER=/usr/bin/mpv;
	X_AUDIO_PLAYER_OPTS=--profile=pseudo-gui\|--no-video\|--replaygain=track\|--autofit=50%x50%\|--no-stop-screensaver;
	X_BROWSER=$XDG_BIN_HOME/chromiumw;
	X_BROWSER_OPTS=;
	X_FILE_BROWSER=/usr/bin/spacefm;
	X_FILE_BROWSER_OPTS=
	X_IMAGE_VIEWER=/usr/bin/sxiv;
	X_IMAGE_VIEWER_OPTS=;
	X_MAIL_VIEWER=/usr/bin/claws-mail;
	X_MAIL_VIEWER_OPTS=;
	X_PDF_VIEWER=/usr/bin/mupdf;
	X_PDF_VIEWER_OPTS='-r$X_DPI';
	X_VIDEO_PLAYER=/usr/bin/mpv;
	X_VIDEO_PLAYER_OPTS=--autofit=50%x50%\|--stop-screensaver;
	X_VISUAL=/usr/bin/vim;
	X_VISUAL_OPTS=-gf;

	TMPDIR=/tmp/user/$(/usr/bin/id -u);
	/bin/mkdir -p "$TMPDIR";

	export \
		AUDIO_PLAYER \
		AUDIO_PLAYER_OPTS \
		BROWSER \
		BROWSER_OPTS \
		EDITOR \
		EDITOR_OPTS \
		FB_IMAGE_VIEWER \
		FB_IMAGE_VIEWER_OPTS \
		FCEDIT \
		FILE_BROWSER \
		FILE_BROWSER_OPTS \
		IMAGE_VIEWER \
		IMAGE_VIEWER_OPTS \
		MAIL_VIEWER \
		MAIL_VIEWER_OPTS \
		PAGER \
		PDF_VIEWER \
		PDF_VIEWER_OPTS \
		READLINE_EDITOR \
		READLINE_EDITOR_OPTS \
		TERMINAL_D \
		TERMINAL_D_OPTS \
		TERMINAL_L \
		TERMINAL_L_OPTS \
		VISUAL \
		VISUAL_OPTS \
		X_AUDIO_PLAYER \
		X_AUDIO_PLAYER_OPTS \
		X_BROWSER \
		X_BROWSER_OPTS \
		X_FILE_BROWSER \
		X_FILE_BROWSER_OPTS \
		X_IMAGE_VIEWER \
		X_IMAGE_VIEWER_OPTS \
		X_MAIL_VIEWER \
		X_MAIL_VIEWER_OPTS \
		X_PDF_VIEWER \
		X_PDF_VIEWER_OPTS \
		X_VIDEO_PLAYER \
		X_VIDEO_PLAYER_OPTS \
		X_VISUAL \
		X_VISUAL_OPTS \
		TMPDIR;
};

ProfileRcBaseXdg () {
	HOME=${HOME:-/home/$(/usr/bin/id -un)};

	XDG_VAR_HOME=$HOME/var;
	XDG_CONFIG_HOME=$HOME/etc;
	XDG_CONFIG_DIRS=/etc/xdg;
	XDG_DATA_DIRS=/usr/local/share:/usr/share;
	XDG_DATA_HOME=$HOME/share;
	#$XDG_RUNTIME_DIR="/run/user/1000";

	XDG_CACHE_HOME=$XDG_VAR_HOME/cache;

	XDG_BIN_HOME=$HOME/bin;
	XDG_BACKUP_HOME=/home/files/var/backups;
	XDG_OPT_HOME=$HOME/opt;
	XDG_SRC_HOME=$HOME/src;
	XDG_TMP_HOME=/home/files/tmp;

	test -r "$XDG_CONFIG_HOME/user-dirs.dirs" &&
		. "$XDG_CONFIG_HOME/user-dirs.dirs";

	export \
		XDG_BACKUP_HOME \
		XDG_BIN_HOME \
		XDG_CACHE_HOME \
		XDG_CONFIG_DIRS \
		XDG_CONFIG_HOME \
		XDG_DATA_DIRS \
		XDG_DATA_HOME \
		XDG_DESKTOP_DIR \
		XDG_DOCUMENTS_DIR \
		XDG_DOWNLOAD_DIR \
		XDG_MUSIC_DIR \
		XDG_OPT_HOME \
		XDG_PICTURES_DIR \
		XDG_PUBLICSHARE_DIR \
		XDG_SRC_HOME \
		XDG_TEMPLATES_DIR \
		XDG_TMP_HOME \
		XDG_VAR_HOME \
		XDG_VIDEOS_DIR;
};

ProfileRcBaseXdgExt () {
	test -r "$XDG_CONFIG_HOME/vars.priv" &&
		. "$XDG_CONFIG_HOME/vars.priv";
};

# vim: set ft=sh :
