export PELMERC=$HOME/.pelmerc

[[ -e ~/.pelmerc.local ]] && source ~/.pelmerc.local

### OH-MY-ZSH
ZSH=$HOME/.pelmerc/oh-my-zsh
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_UPDATE="true"
plugins=(git brew django osx pip github)


__git_files () {
    _wanted files expl 'local files' _files
}
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/bin:/usr/local/bin:$PATH"

for x in $PELMERC/zsh/*; do
    source $x
done

source $PELMERC/autoenv/activate.sh
if [ -e /Users/andreas/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/andreas/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
