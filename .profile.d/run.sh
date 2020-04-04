#!/bin/sh
#
# ProfileRcRun.

ProfileRcRunGpg () {
	GPG_TTY=$(/usr/bin/tty);
	GPG_AGENT_INFO=;

	export \
		GPP_TTY \
		GPG_AGENT_INFO;

	/usr/bin/gpg-connect-agent updatestartuptty /bye;
};

ProfileRcRunKeychainInteractiv () {
	HOSTNAME=${HOSTNAME:-$(/bin/hostname)};
	HOME=${HOME:-/home/$(/usr/bin/id -un)};

	eval "$(
		/usr/bin/keychain \
			--eval \
			--quiet \
			--inherit any-once \
			--stop others \
			--systemd others \
			--noask --lockwait 0 \
			--agents ssh "${X_HOST1_SSH_KEY:?}" 1>/dev/null 2>&1;
	)";

	test -r "$HOME/.keychain/$HOSTNAME-sh" ||
		return "$?";
	. "$HOME/.keychain/$HOSTNAME-sh";

	test -r "$HOME/.keychain/$HOSTNAME-sh-gpg" &&
		. "$HOME/.keychain/$HOSTNAME-sh-gpg";
};

ProfileRcRunLsSet () {
	if
		test -e "${XDG_RUNTIME_DIR:?}/DAYLIGHT";
	then
		\ProfileRcExtLs solarized/dircolors.ansi-light;
	else
		if
			test "${TERM##*linux*}" = "$TERM";
		then
			\ProfileRcExtLs solarized/dircolors.256dark;
		else
			\ProfileRcExtLs solarized/dircolors.ansi-dark;
		fi;
	fi;
};

# vim: set ft=sh :
