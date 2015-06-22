if not set -q __pelme_short_hostname
    set -g __pelme_short_hostname (hostname|cut -d . -f 1)
end

function fish_title
    echo -ns (prompt_pwd) " - " $USER @ $__pelme_short_hostname
end
