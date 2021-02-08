function prompt_long_pwd --description 'Print the current working directory'
    echo $PWD | sed -e "s|^$HOME|~|" -e 's|^/private||'
end


set -g __pelme_start_char ""
set -g __pelme_end_char ""
set -g __pelme_prompt_symbol "\$"
set -g __pelme_git_color green
set -g __pelme_virtualenv_color cyan
set -g __pelme_poetry_color yellow

set -g __fish_git_prompt_color_branch $__pelme_git_color --bold

function fish_prompt --description 'Write out the prompt, Andreas style'

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    if set -q POETRY_ACTIVE
        echo -n -s (set_color $__pelme_poetry_color) $__pelme_start_char "$__fish_prompt_normal"
        echo -n -s (set_color -o $__pelme_poetry_color) poetry  "$__fish_prompt_normal"
        echo -n -s (set_color $__pelme_poetry_color) $__pelme_end_char " $__fish_prompt_normal"
    else if set -q VIRTUAL_ENV
        echo -n -s (set_color $__pelme_virtualenv_color) $__pelme_start_char "$__fish_prompt_normal"
        echo -n -s (set_color -o $__pelme_virtualenv_color) (basename "$VIRTUAL_ENV") "$__fish_prompt_normal"
        echo -n -s (set_color $__pelme_virtualenv_color) $__pelme_end_char " $__fish_prompt_normal"
    end

    if not set -q IS_LOCAL
        echo -n -s "$USER" @ "$__fish_prompt_hostname" ' '
    end

    echo -n -s (__fish_git_prompt (set_color $__pelme_git_color)$__pelme_start_char"%s"(set_color $__pelme_git_color)$__pelme_end_char" ")
    echo -n -s (set_color normal) (prompt_long_pwd) "$__fish_prompt_normal"
    echo -n -s (set_color -o purple ) " " $__pelme_prompt_symbol " $__fish_prompt_normal"
end
