set --export PYTHONIOENCODING "UTF-8"
set --export VIRTUAL_ENV_DISABLE_PROMPT y
set --export FLAKE8_STRICT t

source ~/.pelmerc/fish/external/virtualfish/virtualfish/virtual.fish

# status --is-interactive; and source (pyenv init -|psub)
# status --is-interactive; and source (pyenv virtualenv-init -|psub)

pyenv init - | source
