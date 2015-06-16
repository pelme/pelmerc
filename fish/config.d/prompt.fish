function prompt_long_pwd --description 'Print the current working directory'
    echo $PWD | sed -e "s|^$HOME|~|" -e 's|^/private||'
end

set -g __fish_git_prompt_color_branch green bold

function fish_prompt --description 'Write out the prompt, Andreas style'

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    if set -q VIRTUAL_ENV
        echo -n -s (set_color cyan) "[" "$__fish_prompt_normal"
        echo -n -s (set_color -o cyan) (basename "$VIRTUAL_ENV") "$__fish_prompt_normal"
        echo -n -s (set_color cyan) "] " "$__fish_prompt_normal"
    end

    if not set -q IS_LOCAL
        echo -n -s "$USER" @ "$__fish_prompt_hostname" ' '
    end

    echo -n -s (__fish_git_prompt (set_color green)"[%s"(set_color green)"] ")
    echo -n -s (set_color normal) (prompt_long_pwd) "$__fish_prompt_normal"
    echo -n -s (set_color -o purple ) ' ➤  ' "$__fish_prompt_normal"
    echo -n -s "$__fish_prompt_normal"
end
