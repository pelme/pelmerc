if not set -q __pelme_short_hostname
    set -g __pelme_short_hostname (hostname|cut -d . -f 1)
end

function fish_title
    echo -ns $USER @ $__pelme_short_hostname : (prompt_pwd)
end
