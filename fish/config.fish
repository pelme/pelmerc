set PATH $HOME/bin $PATH

set fish_greeting ""

for filename in $HOME/.config/fish/config.d/*.fish
    source $filename
end
