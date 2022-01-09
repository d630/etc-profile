#!/bin/sh
#
# ProfileRcBase.

ProfileRcBaseAlias() {
    alias 'sudo=/usr/bin/sudo -H --prompt="%u(%U): " '

    for p in /sbin/?* /usr/sbin/?*; do
        alias "${p##*/}=sudo $p"
    done
    unset -v p

    unalias 'mklost+found' 2>/dev/null

    alias 'o=open '

    alias 'about=o -A about -f'
    alias 'c=o -A compose -f'
    alias 'cdog=o -A cdog -f'
    alias 'dog=o -A dog -f'
    alias 'e=o -A edit -f'
    alias 'gc=o -A gcompose -f'
    alias 'ge=o -A gedit -f'
    alias 'gv=o -A gview -f'
    alias 'v=o -A view -f'
    alias 'vc=o -A vcompose -f'
    alias 've=o -A vedit -f'
    alias 'vv=o -A vview -f'

    alias "ed=/usr/bin/rlwrap /bin/ed -Gp '> '"
    alias 'chmod=/bin/chmod -v'
    alias 'chown=/bin/chown -v'
    alias 'cp=/bin/cp -v'
    alias 'dash=/usr/bin/rlwrap -ic /bin/dash'
    alias 'dc=/usr/bin/rlwrap /usr/bin/dc'
    alias 'df=/bin/df -h'
    alias 'dir=/bin/dir -h --color=never'
    alias 'du=/usr/bin/du -h'
    alias 'egrep=/bin/grep -E --color=auto'
    alias 'fgrep=/bin/grep -F --color=auto'
    alias 'grep=/bin/grep --color=auto'
    alias 'ln=/bin/ln -v'
    alias 'ls=/bin/ls -h --color=auto'
    alias 'mkdir=/bin/mkdir -v'
    alias 'mount=/bin/mount -v'
    alias 'mv=/bin/mv -v'
    alias 'nawk=/usr/bin/original-awk'
    alias 'nohup=/usr/bin/nohup '
    alias 'rgrep=/bin/grep -r --color=auto'
    alias 'rm=/bin/rm -v'
    alias 'rsync=/usr/bin/rsync -v'
    alias 'umount=/bin/umount -v'
    alias 'vdir=/bin/vdir -h --color=never'
    alias 'vf=/usr/bin/vifm'

    alias ':q=exit'
    alias ':x=exit'
    alias 'XX=. startx.sh'
    alias 'chdir=cd'
    alias 'command=command '
    alias 'd630=mutt--d630'
    alias 'dz=daemonize '
    alias 'forever=while :;'
    alias 'gmail=mutt--gmail'
    alias 'hotmail=mutt--hotmail'
    alias 'l1=ls -1'
    alias 'l=ls'
    alias 'la1=ls -1a'
    alias 'la=ls -a'
    alias 'lal=ls -al'
    alias 'll=ls -l'
    alias 'lla=ls -al'
    alias 'login=exec /bin/login'
    alias 'newgrp=exec /usr/bin/newgrp'
    alias 'not=! '
    alias 'posteo1=mutt--posteo1'
    alias 'posteo=mutt--posteo'
    alias 'redirect=exec '
    alias 'sac=sudo /usr/bin/apt-cache'
    alias 'sag=sudo /usr/bin/apt-get'
    alias 'spool=mutt--spool'
    alias 'stop=kill -s STOP '
    alias 'unsetenv=unset'
    alias 'wl=wless'
    alias 'wv=wvim'
}

ProfileRcBaseLocale() {
    LANG=en_US.UTF-8

    #LC_ALL=
    LC_COLLATE=C
    LC_CTYPE=$LANG
    #LC_MESSAGES=
    #LC_NUMERIC=
    LC_TIME=C

    export \
        LANG \
        LC_COLLATE \
        LC_CTYPE \
        LC_TIME
}

ProfileRcBaseMail() {
    MAIL=/var/mail/$(exec /usr/bin/id -un)
    MAILCHECK=0
    #MAILPATH=

    export \
        MAIL \
        MAILCHECK
}

ProfileRcBaseProduct() {
    PRODUCT_NAME_SUM=$(exec "${XDG_BIN_HOME:?}/get-product-name-as-sha256sum")
    export PRODUCT_NAME_SUM
}

ProfileRcBaseTz() {
    TZ=Europe/Berlin
    export TZ
}

ProfileRcBaseUser() {
    : "${XDG_BIN_HOME:?}"

    AUDIO_PLAYER=/usr/bin/mpv
    AUDIO_PLAYER_OPTS=--no-video\|--replaygain=track
    BROWSER=/usr/bin/elinks
    BROWSER_OPTS=
    EDITOR=/bin/ed
    EDITOR_OPTS=-Gp\|\>\
    FB_IMAGE_VIEWER=/usr/bin/fbi
    FB_IMAGE_VIEWER_OPTS=
    FCEDIT=$XDG_BIN_HOME/fc-edit
    FILE_BROWSER=/usr/bin/vifm
    FILE_BROWSER_OPTS=
    IMAGE_VIEWER=/usr/bin/w3m
    IMAGE_VIEWER_OPTS=-o\|ext_image_viewer=off\|-o\|imgdisplay=w3mimgdisplay
    MAIL_VIEWER=/usr/bin/mutt
    MAIL_VIEWER_OPTS=-n
    PAGER=/usr/bin/less
    PDF_VIEWER=/usr/bin/mupdf
    PDF_VIEWER_OPTS=
    READLINE_EDITOR=/usr/bin/rlwrap
    READLINE_EDITOR_OPTS=-H/dev/null
    TERMINAL_D=/usr/local/bin/st-dark
    TERMINAL_D_OPTS=
    TERMINAL_L=/usr/local/bin/st-light
    TERMINAL_L_OPTS=
    VISUAL=/usr/bin/vim
    VISUAL_OPTS=-f
    X_AUDIO_PLAYER=/usr/bin/mpv
    X_AUDIO_PLAYER_OPTS=--profile=pseudo-gui\|--no-video\|--replaygain=track\|--autofit=50%x50%\|--no-stop-screensaver
    X_BROWSER=$XDG_BIN_HOME/run-chromium
    X_BROWSER_OPTS=
    X_FILE_BROWSER=/usr/bin/spacefm
    X_FILE_BROWSER_OPTS=
    X_IMAGE_VIEWER=/usr/bin/sxiv
    X_IMAGE_VIEWER_OPTS=
    X_MAIL_VIEWER=/usr/bin/claws-mail
    X_MAIL_VIEWER_OPTS=
    X_PDF_VIEWER=/usr/bin/mupdf
    X_PDF_VIEWER_OPTS='-r$X_DPI'
    X_VIDEO_PLAYER=/usr/bin/mpv
    X_VIDEO_PLAYER_OPTS=--autofit=50%x50%\|--stop-screensaver
    X_VISUAL=/usr/bin/vim
    X_VISUAL_OPTS=-gf

    TMPDIR=/tmp/user/$(exec /usr/bin/id -u)
    command -- /bin/mkdir -p "$TMPDIR"

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
        TMPDIR
}

ProfileRcBaseXdg() {
    HOME=${HOME:-/home/$(exec /usr/bin/id -un)}

    XDG_VAR_HOME=$HOME/var
    XDG_CONFIG_HOME=$HOME/etc
    XDG_CONFIG_DIRS=/etc/xdg
    XDG_DATA_DIRS=/usr/local/share:/usr/share
    XDG_DATA_HOME=$HOME/share
    #$XDG_RUNTIME_DIR="/run/user/1000";

    XDG_CACHE_HOME=$XDG_VAR_HOME/cache

    XDG_BIN_HOME=$HOME/bin
    XDG_BACKUP_HOME=/home/files/var/backups
    XDG_OPT_HOME=$HOME/opt
    XDG_SRC_HOME=$HOME/src
    XDG_TMP_HOME=/home/files/tmp

    if test -r "$XDG_CONFIG_HOME/user-dirs.dirs"; then
        . "$XDG_CONFIG_HOME/user-dirs.dirs"
    fi

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
        XDG_VIDEOS_DIR
}

ProfileRcBaseXdgExt() {
    test -r "$XDG_CONFIG_HOME/vars.priv" &&
        . "$XDG_CONFIG_HOME/vars.priv"
}

# vim: set ft=sh :
