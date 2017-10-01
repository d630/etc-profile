#!/bin/sh
#
# ProfileRcRun.

ProfileRcRunDaylight () {
    "$XDG_BIN_HOME/"daylight;
};

ProfileRcRunEmacsd () {
    "$XDG_BIN_HOME/"daemonize /usr/bin/emacs --daemon;
};

ProfileRcRunGpg () {
    #killall gpg-agent 2>/dev/null
    # rm "${HOME}/local/var/cache/gpg-agent-info" 2>/dev/null
    #eval "$(gpg-agent --daemon)"
    export GPG_TTY=$(/usr/bin/tty);
    export GPG_AGENT_INFO=;
    /usr/bin/gpg-connect-agent updatestartuptty /bye;
};

ProfileRcRunKeychain () {
    eval "$(/usr/bin/keychain --eval -Q --agents ssh "$X_HOST1_SSH_KEY")";
};

ProfileRcRunKeychainInteractiv () {
    HOSTNAME=$(/bin/hostname);

    eval "$(
        /usr/bin/keychain \
            --eval --quiet \
            --inherit any-once --stop others \
            --systemd others \
            --noask --lockwait 0 \
            --agents ssh "$X_HOST1_SSH_KEY" 1>/dev/null 2>&1;
    )";

    if
        test -e "$HOME/.keychain/$HOSTNAME-sh";
    then
        . "$HOME/.keychain/$HOSTNAME-sh";
    else
        return 1;
    fi;

    if
        test -e "$HOME/.keychain/$HOSTNAME-sh-gpg";
    then
        . "$HOME/.keychain/$HOSTNAME-sh-gpg";
    else
        return 1;
    fi;
};

ProfileRcRunLsSet ()
if
    [ "${TERM##*linux*}" = "$TERM" ];
then
    if
        test -e "${XDG_RUNTIME_DIR:?}/DAYLIGHT";
    then
        \ProfileRcExtLs solarized/dircolors.ansi-light;
    else
        \ProfileRcExtLs solarized/dircolors.256dark;
    fi;
else
    if
        test -e "${XDG_RUNTIME_DIR:?}/"DAYLIGHT;
    then
        \ProfileRcExtLs solarized/dircolors.ansi-light;
    else
        \ProfileRcExtLs solarized/dircolors.ansi-dark;
    fi;
fi;

ProfileRcRunXCustoms () {
    if
        /usr/bin/xrandr |
        /bin/grep 'HDMI-1 disconnected';
    then
        /usr/bin/xrandr \
            --output eDP-1 --dpi 192 --auto \
            --output HDMI-1 --off;
        export X_DPI=192;
        "$XDG_BIN_HOME/"audio-device PCH;
    else
        /usr/bin/xrandr \
            --output HDMI-1 --dpi 96 --auto \
            --output eDP-1 --off;
        export X_DPI=96;
        "$XDG_BIN_HOME/"audio-device HDMI;
    fi;

    /usr/bin/xrdb -merge "$HOME/".Xresources;
    /usr/bin/xhost +si:localuser:"#$(/usr/bin/id -u)";

    case $X_XCLIENT in
        (bspwm)
            export _JAVA_AWT_WM_NONREPARENTING=1;;
        (cwm)
            export X_XCLIENT=openbsd-cwm;;
        (openbsd-cwm|spectrwm)
            :;;
        (*)
            export X_XCLIENT=x-terminal-tabbed;;
    esac;

    # /usr/bin/numlockx off;
    /usr/bin/setxkbmap -model pc105 -layout us \
        -variant altgr-intl -option compose:menu;
    /usr/bin/xmodmap "$XDG_CONFIG_HOME/"xmodmap/us-altgr-intl-german.rc;
    /usr/bin/xinput --disable FJ\ Camera;
    /usr/bin/xinput --disable SynPS/2\ Synaptics\ TouchPad;
    /usr/bin/xkbset m ma 60 10 10 5 2; /usr/bin/xkbset exp =m;
    /usr/bin/xprop -root \
        -remove _NET_NUMBER_OF_DESKTOPS \
        -remove _NET_DESKTOP_NAMES \
        -remove _NET_CURRENT_DESKTOP;
    /usr/bin/xset -dpms; /usr/bin/xset s off;
    /usr/bin/xset b off;
    /usr/bin/xset mouse 3 4;
    /usr/bin/xset r rate 220 150;
    /usr/bin/xsetroot -name "$X_XCLIENT";
    /usr/bin/xsetroot -cursor_name left_ptr;
};

ProfileRcRunXDaemons () {
    /usr/bin/touch "${XDG_RUNTIME_DIR:?}/".dunst_use_critical;
    "$XDG_BIN_HOME/"dunst-restart;

    /usr/bin/autocutsel -fork -selection PRIMARY -buttonup;
    /usr/bin/redshift -l $X_MY_LATITUDE1:$X_MY_LONGITUDE1 &
    /usr/bin/syndaemon -d -i 0.8;
    /usr/bin/unclutter -keystroke -idle 1 -root -noevents &

    "$XDG_BIN_HOME/"daemonize "$XDG_BIN_HOME/"xorg-autolock;
    "$XDG_BIN_HOME/"daemonize "$XDG_BIN_HOME/"clipbuffer -rc;

    /bin/ln -vsrf \
        "$XDG_CONFIG_HOME/"sxhkd/us-altgr-intl/sxhkdrc"_$X_XCLIENT" \
        "$XDG_CONFIG_HOME/"sxhkd/sxhkdrc;
    "$XDG_BIN_HOME/"sxhkd-restart;
};

# vim: set ts=4 sw=4 tw=0 et :
