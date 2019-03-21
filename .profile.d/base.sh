#!/bin/sh
#
# ProfileRcBase.

ProfileRcBaseAlias () {
	local p;
	for p in /sbin/?* /usr/sbin/?*
	do
		alias "${p##*/}=sudo $p ";
	done;

    alias 'command=command ';
    alias 'ls=/bin/ls -h --color=auto';
    alias 'mkdir=/bin/mkdir -v';
    alias 'o=open ';
    alias 'sudo=/usr/bin/sudo -H --prompt="%u(%U): " ';

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

    alias 'L=/bin/less -L';
    alias 'chmod=/bin/chmod -v';
    alias 'chown=/bin/chown -v';
    alias 'console-color=\ProfileRcBaseConsole';
    alias 'cp=/bin/cp -v';
    alias 'd=/usr/local/bin/dacti';
    alias 'dash=/usr/bin/rlwrap -ic /bin/dash';
    alias 'dc=/usr/bin/rlwrap /usr/bin/dc';
    alias 'df=/bin/df -h';
    alias 'diff=/usr/bin/colordiff';
    alias 'dir=/bin/dir -h --color=never';
    alias 'du=/usr/bin/du -h';
    alias "ed=/usr/bin/rlwrap /bin/ed -Gp '> '";
    alias 'egrep=/bin/grep -E --color=auto';
    alias 'fgrep=/bin/grep -F --color=auto';
    alias 'gcc=/usr/bin/colorgcc';
    alias 'grep=/bin/grep --color=auto';
    alias 'l1=ls -1';
    alias 'l=ls';
    alias 'la1=ls -1a';
    alias 'la=ls -a';
    alias 'lal=ls -al';
    alias 'll=ls -l';
    alias 'lla=ls -al';
    alias 'ln=/bin/ln -v';
    alias 'm=mkdir -p';
    alias 'make=/usr/bin/colormake';
    alias 'mv=/bin/mv -v';
    alias 'nawk=/usr/bin/original-awk';
    alias 'nohup=/usr/bin/nohup ';
    alias 'rgrep=/bin/grep -r --color=auto';
    alias 'rm=/bin/rm -v';
    alias 'rsync=/usr/bin/rsync -v';
    alias 'sac=sudo /usr/bin/apt-cache';
    alias 'sag=sudo /usr/bin/apt-get';
    alias 'tail=/usr/bin/colortail';
    alias 'vdir=/bin/vdir -h --color=never';
    alias 'vf=/usr/bin/vifm';

    alias 'XX=. startx.sh';
    alias 'ap=audio-player';
    alias 'd630=mutt--d630';
    alias 'dz=daemonize ';
    alias 'fb=file-browser';
    alias 'ff=find-file';
    alias 'filetest=tcsh--filetest';
    alias 'fs=find-string';
    alias 'gmail=mutt--gmail';
    alias 'hotmail=mutt--hotmail';
    alias 'posteo1=mutt--posteo1';
    alias 'posteo=mutt--posteo';
    alias 's=setsidw ';
    alias 'spool=mutt--spool';
    alias 't=x-terminal ';
    alias 'wl=wless';
    alias 'wv=wvim';
    alias 'xap=x-audio-player';
    alias 'xiv=x-image-viewer';
    alias 'xpv=x-pdf-viewer';
    alias 'xvp=x-video-player';
    alias 'zeit=show-zeit';

    alias ':q=exit';
    alias ':x=exit';
    alias 'chdir=cd';
    alias 'login=exec /bin/login';
    alias 'newgrp=exec /usr/bin/newgrp';
    alias 'not=! ';
    alias 'p=pwd';
    alias 'redirect=exec ';
    alias 'stop=kill -s STOP ';
    alias 'unsetenv=unset';
};

ProfileRcBaseConsole ()
case $TERM in
    (linux*)
        # export TERM=linux-16color
        /usr/bin/setterm --blank 0 --powerdown 0 --powersave 0 \
            --bfreq 0 --blength 0 1>/dev/null 2>&1;
        /usr/bin/sudo /sbin/kbdrate -d 250 -r 30.0 1>/dev/null 2>&1;
        /usr/bin/sudo /usr/bin/loadkeys \
            "$XDG_CONFIG_HOME/"xmodmap/us-altgr-german.rc.map 1>/dev/null 2>&1;
        /usr/bin/mesg y 2>/dev/null;
        if
            test -e "$XDG_RUNTIME_DIR/"DAYLIGHT;
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
	export \
		LC_COLLATE \
		LC_CTYPE;

    #LANG=
    #              Used  to  determine the locale category for any category
    #              not specifically selected with a variable starting  with
    #              LC_.
    #LC_ALL=
    #              This  variable overrides the value of LANG and any other
    #              LC_ variable specifying a locale category.
    LC_COLLATE=C;
    #              This variable determines the collation order  used  when
    #              sorting  the  results  of pathname expansion, and deter‐
    #              mines the behavior  of  range  expressions,  equivalence
    #              classes,  and collating sequences within pathname expan‐
    #              sion and pattern matching.
    LC_CTYPE=$LANG;
    #              This variable determines the interpretation  of  charac‐
    #              ters  and the behavior of character classes within path‐
    #              name expansion and pattern matching.
    #LC_MESSAGES=
    #              This variable determines the locale  used  to  translate
    #              double-quoted strings preceded by a $.
    #LC_NUMERIC=
    #              This  variable  determines  the locale category used for
    #              number formatting.
};

ProfileRcBaseMail () {
	export \
		MAIL \
		MAILCHECK;

    MAIL=/var/mail/$USER;
    #     The name of a mail file, that will be checked for the
    #     arrival of new mail.  Overridden by MAILPATH.
    MAILCHECK=0;
    #     The frequency in seconds that the shell checks for the
    #     arrival of mail in the files specified by the MAILPATH
    #     or the MAIL file.  If set to 0, the check will occur
    #     at each prompt.
    #MAILPATH=
    #     A colon “:” separated list of file names, for the
    #     shell to check for incoming mail.  This environment
    #     setting overrides the MAIL setting.  There is a maxi‐
    #     mum of 10 mailboxes that can be monitored at once.
};

ProfileRcBaseTerminfo () {
    local -;
    set -a;

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
};

ProfileRcBaseTz () {
    export TZ;
    TZ=Europe/Berlin;
};

ProfileRcBaseUser () {
	local -;
	set -a;

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
	PAGER=/bin/less;
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
};

ProfileRcBaseXdg () {
    local -;
    set -a;

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

    test -f "$XDG_CONFIG_HOME/"user-dirs.dirs &&
        . "$XDG_CONFIG_HOME/"user-dirs.dirs;
};

ProfileRcBaseXdgExt () {
    test -f "$XDG_CONFIG_HOME/"vars.priv &&
        . "$XDG_CONFIG_HOME/"vars.priv;
};

# vim: set ft=sh :
