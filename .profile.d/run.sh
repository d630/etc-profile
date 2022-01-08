#!/bin/sh
#
# ProfileRcRun.

ProfileRcRunGpg() {
    GPG_TTY=$(exec /usr/bin/tty)
    GPG_AGENT_INFO=

    export \
        GPP_TTY \
        GPG_AGENT_INFO

    command -- /usr/bin/gpg-connect-agent updatestartuptty /bye
}

ProfileRcRunKeychainInteractiv() {
    HOSTNAME=${HOSTNAME:-$(exec /usr/bin/uname -n)}
    HOME=${HOME:-/home/$(exec /usr/bin/id -un)}

    eval "$(
        exec /usr/bin/keychain \
            --eval \
            --quiet \
            --inherit any-once \
            --stop others \
            --systemd \
            --noask --lockwait 0 \
            --agents ssh "${X_HOST1_SSH_KEY:?}" 1>/dev/null 2>&1
    )"

    test -r "$HOME/.keychain/$HOSTNAME-sh" ||
        return "$?"
    . "$HOME/.keychain/$HOSTNAME-sh"

    test -r "$HOME/.keychain/$HOSTNAME-sh-gpg" &&
        . "$HOME/.keychain/$HOSTNAME-sh-gpg"
}

ProfileRcRunLsSet() {
    if test -e "${XDG_RUNTIME_DIR:?}/DAYLIGHT"; then
        \ProfileRcExtLs solarized/dircolors.ansi-light
    else
        if test "${TERM##*linux*}" = "$TERM"; then
            \ProfileRcExtLs solarized/dircolors.256dark
        else
            \ProfileRcExtLs solarized/dircolors.ansi-dark
        fi
    fi
}

# vim: set ft=sh :
