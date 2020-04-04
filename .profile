#!/bin/sh
#
# $HOME/.profile
#
# On Debian, this file will session-widely be sourced by all
#  Bourne-compatible shells upon console logins (getty(8) -> login(1) ->
#  /etc/pam.d/login, module PAM pam_env(8)) and remote shell logins (sshd(8)
#  -> /etc/pam.d/ssh, module PAM pam_env(8)) after reading
#  - /etc/security/pam_env.conf
#  - /etc/environment or $HOME/.pam_environment
#  - /etc/default/locale
#  and after exec(2) a login shell, which is configured in /etc/passwd
#  and loads /etc/profile (-> /etc/profile.d/*).
#
# If the login is handled with a display manager like xdm(1) for having a
#  graphical login into X and not with xinit(1)/startx(1), no login shell is
#  executed. Because of that, we need to set environments during processing
#  of /etc/X11/Xsession (-> $HOME/.xsessionrc, -> $HOME/.xsession).
#
# bash(1) as login shell looks first for $HOME/.bash_profile and then for
#  $HOME/.bash_login. If false, then it looks for $HOME/.profile.
#  Before that, bash(1) sources /system-widely etc/bash.bashrc and reads
#  /usr/share/bash-completion/bash_completion and/or /etc/bash_completion/*,
#  if that has been configured in /etc/profile.
#
# So, no *isms here!

umask 027;

export ENV;
ENV=$HOME/.profilerc;
{
	ulimit -n "$(($(ulimit -n) * 8))";
	ulimit -s "$(($(ulimit -s) * 8))";
	ulimit -c 0;
} 2>/dev/null;

. "$HOME/.profile.d/base.sh";
\ProfileRcBaseXdg;
\ProfileRcBaseXdgExt;
\ProfileRcBaseLocale;
\ProfileRcBaseMail;
\ProfileRcBaseTz;
\ProfileRcBaseUser;
\ProfileRcBaseTerminfo;

. "$HOME/.profile.d/ext.sh";
\ProfileRcExtAtSpi;
\ProfileRcExtBc;
\ProfileRcExtCabal;
\ProfileRcExtFreetype;
\ProfileRcExtGo;
\ProfileRcExtInfo;
\ProfileRcExtJava;
\ProfileRcExtLess;
\ProfileRcExtMan;
\ProfileRcExtNet;
\ProfileRcExtNode;
\ProfileRcExtNodeNpm;
\ProfileRcExtPerl;
\ProfileRcExtPerlCpanm;
\ProfileRcExtPhpComposer;
\ProfileRcExtPython;
\ProfileRcExtPyenv;
\ProfileRcExtReadline;
\ProfileRcExtRustCargo;
\ProfileRcExtTaskum;
\ProfileRcExtTerminfo;
\ProfileRcExtTex;
\ProfileRcExtUrimark;
\ProfileRcExtUrldiff;
\ProfileRcExtX;

export PATH;
PATH=;
while
	read -r p;
do
	PATH=$p:$PATH;
done <<P
/bin
/sbin
/usr/games
/usr/bin
/usr/sbin
/usr/local/games
/usr/local/bin
/usr/local/sbin
/snap/bin
$HOME/bin
$HOME/sbin
$CARGO_HOME/bin
$COMPOSER_HOME/vendor/bin
$GOPATH/bin
$PERL_LOCAL_LIB_ROOT/bin
$PYTHONUSERBASE/bin
$PYENV_ROOT/bin
$XDG_OPT_HOME/cabal/bin
$XDG_OPT_HOME/npm/bin
P

PATH=${PATH%:};
unset -v p;

test "${-##*i*}" = "$-" || {
	. "$HOME/.profile.d/run.sh";

	\ProfileRcRunGpg;
	eval "$(/usr/bin/keychain --eval -Q --agents ssh "${X_HOST1_SSH_KEY:?}")";

	"${XDG_BIN_HOME:?}/daylight";

	\ProfileRcBaseConsole;

	unalias -a;
	\ProfileRcBaseAlias;
};

\ProfileRcExtDbus;

# vim: set ft=sh :
