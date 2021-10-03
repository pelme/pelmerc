set --export PYTHONIOENCODING "UTF-8"
set --export VIRTUAL_ENV_DISABLE_PROMPT y
set --export FLAKE8_STRICT t

status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source
